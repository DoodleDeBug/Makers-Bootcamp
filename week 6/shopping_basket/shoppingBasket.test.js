const ShoppingBasket = require("./shoppingBasket");

describe("ShoppingBasket", () => {
  const basket = new ShoppingBasket();

  const marsDouble = { getPrice: () => 4.99 };
  const skittleDouble = { getPrice: () => 3.99 };

  it("returns total price of items in basket", () => {
    expect(basket.getTotalPrice()).toBe(0);
  });

  it("returns 4.99 when mars is added", () => {
    basket.addItem(marsDouble);
    expect(basket.getTotalPrice()).toBe(4.99);
  });

  it("returns 12.97 when two more skittles are added", () => {
    basket.addItem(skittleDouble);
    basket.addItem(skittleDouble);
    expect(basket.getTotalPrice()).toBe(12.97);
  });
});
