import { constructOptions } from "../modules/constructOptions.js";

let page = document.getElementById("buttonDiv");

function openEdit(e) {
  let currentKey = e.target.innerText;
  chrome.storage.sync.set({ currentKey });
  window.location.href = "../pages/edit.html";
}
// Initialize the page by constructing the key options
constructOptions(page);

export { openEdit };
