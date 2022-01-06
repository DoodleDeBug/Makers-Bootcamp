# Makers Bank Tech Test

## My Approach

I started by thinking about what classes I would need and what methods they would need. I made a small sketch of how the client would interact with the account class. Then I thought about how the user would interact with the program in the console. They would have to create a new instance of Client with their name, then use that to interact with the Account class. Every client has an account, each account belongs to a client. There can be many accounts and clients in a bank.

![image](https://user-images.githubusercontent.com/75613073/148058965-5733b8a2-e5b6-4216-bb3f-4e8144bea136.png)

I put each class in a seperate file in the src directory and each class had a seperate test file in the test directory.

### Difficulties

I could not figure out how to test the output in the node console with jest and I am still struggling to use/understand jest mocks.

As I was filling out the tech test self assessment form I realised I could have had a transaction class to seperate that from the account class, I tried to implement in and test it etc but I could not get it to work with the client and by that point my brain was fried so I gave up, but I left the files there so I can try again sometime.

## How to Install and Run

1. Fork and clone this repo
2. `cd` into the folder
3. Run `npm install` to get dependencies
4. Run `node`
5. Require the client class with `const Client = require("./src/client");`
6. Create a new client with `const Julia = new Client("Julia");`
7. You can then use `Julia.deposit(amount)`, `Julia.withdraw(amount)`and`Julia.printStatement`, subbing in the amount as a number where relevant

## How to Test

1. Do as instructed above up to step 3
2. Run `npm test`

## Tech Used

- Node
- JS
- Jest
- Eslint

## Specification

### Requirements

- You should be able to interact with your code via a REPL like IRB or Node. (You don't need to implement a command line interface that takes input from STDIN.)
- Deposits, withdrawal.
- Account statement (date, amount, balance) printing.
- Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2023  
**And** a deposit of 2000 on 13-01-2023  
**And** a withdrawal of 500 on 14-01-2023  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00
```

## Screenshots

![image](https://user-images.githubusercontent.com/75613073/148241577-1ac93d12-2f60-4af7-9334-8a56d976efbc.png)
