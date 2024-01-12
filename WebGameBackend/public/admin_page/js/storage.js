"use strict";

////////////////////////////////
// Define
// let credit1 = 15;
// let credit2 = 35;
// let credit3 = 77;
// let credit4 = 168;
// let credit5 = 300;
// let credit6 = 550;

// let payCredit1 = 300000;
// let payCredit2 = 500000;
// let payCredit3 = 1000000;
// let payCredit4 = 2000000;
// let payCredit5 = 3000000;
// let payCredit6 = 5000000;

const creditArr = [15, 35, 77, 168, 300, 550];
const payCreditArr = [300000, 500000, 1000000, 2000000, 3000000, 5000000];

////////////////////////////////
// FUNCTIONS
function saveToStorage(key, value) {
  localStorage.setItem(key, value);
}

function getFromStorage(key) {
  return localStorage.getItem(key);
}

////////////////////////////////
//INIT
// Save to localStorage userArr
var creditData = localStorage.getItem("creditData");
if (creditData) {
} else {
  saveToStorage("creditData", JSON.stringify(creditArr));
}

var payCreditData = localStorage.getItem("payCreditData");
if (payCreditData) {
} else {
  saveToStorage("payCreditData", JSON.stringify(payCreditArr));
}
