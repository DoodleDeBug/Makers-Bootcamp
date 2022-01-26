// import { constructOptions } from '../modules/constructOptions.js';

let page = document.getElementById("buttonDiv");

function constructOptions(page) {
  chrome.storage.sync.get("keys", (data) => {
    let currentKeys = data.keys;
    console.log(currentKeys);
    for (let key in currentKeys) {
      let button = document.createElement("button");
      button.innerText = key;
      button.id = key;
      button.className = "btn btn-info btn-sm fw-bolder";

      console.log(key);

      button.addEventListener("click", openLinks);

      page.appendChild(button);
    }
  });
}

function openLinks(e) {
  chrome.storage.sync.get("keys", ({ keys }) => {
    let keyName = e.target.innerText;
    console.log(keyName);
    createTabs(keys[keyName]);
  });
}

function createTabs(links) {
  links.forEach((link) => {
    chrome.tabs.create({ url: link });
  });
}

constructOptions(page);
