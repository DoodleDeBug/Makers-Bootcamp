const Account = require("../src/account");
const Transaction = require("../src/transaction");

describe("Transaction", () => {
  const transaction_one = new Transaction(50, 0, new Account());

  // TODO: cannot figure out how to mock dates
  // it("has a date", () => {
  //   expect(transaction_one.date).toBeInstanceOf(
  //     Date().toLocaleDateString("en-GB")
  //   );
  // });

  it("has a credit value", () => {
    expect(transaction_one.credit).toBe(50);
  });

  it("has a debit value", () => {
    expect(transaction_one.debit).toBe(0);
  });

  it("has an account", () => {
    expect(transaction_one.account).toBeInstanceOf(Account);
  });

  describe("implementTransaction", () => {
    it("updates the account balance", () => {
      transaction_one.implementTransaction();
      expect(transaction_one.account.balance).toBe(50);
    });
  });
});
