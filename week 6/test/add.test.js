const add = require("./add");

describe("add", () => {
  // test cases
  it("adds 2 and 2", () => {
    expect(add(2, 2)).toBe(4);
  });

  it("adds 6 and 0", () => {
    expect(add(6, 0)).toBe(6);
  });
});
