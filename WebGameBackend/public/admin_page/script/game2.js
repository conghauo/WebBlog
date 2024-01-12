"use strict";

////////////////////////////////
//Define
const levelInput = document.getElementById("input-type-level");
const noQuestion = document.getElementById("input-no");
const questionInput = document.getElementById("input-question");
const submitBtn = document.getElementById("submit-btn");
const cancelBtn = document.getElementById("cancel-btn");
const tableBodyEl = document.getElementById("tbody");

// variables
const arrayLevel1 = [
  {
    id: 1,
    question: "Bạn là nam hay nữ?aaaaaaa",
  },
  {
    id: 2,
    question: "Sáng ngủ dậy BAE có bị “xì hơi” không?",
  },
];

////////////////////////////////
// Function
function resetForm() {
  questionInput.value = "";
}

// Show the petData
function renderTableData(question) {
  tableBodyEl.innerHTML = "";
  question.forEach((question) => {
    const row = document.createElement("tr");
    row.innerHTML = genRow(question);
    tableBodyEl.appendChild(row);
  });
}

// Insert the pet in the database
function genRow(row) {
  return `
          <th scope="row">${row.id}</th>
          <td>${row.question}</td>
          
          <td>dd/mm/yyyy</td>
          <td>
            <button type="button" class="btn btn-warning btn-edit"
            id="btn-edit" data-id="${row.id}">Edit</button>
              <button type="button" class="btn btn-danger btn-delete"
              id="btn-delete" data-id="${row.id}">Delete</button>
          </td>
      `;
}

////////////////////////////////
// INIT
tableBodyEl.innerHTML = "";
renderTableData(arrayLevel1);

////////////////////////////////
// Events
cancelBtn.addEventListener("click", function () {
  resetForm();
});

submitBtn.addEventListener("click", function () {
  // console.log(levelInput.value);
});
