const got = require("got");

const fetchRepoInfo = (repoName, callback) => {
  got(`https://api.github.com/repos/${repoName}`).then((response) =>
    callback(JSON.parse(response.body))
  );
};

fetchRepoInfo("sinatra/sinatra", (repoResponse) => {
  console.log(repoResponse);
});
