function postNoteData(noteTitle, noteContent) {
  const data = { title: noteTitle, content: noteContent };

  fetch("http://localhost:3000/notes", {
    method: "POST", // or 'PUT'
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(data),
  }).then((response) => response.json());
}

module.exports = postNoteData;
