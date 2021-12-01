(() => {
  var __commonJS = (cb, mod) => function __require() {
    return mod || (0, cb[Object.keys(cb)[0]])((mod = { exports: {} }).exports, mod), mod.exports;
  };

  // fetchGithubRepo.js
  var require_fetchGithubRepo = __commonJS({
    "fetchGithubRepo.js"(exports, module) {
      function fetchGithubRepo2(repoName2, callback) {
        fetch(`https://api.github.com/repos/${repoName2}`).then((response) => response.json()).then((jsonData) => {
          callback(jsonData);
        });
      }
      module.exports = fetchGithubRepo2;
    }
  });

  // index.js
  var fetchGithubRepo = require_fetchGithubRepo();
  var repoName = document.querySelector("#repo_name");
  var button = document.querySelector("#btn");
  var name = document.querySelector("#name");
  var pic = document.querySelector("#pic");
  var link = document.querySelector("#link");
  var stargazers = document.querySelector("#stargazers");
  var forks = document.querySelector("#forks");
  var language = document.querySelector("#language");
  button.addEventListener("click", () => {
    fetchGithubRepo(repoName.value, (data) => {
      name.innerText = `name: ${data.name}`;
      pic.innerText = `pic: `;
      link.innerText = `link: ${data.html_url}`;
      stargazers.innerText = `stargazer count: ${data.stargazers_count}`;
      forks.innerText = `number of forks: ${data.forks}`;
      language.innerText = `programming language: ${data.language}`;
    });
  });
})();
