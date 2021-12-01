const fetchGithubRepo = require("./fetchGithubRepo");

const repoName = document.querySelector("#repo_name");
const button = document.querySelector("#btn");

const name = document.querySelector("#name");
const pic = document.querySelector("#pic");
const link = document.querySelector("#link");
const stargazers = document.querySelector("#stargazers");
const forks = document.querySelector("#forks");
const language = document.querySelector("#language");

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
