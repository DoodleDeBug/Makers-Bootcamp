class Account {
  constructor() {
    this.balance = 0;
    this.statement = [];
  }

  deposit(amount) {
    this.balance += amount;
    this.#updateStatement(amount, 0);
  }

  withdraw(amount) {
    if (this.balance == 0) {
      // empty account
      throw new Error("Cannot withdraw anymore, your balance is 0");
    } else if (this.balance - amount < 0) {
      // will go into negative balance
      throw new Error(
        "Cannot withdraw this amount as there is not enough money in your account"
      );
    } else {
      this.balance -= amount;
      this.#updateStatement(0, amount);
    }
  }

  printStatement() {
    // header
    console.log(`Date || Credit || Debit || Balance`);

    // print them in reverse order
    for (let i = this.statement.length - 1; i >= 0; i--) {
      let interaction = this.statement[i];
      console.log(
        `${interaction[0]} || ${interaction[1].toFixed(
          2
        )} || ${interaction[2].toFixed(2)} || ${interaction[3]}`
      );
    }
  }

  #updateStatement(credit, debit) {
    this.statement.push([
      new Date().toLocaleDateString("en-GB"),
      credit,
      debit,
      this.balance,
    ]);
  }
}

module.exports = Account;
