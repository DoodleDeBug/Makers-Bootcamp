function fetchGithubRepo(repoName, callback) {
  fetch(`https://api.github.com/repos/${repoName}`)
    .then((response) => response.json())
    .then((jsonData) => {
      callback(jsonData);
    });
}

module.exports = fetchGithubRepo;
