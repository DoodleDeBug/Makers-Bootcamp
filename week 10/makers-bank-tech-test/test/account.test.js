const Account = require("../src/account");

describe("Account", () => {
  const account_one = new Account();

  it("has a starting balance of zero", () => {
    expect(account_one.balance).toBe(0);
  });

  it("has an empty starting statement", () => {
    expect(account_one.statement).toEqual([]);
  });

  describe("deposit", () => {
    it("adds an interaction to the statement", () => {
      account_one.deposit(10);
      expect(account_one.statement.length).toBe(1);
    });

    it("increases balance by deposited amount", () => {
      account_one.deposit(10);
      expect(account_one.balance).toBe(20);
    });
  });

  describe("withdraw", () => {
    it("adds an interaction to the statement", () => {
      account_one.withdraw(10);
      expect(account_one.statement.length).toBe(3);
    });

    it("dencreases balance by withdrawn amount", () => {
      account_one.withdraw(10);
      expect(account_one.balance).toBe(0);
    });

    it("cannot withdraw once balance is 0", () => {
      expect(() => {
        account_one.withdraw(10);
      }).toThrow("Cannot withdraw anymore, your balance is 0");
    });

    it("cannot withdraw into negative balance", () => {
      account_one.deposit(10);
      expect(() => {
        account_one.withdraw(11);
      }).toThrow(
        "Cannot withdraw this amount as there is not enough money in your account"
      );
    });
  });
});
