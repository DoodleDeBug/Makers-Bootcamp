const searchCandies = require("./searchCandies");

describe("searchCandies", () => {
  it("should return Mars and Maltesers", () => {
    expect(searchCandies("Ma", 10)).toStrictEqual(["Maltesers", "Mars"]);
  });
  it("should return only Mars", () => {
    expect(searchCandies("Ma", 2)).toStrictEqual(["Mars"]);
  });
  it("should return Skitties, Skittles and Starbust", () => {
    expect(searchCandies("S", 10)).toStrictEqual([
      "Skitties",
      "Skittles",
      "Starburst",
    ]);
  });
  it("should return Skitties and Skittles", () => {
    expect(searchCandies("S", 4)).toStrictEqual(["Skitties", "Skittles"]);
  });
  it("should return Skitties and Skittles for lowercase s", () => {
    expect(searchCandies("s", 4)).toStrictEqual(["Skitties", "Skittles"]);
  });
});
