import {WebsocketController} from '../../js/websocket-controller.js';

"use strict";

const credit1E = document.getElementById("credit-1");
const credit2E = document.getElementById("credit-2");
const credit3E = document.getElementById("credit-3");
const credit4E = document.getElementById("credit-4");
const credit5E = document.getElementById("credit-5");
const credit6E = document.getElementById("credit-6");

const payCredit1E = document.getElementById("pay-credit-1");
const payCredit2E = document.getElementById("pay-credit-2");
const payCredit3E = document.getElementById("pay-credit-3");
const payCredit4E = document.getElementById("pay-credit-4");
const payCredit5E = document.getElementById("pay-credit-5");
const payCredit6E = document.getElementById("pay-credit-6");

const payPerCredit1E = document.getElementById("pay-per-credit1");
const payPerCredit2E = document.getElementById("pay-per-credit2");
const payPerCredit3E = document.getElementById("pay-per-credit3");
const payPerCredit4E = document.getElementById("pay-per-credit4");
const payPerCredit5E = document.getElementById("pay-per-credit5");
const payPerCredit6E = document.getElementById("pay-per-credit6");

const saveTextCredit1E = document.getElementById("save-text-credit1");
const saveTextCredit2E = document.getElementById("save-text-credit2");
const saveTextCredit3E = document.getElementById("save-text-credit3");
const saveTextCredit4E = document.getElementById("save-text-credit4");
const saveTextCredit5E = document.getElementById("save-text-credit5");
const saveTextCredit6E = document.getElementById("save-text-credit6");

const linkCredit1E = document.getElementById("credit1-link");
const linkCredit2E = document.getElementById("credit2-link");
const linkCredit3E = document.getElementById("credit3-link");
const linkCredit4E = document.getElementById("credit4-link");
const linkCredit5E = document.getElementById("credit5-link");
const linkCredit6E = document.getElementById("credit6-link");

let credit1;
let credit2;
let credit3;
let credit4;
let credit5;
let credit6;

let payCredit1;
let payCredit2;
let payCredit3;
let payCredit4;
let payCredit5;
let payCredit6;
var creditArr = [credit1, credit2, credit3, credit4, credit5, credit6];
var payCreditArr = [payCredit1, payCredit2, payCredit3, payCredit4, payCredit5, payCredit6];
// set values for credit
function getValuesCredit() {
  const creditDataArr = JSON.parse(getFromStorage("creditData"));
  const payCreditDataArr = JSON.parse(getFromStorage("payCreditData"));
  credit1 = creditDataArr[0];
  credit2 = creditDataArr[1];
  credit3 = creditDataArr[2];
  credit4 = creditDataArr[3];
  credit5 = creditDataArr[4];
  credit6 = creditDataArr[5];

  payCredit1 = payCreditDataArr[0];
  payCredit2 = payCreditDataArr[1];
  payCredit3 = payCreditDataArr[2];
  payCredit4 = payCreditDataArr[3];
  payCredit5 = payCreditDataArr[4];
  payCredit6 = payCreditDataArr[5];
}
////////////////////////////////
// FUNCTIONS
function saveToStorage(key, value) {
  localStorage.setItem(key, value);
}

function getFromStorage(key) {
  return localStorage.getItem(key);
}

function format1(n, currency) {
  return n.toFixed(0).replace(/./g, function (c, i, a) {
    return i > 0 && c !== "." && (a.length - i) % 3 === 0 ? "," + c : c;
  });
}
async function getListCredits(file) {
    let myObject = await fetch(file);
    let myText = await myObject.text();

    let jsOj = JSON.parse(myText);
    return jsOj;
}
var websocket;
window.sendPayAction = sendPayAction;
function sendPayAction(message)
{ 
   console.log("click sendPayAction");
   websocket.sendPayAction(message);
}
async function init_old() {
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
	
	websocket = new WebsocketController( "ws://" +  window.location.hostname + "/ws", "Game1", userName);

        let jsCredits = await getListCredits("../files/Credits.json");
	let  credits = jsCredits.credits;
	credit1 = credits[0].quantity;
	payCredit1 = credits[0].cost;
	credit2 = credits[1].quantity;
	payCredit2 = credits[1].cost;
	credit3 = credits[2].quantity;
	payCredit3 = credits[2].cost;
	credit4 = credits[3].quantity;
	payCredit4 = credits[3].cost;
	credit5 = credits[4].quantity;
	payCredit5 = credits[4].cost;
	credit6 = credits[5].quantity;
	payCredit6 = credits[5].cost;
    saveToStorage("creditData", JSON.stringify(creditArr));
	saveToStorage("payCreditData", JSON.stringify(payCreditArr));
	
  var url = "https://img.vietqr.io/image/970416-9467647-compact2.jpg?amount=<amount>&addInfo=<content>&accountName=Huynh%20Cong%20Hau"
  
  credit1E.innerHTML = credit1;
  credit2E.innerHTML = credit2;
  credit3E.innerHTML = credit3;
  credit4E.innerHTML = credit4;
  credit5E.innerHTML = credit5;
  credit6E.innerHTML = credit6;

  payCredit1E.innerHTML = format1(payCredit1) + "đ";
  payCredit2E.innerHTML = format1(payCredit2) + "đ";
  payCredit3E.innerHTML = format1(payCredit3) + "đ";
  payCredit4E.innerHTML = format1(payCredit4) + "đ";
  payCredit5E.innerHTML = format1(payCredit5) + "đ";
  payCredit6E.innerHTML = format1(payCredit6) + "đ";

  payPerCredit1E.innerHTML = format1(payCredit1 / credit1) + " vnđ/mins";
  payPerCredit2E.innerHTML = format1(payCredit2 / credit2) + " vnđ/mins";
  payPerCredit3E.innerHTML = format1(payCredit3 / credit3) + " vnđ/mins";
  payPerCredit4E.innerHTML = format1(payCredit4 / credit4) + " vnđ/mins";
  payPerCredit5E.innerHTML = format1(payCredit5 / credit5) + " vnđ/mins";
  payPerCredit6E.innerHTML = format1(payCredit6 / credit6) + " vnđ/mins";

  let content = "{\"q\":"+credit1 +",\"a\":" + payCredit1 +"}";
  linkCredit1E.href = url.replaceAll('<amount>',payCredit1).replaceAll('<content>',window.btoa(content));
  linkCredit1E.setAttribute('onclick','sendPayAction("'+window.btoa(content)+'")')
  
  content = "{\"q\":"+credit2 +",\"a\":" + payCredit2 +"}";
  linkCredit2E.href = url.replaceAll('<amount>',payCredit2).replaceAll('<content>',window.btoa(content));
  linkCredit2E.setAttribute('onclick','sendPayAction("'+window.btoa(content)+'")')
  
  content = "{\"q\":"+credit3 +",\"a\":" + payCredit3 +"}";
  linkCredit3E.href = url.replaceAll('<amount>',payCredit3).replaceAll('<content>',window.btoa(content));
  linkCredit3E.setAttribute('onclick','sendPayAction("'+window.btoa(content)+'")')
  
  content = "{\"q\":"+credit4 +",\"a\":" + payCredit4 +"}";
  linkCredit4E.href = url.replaceAll('<amount>',payCredit4).replaceAll('<content>',window.btoa(content));
  linkCredit4E.setAttribute('onclick','sendPayAction("'+window.btoa(content)+'")')
  
  content = "{\"q\":"+credit5+",\"a\":" + payCredit5 +"}";
  linkCredit5E.href = url.replaceAll('<amount>',payCredit5).replaceAll('<content>',window.btoa(content));
  linkCredit5E.setAttribute('onclick','sendPayAction("'+window.btoa(content)+'")')
  
  content = "{\"q\":"+credit6 +", \"a\":" + payCredit6 +"}";
  linkCredit6E.href = url.replaceAll('<amount>',payCredit6).replaceAll('<content>',window.btoa(content));
  linkCredit6E.setAttribute('onclick','sendPayAction("'+window.btoa(content)+'")')

  let payNormal = payCredit1 / credit1;
  const save_text = "Tiết kiệm ";

  saveTextCredit1E.innerHTML =
    save_text + format1(100 * (1 - payCredit1 / credit1 / payNormal)) + "%";
  saveTextCredit2E.innerHTML =
    save_text + format1(100 * (1 - payCredit2 / credit2 / payNormal)) + "%";
  saveTextCredit3E.innerHTML =
    save_text + format1(100 * (1 - payCredit3 / credit3 / payNormal)) + "%";
  saveTextCredit4E.innerHTML =
    save_text + format1(100 * (1 - payCredit4 / credit4 / payNormal)) + "%";
  saveTextCredit5E.innerHTML =
    save_text + format1(100 * (1 - payCredit5 / credit5 / payNormal)) + "%";
  saveTextCredit6E.innerHTML =
    save_text + format1(100 * (1 - payCredit6 / credit6 / payNormal)) + "%";
}

////////////////////////////////
// INIT
getValuesCredit();
await init_old();
