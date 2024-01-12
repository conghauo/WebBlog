package main

import (
	"context"
	"database/sql"
	"encoding/base64"
	"encoding/json"
	"errors"
	"fmt"
	"log"
	"net/http"
	"regexp"
	"strconv"
	"strings"
	"time"

	_ "github.com/go-sql-driver/mysql"
	"github.com/google/uuid"
	"github.com/gorilla/websocket"
	"gitlab.com/hartsfield/gmailAPI"
	"gitlab.com/hartsfield/inboxer"
	gmail "google.golang.org/api/gmail/v1"
)

const (
	// Max wait time when writing message to peer
	writeWait = 10 * time.Second

	// Max time till next pong from peer
	pongWait = 60 * time.Second

	// Send ping interval, must be less then pong wait time
	pingPeriod = (pongWait * 9) / 10

	// Maximum message size allowed from peer.
	maxMessageSize = 10000
)

var (
	newline = []byte{'\n'}
	space   = []byte{' '}
)

var upgrader = websocket.Upgrader{
	ReadBufferSize:  4096,
	WriteBufferSize: 4096,
}

type TimeJoin struct {
	// The actual websocket connection.
	connect   bool      `json:"connect"`
	startTime time.Time `json:"startTime"`
	endTime   time.Time `json:"endTime"`
}

// Client represents the websocket client at the server
type Client struct {
	// The actual websocket connection.
	conn     *websocket.Conn
	wsServer *WsServer
	send     chan []byte
	ID       uuid.UUID `json:"id"`
	Name     string    `json:"name"`
	myRoom   *Room
	rooms    map[*Room]TimeJoin //bool
}

func newClient(conn *websocket.Conn, wsServer *WsServer, name string) *Client {
	return &Client{
		ID:       uuid.New(),
		Name:     name,
		conn:     conn,
		wsServer: wsServer,
		send:     make(chan []byte, 256),
		rooms:    make(map[*Room]TimeJoin),
	}

}

func (client *Client) readPump() {
	defer func() {
		client.disconnect()
	}()

	client.conn.SetReadLimit(maxMessageSize)
	client.conn.SetReadDeadline(time.Now().Add(pongWait))
	client.conn.SetPongHandler(func(string) error { client.conn.SetReadDeadline(time.Now().Add(pongWait)); return nil })

	// Start endless read loop, waiting for messages from client
	for {
		_, jsonMessage, err := client.conn.ReadMessage()
		if err != nil {
			if websocket.IsUnexpectedCloseError(err, websocket.CloseGoingAway, websocket.CloseAbnormalClosure) {
				log.Printf("unexpected close error: %v", err)
			}
			break
		}

		client.handleNewMessage(jsonMessage)
	}

}

func (client *Client) writePump() {
	ticker := time.NewTicker(pingPeriod)
	defer func() {
		ticker.Stop()
		client.conn.Close()
	}()
	for {
		select {
		case message, ok := <-client.send:
			client.conn.SetWriteDeadline(time.Now().Add(writeWait))
			if !ok {
				// The WsServer closed the channel.
				client.conn.WriteMessage(websocket.CloseMessage, []byte{})
				return
			}

			w, err := client.conn.NextWriter(websocket.TextMessage)
			if err != nil {
				return
			}
			w.Write(message)

			// Attach queued chat messages to the current websocket message.
			n := len(client.send)
			for i := 0; i < n; i++ {
				w.Write(newline)
				w.Write(<-client.send)
			}

			if err := w.Close(); err != nil {
				return
			}
		case <-ticker.C:
			client.conn.SetWriteDeadline(time.Now().Add(writeWait))
			if err := client.conn.WriteMessage(websocket.PingMessage, nil); err != nil {
				return
			}
		}
	}
}

func (client *Client) disconnect() {
	client.wsServer.unregister <- client
	for room := range client.rooms {
		message := Message{
			Action:  LeaveRoomAction,
			Message: room.GetId(),
		}
		client.handleLeaveRoomMessage(message)
		room.unregister <- client
	}
	close(client.send)
	client.conn.Close()
}

// ServeWs handles websocket requests from clients requests.
func ServeWs(wsServer *WsServer, w http.ResponseWriter, r *http.Request) {

	name, ok := r.URL.Query()["name"]

	if !ok || len(name[0]) < 1 {
		log.Println("Url Param 'name' is missing")
		return
	}
	upgrader.CheckOrigin = func(r *http.Request) bool { return true }
	conn, err := upgrader.Upgrade(w, r, nil)
	if err != nil {
		log.Println(err)
		return
	}

	client := newClient(conn, wsServer, name[0])

	go client.writePump()
	go client.readPump()

	wsServer.register <- client
}

func (client *Client) handleNewMessage(jsonMessage []byte) {

	var message Message
	if err := json.Unmarshal(jsonMessage, &message); err != nil {
		log.Printf("Error on unmarshal JSON message %s", err)
		return
	}

	message.Sender = client

	switch message.Action {
	case SendMessageAction:
		roomID := message.Target.GetId()
		if room := client.wsServer.findRoomByID(roomID); room != nil {
			room.broadcast <- &message
		}

	case JoinRoomAction:
		client.handleJoinRoomMessage(message)

	case LeaveRoomAction:
		client.handleLeaveRoomMessage(message)

	case JoinRoomPrivateAction:
		client.handleJoinRoomPrivateMessage(message)
	case PaymentAction:
		client.handlePaymentAction(message, 3)
	}

}

// decodeEmailBody is used to decode the email body by converting from
// URLEncoded base64 to a string.
func decodeEmailBody(data string) (string, error) {
	decoded, err := base64.URLEncoding.DecodeString(data)
	if err != nil {
		return "", err
	}
	return string(decoded), nil
}
func GetBodyHandle(msg *gmail.Message) (string, error) {
	// Loop through the message payload parts to find the parts with the
	// mimetypes we want.

	for _, v := range msg.Payload.Parts {
		if v.MimeType == "multipart/alternative" {
			for _, l := range v.Parts {
				if (l.MimeType == "text/plain" || l.MimeType == "text/html") && l.Body.Size >= 1 {
					dec, err := decodeEmailBody(l.Body.Data)
					if err != nil {
						return "", err
					}
					return dec, nil
				}
			}
		}
		if (v.MimeType == "text/plain" || v.MimeType == "text/html") && v.Body.Size >= 1 {
			dec, err := decodeEmailBody(v.Body.Data)
			if err != nil {
				return "", err
			}
			return dec, nil
		}
	}

	if (msg.Payload.MimeType == "text/plain" || msg.Payload.MimeType == "text/html") && msg.Payload.Body.Size >= 1 {
		dec, err := decodeEmailBody(msg.Payload.Body.Data)
		if err != nil {
			return "", err
		}
		return dec, nil
	}
	return "", errors.New("Couldn't Read Body")
}

type PaymentHistory struct {
	Id         int
	Username   string
	pay_at     time.Time
	Seconds    int
	quantity   int
	amount     int
	created_at string
	updated_at string
}

func (client *Client) parseEmail(message string) (string, error) {
	// Connect to the gmail API service.
	ctx := context.Background()
	srv := gmailAPI.ConnectToService(ctx, gmail.GmailComposeScope)
	// num will be -1 on err
	currentTime := time.Now().Format("2006-01-02")
	msgs, err := inboxer.Query(srv, "from:mailalert@acb.com.vn after:"+currentTime)
	if err != nil {
		return "", errors.New("Couldn't Connect GMail")
	}
	re := regexp.MustCompile(`\r\n`)
	mess := strings.TrimSpace(re.ReplaceAllString(message, " "))
	decode, err := base64.StdEncoding.DecodeString(mess)
	var jsonMess PayMess
	if err == nil {
		err := json.Unmarshal(decode, &jsonMess)
		if err != nil {
			fmt.Println("error parse json %s", err)
			fmt.Println("error parse json %s", string(decode))
		}
	}

	messRe := regexp.MustCompile(`[^a-zA-Z0-9]`)
	message = messRe.ReplaceAllString(message, "")

	// Range over the messages
	for _, msg := range msgs {
		time, err := inboxer.ReceivedTime(msg.InternalDate)
		if err != nil {
			return "", errors.New("Couldn't Parse Time")
		}

		db, err := sql.Open("mysql", "flarumuser:123456test@tcp(127.0.0.1:3306)/flarumdb?parseTime=true")
		defer db.Close()
		if err != nil {
			log.Fatal(err)
		}
		str := "SELECT * FROM history_payments WHERE username='" + client.Name + "' AND pay_at >= '" + currentTime + "'"
		res, err := db.Query(str)
		defer res.Close()
		if err != nil {
			log.Fatal(err)
		}
		paid := false
		for res.Next() {
			paid = true
			var payHistory PaymentHistory
			err := res.Scan(&payHistory.Id, &payHistory.Username, &payHistory.pay_at, &payHistory.quantity, &payHistory.amount, &payHistory.created_at, &payHistory.updated_at)
			if err != nil {
				log.Fatal(err)
			}
			if payHistory.pay_at != time {
				fmt.Println("Date: ", time)
				//md := inboxer.GetPartialMetadata(msg)
				body, err := GetBodyHandle(msg)
				if err != nil {
					return "", errors.New("Couldn't Read Body")
				}
				re := regexp.MustCompile(`\r\n`)
				body = strings.ToUpper(re.ReplaceAllString(body, " "))
				message = strings.ToUpper(strings.TrimSpace(re.ReplaceAllString(message, " ")))

				if strings.Contains(body, message) {
					re2 := regexp.MustCompile(`,`)
					body = re2.ReplaceAllString(body, "")
					if strings.Contains(body, strconv.Itoa(jsonMess.A)) {
						sqlStatement := "INSERT INTO history_payments(username,pay_at,quantity,amount) VALUES (" + "'" + client.Name + "','" + strings.Replace(time.String(),"+0000 UTC","",-1) + "'," + strconv.Itoa(jsonMess.Q) + "," + strconv.Itoa(jsonMess.A) + ");"
						fmt.Println(sqlStatement)
						_, err := db.Exec(sqlStatement)
						if err != nil {
							log.Fatal(err)
						}

						return body, nil
					}
				}
			}
		}
		if !(paid) {
			fmt.Println("Date: ", time)
			//md := inboxer.GetPartialMetadata(msg)
			body, err := GetBodyHandle(msg)
			if err != nil {
				return "", errors.New("Couldn't Read Body")
			}
			re := regexp.MustCompile(`\r\n`)
			body = strings.ToUpper(re.ReplaceAllString(body, " "))
			message = strings.ToUpper(strings.TrimSpace(re.ReplaceAllString(message, " ")))

			if strings.Contains(body, message) {
				re2 := regexp.MustCompile(`,`)
				body = re2.ReplaceAllString(body, "")
				if strings.Contains(body, strconv.Itoa(jsonMess.A)) {
					sqlStatement := "INSERT INTO history_payments(username,pay_at,quantity,amount) VALUES (" + "'" + client.Name + "','" + strings.Replace(time.String(),"+0000 UTC","",-1) + "'," + strconv.Itoa(jsonMess.Q) + "," + strconv.Itoa(jsonMess.A) + ");"
					fmt.Println(sqlStatement)
					_, err := db.Exec(sqlStatement)
					if err != nil {
						log.Fatal(err)
					}
					return body, nil
				}
			}
		}
	}
	return "", errors.New("Couldn't Read Body")
}

type PayMess struct {
	Q int `json:"q"`
	A int `json:"a"`
}

func (client *Client) handlePaymentAction(message Message, loopCount int) {
	_, errParseEmail := client.parseEmail(message.Message)
	// Creating channel using
	// make keywork
	if errParseEmail != nil && loopCount > 0 {
		time.AfterFunc(3*time.Minute, func() {
			loopCount = loopCount - 1
			client.handlePaymentAction(message, loopCount)
		})
	}
	re := regexp.MustCompile(`\r\n`)
	mess := strings.TrimSpace(re.ReplaceAllString(message.Message, " "))
	decode, err := base64.StdEncoding.DecodeString(mess)
	var jsonMess PayMess
	if err == nil {
		err := json.Unmarshal(decode, &jsonMess)
		if err != nil {
			fmt.Println("error parse json %s", err)
			fmt.Println("error parse json %s", string(decode))
		}
	}
	if errParseEmail == nil {
		//add time
		db, err := sql.Open("mysql", "flarumuser:123456test@tcp(127.0.0.1:3306)/flarumdb")
		defer db.Close()
		if err != nil {
			log.Fatal(err)
		}
		str := "SELECT * FROM user_times WHERE username='" + client.Name + "'"
		res, err := db.Query(str)
		defer res.Close()
		if err != nil {
			log.Fatal(err)
		}
		var timeuser = ""
		for res.Next() {
			var userTimes UserTimes
			err := res.Scan(&userTimes.Id, &userTimes.UserId, &userTimes.Username, &userTimes.Mins, &userTimes.Seconds, &userTimes.created_at, &userTimes.updated_at)
			timeuser = strconv.Itoa(userTimes.Mins) + "m" + strconv.Itoa(userTimes.Seconds) + "s"
			if err != nil {
				log.Fatal(err)
			}
		}
		h, _ := time.ParseDuration(timeuser)
		newTime := h.Seconds() + (float64)(jsonMess.Q)*60
		seconds := (int)(newTime) % 60
		mins := ((int)(newTime) - seconds) / 60
		sqlStatement := "UPDATE user_times SET mins=" + strconv.Itoa(mins) + ", seconds=" + strconv.Itoa(seconds) + " WHERE username='" + client.Name + "' ;"
		res2, err := db.Exec(sqlStatement)
		if err != nil {
			log.Fatal(err)
		}
		_, errA := res2.RowsAffected()
		if errA != nil {
			log.Fatal(errA)
		}

		message := Message{
			Action:  JoinRoomPrivateAction,
			Message: string(client.ID.String()),
		}
		client.handleJoinRoomPrivateMessage(message)
		message2 := Message{
			Action:  SendMessageAction,
			Target:  client.myRoom,
			Sender:  client,
			Message: "Success Payment",
		}
		client.send <- message2.encode()
	}
}

func (client *Client) handleJoinRoomMessage(message Message) {
	roomName := message.Message

	client.joinRoom(roomName, nil)
}

type UserTimes struct {
	Id         int
	UserId     int
	Username   string
	Mins       int
	Seconds    int
	created_at string
	updated_at string
}

func (client *Client) handleLeaveRoomMessage(message Message) {
	room := client.wsServer.findRoomByID(message.Message)
	if room == nil {
		return
	}
	db, err := sql.Open("mysql", "flarumuser:123456test@tcp(127.0.0.1:3306)/flarumdb")
	defer db.Close()

	if err != nil {
		log.Fatal(err)
	}
	str := "SELECT * FROM user_times WHERE username='" + client.Name + "'"
	res, err := db.Query(str)

	defer res.Close()
	if err != nil {
		log.Fatal(err)
	}
	var timeuser = ""
	for res.Next() {
		var userTimes UserTimes
		err := res.Scan(&userTimes.Id, &userTimes.UserId, &userTimes.Username, &userTimes.Mins, &userTimes.Seconds, &userTimes.created_at, &userTimes.updated_at)
		timeuser = strconv.Itoa(userTimes.Mins) + "m" + strconv.Itoa(userTimes.Seconds) + "s"
		if err != nil {
			log.Fatal(err)
		}
	}

	if value, ok := client.rooms[room]; ok {

		if client.myRoom != room {
			value.endTime = time.Now()
			countTime := value.endTime.Sub(value.startTime).Seconds()
			h, _ := time.ParseDuration(timeuser)
			newTime := h.Seconds() - countTime
			seconds := (int)(newTime) % 60
			mins := ((int)(newTime) - seconds) / 60
			sqlStatement := "UPDATE user_times SET mins=" + strconv.Itoa(mins) + ", seconds=" + strconv.Itoa(seconds) + " WHERE username='" + client.Name + "' ;"

			res, err := db.Exec(sqlStatement)
			if err != nil {
				log.Fatal(err)
			}
			_, errA := res.RowsAffected()
			if errA != nil {
				log.Fatal(errA)
			}
		}
		delete(client.rooms, room)
	}

	room.unregister <- client
}

func (client *Client) handleJoinRoomPrivateMessage(message Message) {

	target := client.wsServer.findClientByID(message.Message)

	if target == nil {
		return
	}

	// create unique room name combined to the two IDs
	roomName := message.Message + client.ID.String()

	client.joinRoom(roomName, target)
	target.joinRoom(roomName, client)

}

func (client *Client) joinRoom(roomName string, sender *Client) {

	room := client.wsServer.findRoomByName(roomName)
	if room == nil {
		room = client.wsServer.createRoom(roomName, sender != nil)
	}
	if roomName == client.ID.String()+client.ID.String() {
		client.myRoom = room
	}
	// Don't allow to join private rooms through public room message
	if sender == nil && room.Private {
		return
	}

	if !client.isInRoom(room) {
		temp := TimeJoin{connect: true, startTime: time.Now(), endTime: time.Now()}
		client.rooms[room] = temp
		room.register <- client

		client.notifyRoomJoined(room, sender)
	}

}

func (client *Client) isInRoom(room *Room) bool {
	if _, ok := client.rooms[room]; ok {
		return true
	}

	return false
}

func (client *Client) notifyRoomJoined(room *Room, sender *Client) {
	message := Message{
		Action: RoomJoinedAction,
		Target: room,
		Sender: sender,
	}

	client.send <- message.encode()
}

func (client *Client) GetName() string {
	return client.Name
}

