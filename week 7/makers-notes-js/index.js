const postNoteData = require("./scripts/postnotedata.js");

const noteTitle = document.querySelector("#title");
const noteContent = document.querySelector("#note-content");
const btn = document.querySelector("#btn");

btn.addEventListener("click", (e) => {
  e.preventDefault();
  postNoteData(noteTitle.value, noteContent.value);
});
