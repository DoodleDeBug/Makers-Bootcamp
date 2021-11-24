const readlineSync = require('readline-sync')

input = readlineSync.question('What is your name? ');

console.log(`Hello ${input}`);