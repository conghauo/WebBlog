export class WebsocketController {
	initialReconnectDelay = 1000;
	currentReconnectDelay = 0;
	maxReconnectDelay  = 16000;
	serverUrl = null;
	room = null;
	username = '';
    roomInput = 'Game1';
    ws = null;
	users = [];
	constructor(serverUrl, roomInput, username)
	{
	  this.serverUrl = serverUrl;
	  this.roomInput = roomInput;
	  this.username = username;
	  console.log(this.serverUrl + "?name=" + this.username);
      this.ws = new WebSocket(this.serverUrl + "?name=" + this.username);
	  this.ws.onopen = function(){
	    //alert('Kết nối thành công');
	  }
	  this.ws.onerror = function(error){
		console.log('Lỗi' + JSON.stringify(error));
		alert('Đã xảy ra lỗi');
	  }
      this.ws.addEventListener('open', (event) => { this.onWebsocketOpen(event) });
      this.ws.addEventListener('message', (event) => { this.handleNewMessage(event) });
      this.ws.addEventListener('close', (event) => { this.leaveRoom(); this.onWebsocketClose(event) });
	}
    onWebsocketOpen() {
      //console.log("connected to WS!");
      this.currentReconnectDelay = 1000;
    }

    onWebsocketClose() {
	//  console.log("disconnected to WS!");
      this.ws = null;
      setTimeout(() => {
        this.reconnectToWebsocket();
      }, this.currentReconnectDelay);

    }

    reconnectToWebsocket() {
      if (this.currentReconnectDelay < this.maxReconnectDelay) {
        this.currentReconnectDelay *= 2;
      }
      this.connectToWebsocket();
    }

    handleNewMessage(event) {
      let data = event.data;
      data = data.split(/\r?\n/);

      for (let i = 0; i < data.length; i++) {
        let msg = JSON.parse(data[i]);
        switch (msg.action) {
          case "send-message":
            this.handleChatMessage(msg);
            break;
          case "user-join":
            this.handleUserJoined(msg);
            break;
          case "user-left":
            this.handleUserLeft(msg);
            break;
          case "room-joined":
            this.handleRoomJoined(msg);
            break;
          default:
            break;
        }

      }
    }
    handleChatMessage(msg) {
      if (typeof this.room  !== "undefined") {
        this.room.messages.push(msg);
      }
      if (msg.message === "Success Payment")
      	 alert("Success Payment");
    }
    handleUserJoined(msg) {
      this.users.push(msg.sender);
    }
    handleUserLeft(msg) {
      for (let i = 0; i < this.users.length; i++) {
        if (this.users[i].id == msg.sender.id) {
          this.users.splice(i, 1);
        }
      }
    }
    handleRoomJoined(msg) {
      this.room  = msg.target;
      this.room.name = this.room.private ? msg.sender.name : this.room.name;
      this.room["messages"] = [];
    }
    sendMessage() {
      if (this.room.newMessage !== "") {
        this.ws.send(JSON.stringify({
          action: 'send-message',
          message: this.room.newMessage,
          target: {
            id: this.room.id,
            name: this.room.name
          }
        }));
        this.room.newMessage = "";
      }
    }
	sendPayAction(message){
		 this.ws.send(JSON.stringify({ action: 'payment', message: message }));
	}		
    joinRoom() {
	 if (this.ws.readyState === WebSocket.OPEN) {
			  this.ws.send(JSON.stringify({ action: 'join-room', message: this.roomInput }));
	  }
    }
	
    leaveRoom() {
      this.ws.send(JSON.stringify({ action: 'leave-room', message: this.room.id }));
    }
}
