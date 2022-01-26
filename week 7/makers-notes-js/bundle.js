(() => {
  var __commonJS = (cb, mod) => function __require() {
    return mod || (0, cb[Object.keys(cb)[0]])((mod = { exports: {} }).exports, mod), mod.exports;
  };

  // scripts/postnotedata.js
  var require_postnotedata = __commonJS({
    "scripts/postnotedata.js"(exports, module) {
      function postNoteData2(noteTitle2, noteContent2) {
        const data = { title: noteTitle2, content: noteContent2 };
        fetch("http://localhost:3000/notes", {
          method: "POST",
          headers: {
            "Content-Type": "application/json"
          },
          body: JSON.stringify(data)
        }).then((response) => response.json());
      }
      module.exports = postNoteData2;
    }
  });

  // index.js
  var postNoteData = require_postnotedata();
  var noteTitle = document.querySelector("#title");
  var noteContent = document.querySelector("#note-content");
  var btn = document.querySelector("#btn");
  btn.addEventListener("click", (e) => {
    e.preventDefault();
    postNoteData(noteTitle.value, noteContent.value);
  });
})();
