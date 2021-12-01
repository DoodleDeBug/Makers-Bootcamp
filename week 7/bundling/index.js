const fetchGithubRepo = require("./fetchGithubRepo");

fetchGithubRepo("sinatra/sinatra", (data) => {
  console.log(data);
  document.write(JSON.stringify(data));
});
