let newKeyBtn = document.getElementById("submitKey");
let newKeyname = document.getElementById("new_key_name");

newKeyBtn.addEventListener("click", addKey);

function addKey(e) {
  e.preventDefault();

  let name = newKeyname.value;
  chrome.storage.sync.get("keys", ( {keys}) => {
  if (name == "") 
  { window.alert("Key Must Not Be Blank!")
  }else if (name.length > 7)
  { window.alert("Key Name Can Not Be More Than 7 Characters!")
  }else if (name in keys) {window.alert("Key Already Exists!")
  }else { 
    keys[name] = [];
    chrome.storage.sync.set({ keys });
    document.forms[0].reset();

  }});
  window.location.href = "../pages/options.html";
}
