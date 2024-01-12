package main

import (
	"context"
	"fmt"
	"encoding/base64"
	"errors"
	"gitlab.com/hartsfield/gmailAPI"
	"gitlab.com/hartsfield/inboxer"
	gmail "google.golang.org/api/gmail/v1"
)
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
				if (l.MimeType =="text/plain" ||  l.MimeType =="text/html" ) && l.Body.Size >= 1 {
					dec, err := decodeEmailBody(l.Body.Data)
					if err != nil {
						return "", err
					}
					return dec, nil
				}
			}
		}
		if (v.MimeType =="text/plain" ||  v.MimeType =="text/html" ) && v.Body.Size >= 1 {
			dec, err := decodeEmailBody(v.Body.Data)
			if err != nil {
				return "", err
			}
			return dec, nil
		}
	}
	
	if (msg.Payload.MimeType =="text/plain" ||  msg.Payload.MimeType =="text/html" ) && msg.Payload.Body.Size >=1 {
	dec, err := decodeEmailBody(msg.Payload.Body.Data)
	if err != nil {
				return "", err
			}
			return dec, nil
	}
	return "", errors.New("Couldn't Read Body")
}


func main() {
	// Connect to the gmail API service.
	ctx := context.Background()
	srv := gmailAPI.ConnectToService(ctx, gmail.GmailComposeScope)
	// num will be -1 on err
  	msgs, err := inboxer.Query(srv, "from:mailalert@acb.com.vn after:2020/01/01 before:2022/11/18")
	if err != nil {
		fmt.Println(err)
	}

	// Range over the messages
	for _, msg := range msgs {
		fmt.Println("========================================================")
		time, err := inboxer.ReceivedTime(msg.InternalDate)
		if err != nil {
			fmt.Println(err)
		}
		fmt.Println("Date: ", time)
		md := inboxer.GetPartialMetadata(msg)
		fmt.Println("From: ", md.From)
		fmt.Println("Sender: ", md.Sender)
		fmt.Println("Subject: ", md.Subject)
		fmt.Println("Delivered To: ", md.DeliveredTo)
		fmt.Println("To: ", md.To)
		fmt.Println("CC: ", md.CC)
		fmt.Println("Mailing List: ", md.MailingList)
		fmt.Println("Thread-Topic: ", md.ThreadTopic)
		fmt.Println("Snippet: ", msg.Snippet)
		body, err := GetBodyHandle(msg)
		if err != nil {
			fmt.Println(err)
		}
		fmt.Println(body)
	}
}
