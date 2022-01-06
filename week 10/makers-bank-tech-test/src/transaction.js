class Transaction {
  constructor(credit, debit, account) {
    this.date = new Date().toLocaleDateString("en-GB");
    this.credit = credit;
    this.debit = debit;
    this.account = account;
  }

  implementTransaction() {
    this.account.balance = this.account.balance + this.credit - this.debit;
  }
}

module.exports = Transaction;
