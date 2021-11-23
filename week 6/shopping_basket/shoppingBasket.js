class ShoppingBasket {
  constructor() {
    this.content = [];
  }

  addItem(item) {
    this.content.push(item);
  }

  getTotalPrice() {
    let totalPrice = 0;
    this.content.forEach((item) => {
      totalPrice += item.getPrice();
    });
    return totalPrice;
  }
}

module.exports = ShoppingBasket;
