"use strict";

////////////////////////////////
// Define

const setQuantityCredit1 = document.getElementById("quantity-credit1");
const setQuantityCredit2 = document.getElementById("quantity-credit2");
const setQuantityCredit3 = document.getElementById("quantity-credit3");
const setQuantityCredit4 = document.getElementById("quantity-credit4");
const setQuantityCredit5 = document.getElementById("quantity-credit5");
const setQuantityCredit6 = document.getElementById("quantity-credit6");

const setCostCredit1 = document.getElementById("cost-credit1");
const setCostCredit2 = document.getElementById("cost-credit2");
const setCostCredit3 = document.getElementById("cost-credit3");
const setCostCredit4 = document.getElementById("cost-credit4");
const setCostCredit5 = document.getElementById("cost-credit5");
const setCostCredit6 = document.getElementById("cost-credit6");

const submitButton = document.getElementById("submit-btn");

////////////////////////////////
// Functions
async function getListCredits(file) {
    let myObject = await fetch(file);
    let myText = await myObject.text();

    let jsOj = JSON.parse(myText);
    return jsOj;
} 

function input_valid() {
  const data = {
    credit1Q: setQuantityCredit1.value,
    credit2Q: setQuantityCredit2.value,
    credit3Q: setQuantityCredit3.value,
    credit4Q: setQuantityCredit4.value,
    credit5Q: setQuantityCredit5.value,
    credit6Q: setQuantityCredit6.value,
    credit1C: setCostCredit1.value,
    credit2C: setCostCredit2.value,
    credit3C: setCostCredit3.value,
    credit4C: setCostCredit4.value,
    credit5C: setCostCredit5.value,
    credit6C: setCostCredit6.value,
  };

  if (
    !data.credit1Q ||
    !data.credit2Q ||
    !data.credit3Q ||
    !data.credit4Q ||
    !data.credit5Q ||
    !data.credit6Q ||
    !data.credit1C ||
    !data.credit2C ||
    !data.credit3C ||
    !data.credit4C ||
    !data.credit5C ||
    !data.credit6C
  )
    return false;
  else return true;
}

function resetForm() {
  setQuantityCredit1.value = "";
  setQuantityCredit2.value = "";
  setQuantityCredit3.value = "";
  setQuantityCredit4.value = "";
  setQuantityCredit5.value = "";
  setQuantityCredit6.value = "";
  setCostCredit1.value = "";
  setCostCredit2.value = "";
  setCostCredit3.value = "";
  setCostCredit4.value = "";
  setCostCredit5.value = "";
  setCostCredit6.value = "";
}

////////////////////////////////
// INIT

////////////////////////////////
// Event handlers
submitButton.addEventListener("click", async function () {
  if (!input_valid()) alert("Plese input full data!");
  else {
    const qCreditData = [];
    const cCreditData = [];
	let jsCredits = await getListCredits("../files/Credits.json");
    jsCredits.credits[0].quantity = qCreditData[0] = parseInt(setQuantityCredit1.value, 10);
    jsCredits.credits[1].quantity = qCreditData[1] = parseInt(setQuantityCredit2.value, 10);
    jsCredits.credits[2].quantity = qCreditData[2] = parseInt(setQuantityCredit3.value, 10);
    jsCredits.credits[3].quantity = qCreditData[3] = parseInt(setQuantityCredit4.value, 10);
    jsCredits.credits[4].quantity = qCreditData[4] = parseInt(setQuantityCredit5.value, 10);
    jsCredits.credits[5].quantity = qCreditData[5] = parseInt(setQuantityCredit6.value, 10);

    jsCredits.credits[0].cost = cCreditData[0] = parseInt(setCostCredit1.value, 10);
    jsCredits.credits[1].cost = cCreditData[1] = parseInt(setCostCredit2.value, 10);
    jsCredits.credits[2].cost = cCreditData[2] = parseInt(setCostCredit3.value, 10);
    jsCredits.credits[3].cost = cCreditData[3] = parseInt(setCostCredit4.value, 10);
    jsCredits.credits[4].cost = cCreditData[4] = parseInt(setCostCredit5.value, 10);
    jsCredits.credits[5].cost = cCreditData[5] = parseInt(setCostCredit6.value, 10);
	let data = new FormData();
	data.append('json',  JSON.stringify(jsCredits));
	const response = await fetch("http://"+ window.location.hostname + "/api/updateCredits", {
	    method: 'POST',
	    headers: {
	    'Accept': 'application/json'
	   	},
	    body: data
	});
	let result = await response.json();
	console.log(result);
    saveToStorage("creditData", JSON.stringify(qCreditData));
    saveToStorage("payCreditData", JSON.stringify(cCreditData));
    await init();
  }
});
async function init()
{
   let jsCredits = await getListCredits("../files/Credits.json");
   let  credits = jsCredits.credits;
   setQuantityCredit1.value = credits[0].quantity;;
  setQuantityCredit2.value = credits[1].quantity;;
  setQuantityCredit3.value = credits[2].quantity;;
  setQuantityCredit4.value = credits[3].quantity;;
  setQuantityCredit5.value = credits[4].quantity;;
  setQuantityCredit6.value = credits[5].quantity;;
  setCostCredit1.value = credits[0].cost;
  setCostCredit2.value = credits[1].cost;
  setCostCredit3.value = credits[2].cost;
  setCostCredit4.value = credits[3].cost;
  setCostCredit5.value = credits[4].cost;
  setCostCredit6.value = credits[5].cost;
}
await init();
