const readline = require("readline");

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

rl.question("What is your fave colour?", (answer) => {
  console.log(`Your fave colour is ${answer}`);

  rl.close();
});
