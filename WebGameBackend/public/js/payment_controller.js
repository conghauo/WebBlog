import {WebsocketController} from './websocket-controller.js';

await init();
var websocket;
async function init() {
	
	const response = await fetch("http://"+ window.location.hostname + "/api/getUser", {
	    method: 'get',
	    headers: {
	    'Accept': 'application/json'
	   	}
	});
	var userName = "";
	await response.json().then(data => {
          userName = data.username;
	});
	
	websocket = new WebsocketController( "ws://" + window.location.hostname + "/ws", "Game1", userName);
	
}
//window.sendPayAction(message) = sendPayAction(message);
export function sendPayAction(message)
{	
	console.log("click sendPayAction");
	websocket.sendPayAction(message);
}
