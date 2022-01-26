let keyEdit = document.getElementById("keyEdit");
let deleteKeyButton = document.getElementById("deleteKey");
let page = document.getElementById("allBits");

deleteKeyButton.addEventListener("click", deleteKey);
keyEdit.addEventListener("click", addingUrl);

function addingUrl(ev) {
  ev.preventDefault();
  chrome.storage.sync.get("keys", ({ keys }) => {
    chrome.storage.sync.get("currentKey", ({ currentKey }) => {
      let input_url = document.getElementById("new_url").value;
      if (isValidUrl(input_url)) {
        keys[currentKey].push(input_url);
        chrome.storage.sync.set({ keys });
        document.forms[0].reset();
      } else {
        alert("Not Valid URL");
      }
    });
    window.location.reload(true);
  });
}

function isValidUrl(_string) {
  const matchpattern =
    /^https?:\/\/(?:www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$/gm;
  return matchpattern.test(_string);
}

function displayBits(page) {
  chrome.storage.sync.get("keys", ({ keys }) => {
    chrome.storage.sync.get("currentKey", ({ currentKey }) => {
      // For each color we were provided…
      for (let bit in keys[currentKey]) {
        // …create a button with that color…
        let div = document.createElement("div");
        div.classList.add("container", "d-flex", "align-items-center");

        let p = document.createElement("p");
        p.innerText = keys[currentKey][bit];
        console.log(bit);

        let button = document.createElement("button");
        button.id = bit;
        button.innerText = "Delete";
        button.className = "btn btn-secondary btn-sm fw-bolder";
        button.addEventListener("click", deleteBit);

        div.appendChild(button);
        div.appendChild(p);

        page.appendChild(div);
      }
    });
  });
}

function deleteBit(e) {
  window.alert("You deleted a Bit");
  let bitPosition = e.target.id;
  chrome.storage.sync.get("keys", ({ keys }) => {
    chrome.storage.sync.get("currentKey", ({ currentKey }) => {
      keys[currentKey].splice(bitPosition, 1);
      console.log(keys[currentKey]);
      chrome.storage.sync.set({ keys });
    });

    window.location.reload(true);
    console.log(keys);
  });
}

function deleteKey() {
  chrome.storage.sync.get("keys", ({ keys }) => {
    chrome.storage.sync.get("currentKey", ({ currentKey }) => {
      delete keys[currentKey];
      chrome.storage.sync.set({ keys });
      window.location.href = "../pages/options.html";
    });
  });
}

displayBits(page);
