const { Item } = require("../src/item");

describe("Item", function () {
  const item = new Item("test item", 5, 10);
  it("should have a name", function () {
    expect(item.name).toBe("test item");
  });

  it("should have a sellIn value", function () {
    expect(item.sellIn).toBe(5);
  });

  it("should have a quality value", function () {
    expect(item.quality).toBe(10);
  });
});
