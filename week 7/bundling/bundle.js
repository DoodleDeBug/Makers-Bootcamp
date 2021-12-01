(() => {
  var __commonJS = (cb, mod) => function __require() {
    return mod || (0, cb[Object.keys(cb)[0]])((mod = { exports: {} }).exports, mod), mod.exports;
  };

  // fetchGithubRepo.js
  var require_fetchGithubRepo = __commonJS({
    "fetchGithubRepo.js"(exports, module) {
      function fetchGithubRepo2(repoName, callback) {
        fetch(`https://api.github.com/repos/${repoName}`).then((response) => response.json()).then((jsonData) => {
          callback(jsonData);
        });
      }
      module.exports = fetchGithubRepo2;
    }
  });

  // index.js
  var fetchGithubRepo = require_fetchGithubRepo();
  fetchGithubRepo("sinatra/sinatra", (data) => {
    console.log(data);
    document.write(JSON.stringify(data));
  });
})();
