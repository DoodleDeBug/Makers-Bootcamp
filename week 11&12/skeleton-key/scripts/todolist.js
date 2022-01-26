import { constructToDos } from "../modules/constructToDos.js";
let page = document.getElementById("myUL");
let newtask = document.getElementById("newtask");
let deleteList = document.getElementById("deleteList");
deleteList.addEventListener("click", deleteToDo);
newtask.addEventListener("click", newElement);
constructToDos(page);

//create a close button and append it to items on list
// var myNodelist = todos;
// //var myNodelist = document.getElementById("myUL");
// var i;
// for (i = 0; i < myNodelist.length; i++) {
//   var span = document.createElement("SPAN");
//   var txt = document.createTextNode("\u00D7");
//   span.className = "close";
//   span.appendChild(txt);
//   myNodelist[i].appendChild(span);
// }

// // Click on a close button to hide the current list item
// var close = document.getElementsByClassName("close");
// var i;

// for (i = 0; i < close.length; i++) {
//    todos.splice(i, 1);
//    chrome.storage.sync.set({ todos });
//     close[i].onclick = function() {

//       var div = this.parentElement;
//       div.style.display = "none";

//   }

// }
// })

// Add a "checked" symbol when clicking on a list item
var list = document.querySelector("ul");
list.addEventListener(
  "click",
  function (ev) {
    if (ev.target.tagName === "LI") {
      chrome.storage.sync.get("todos", ({ todos }) => {
        ev.target.classList.toggle("checked");
        todos.forEach((todo) => {
          console.log(ev.target.innerText);
          if (todo.text == ev.target.innerText) {
            if (todo.checked == true) {
              todo.checked = false;
            } else {
              todo.checked = true;
            }
            console.log(todos);
            chrome.storage.sync.set({ todos });
          }
        });
      });
    }
  },
  false
);

function deleteToDo() {
  chrome.storage.sync.get("todos", ({ todos }) => {
    console.log("working");
    todos = [];
    chrome.storage.sync.set({ todos });
    window.location.reload(true);
  });
}

// Create a new list item when clicking on the "Add" button
function newElement() {
  chrome.storage.sync.get("todos", ({ todos }) => {
    var newtodoItem = document.createElement("li");
    newtodoItem.className = "LI";
    var inputValue = document.getElementById("myInput").value;
    todos.push({ text: inputValue, checked: false });
    var t = document.createTextNode(inputValue);
    newtodoItem.appendChild(t);
    if (inputValue === "") {
      alert("You must write something!");
    } else {
      document.getElementById("myUL").appendChild(newtodoItem);
    }
    document.getElementById("myInput").value = "";

    for (let i = 0; i < close.length; i++) {
      close[i].onclick = function () {
        var div = this.parentElement;
        div.style.display = "none";
      };
    }
    chrome.storage.sync.set({ todos });
    console.log(todos);
  });
}
