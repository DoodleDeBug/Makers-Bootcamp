import { openEdit } from "../scripts/options.js";
//import {openLinks} from '../popup.js';

function constructOptions(page) {
  chrome.storage.sync.get("keys", (data) => {
    let currentKeys = data.keys;
    console.log(currentKeys);
    // For each color we were provided…
    for (let key in currentKeys) {
      // …create a button with that color…
      let button = document.createElement("button");
      button.innerText = key;
      button.id = key;
      button.className = "btn btn-info btn-sm fw-bolder";

      // if (pagetype === "popup")
      //   button.addEventListener("click", openLinks);
      // else
      button.addEventListener("click", openEdit);

      page.appendChild(button);
    }
  });
}

export { constructOptions };
