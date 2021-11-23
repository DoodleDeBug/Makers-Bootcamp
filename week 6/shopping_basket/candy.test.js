const Candy = require("./candy");

describe("Candy", () => {
  const candy = new Candy("Mars", 4.99);

  it("returns the name", () => {
    expect(candy.getName()).toBe("Mars");
  });

  it("returns the price", () => {
    expect(candy.getPrice()).toBe(4.99);
  });
});
