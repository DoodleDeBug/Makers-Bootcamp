const fetchGithubRepo = require("./fetchGithubRepo");

const repoName = document.querySelector("#repo_name");
const button = document.querySelector("#btn");

button.addEventListener("click", () => {
  fetchGithubRepo(repoName.value, (data) => {
    console.log(data);
  });
});
