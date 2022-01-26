let workLinks = ["https://github.com/login", "https://www.bbc.co.uk/"];

let socialLinks = [
  "https://www.whatsapp.com/",
  "https://www.signal.org/",
  "https://telegram.org/",
];

let keys = { work: workLinks, social: socialLinks };
let todos = [];

chrome.runtime.onInstalled.addListener(() => {
  chrome.storage.sync.set({ keys, todos });
  console.log(`work links defined`);
  console.log(`todos created`);
});

// chrome.runtime.onInstalled.addListener(() => {
//   chrome.storage.sync.set({ todos });

// });
