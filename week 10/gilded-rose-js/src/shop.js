class Shop {
  constructor(items = []) {
    // default value if no items given is empty array
    this.items = items;
  }

  // newDay() {
  //   this.updateSellIn();
  //   this.updateQuality();

  //   return this.items;
  // }

  // updateSellIn() {
  //   this.items.forEach((item) => {
  //     item.name != "Sulfuras, Hand of Ragnaros" ? item.sellIn-- : null;
  //   });
  // }

  updateBrie(item) {
    if (item.quality < 50) {
      item.quality++;
    }
    if (item.quality < 50 && item.sellIn < 0) {
      item.quality++;
    }
  }

  updateBackstagePasses(item) {
    if (item.quality < 50) {
      if (item.sellIn < 0) {
        item.quality = 0;
      } else if (item.sellIn < 6) {
        item.quality += 3;
      } else if (item.sellIn < 11) {
        item.quality += 2;
      } else {
        item.quality++;
      }
    }
  }

  newDay() {
    this.items.forEach((item) => {
      if (item.name == "Sulfuras, Hand of Ragnaros") {
        return;
      } else {
        item.sellIn--;

        // if (item.name == "Aged Brie") {
        //   this.updateBrie(item);
        // } else if (item.name == "Backstage passes to a TAFKAL80ETC concert") {
        //   this.updateBackstagePasses(item);
        // } else {
        //   item.quality > 0 ? item.quality-- : null;

        //   item.sellIn < 0 && item.quality > 0 ? item.quality-- : null;
        // }
        switch (item.name) {
          case "Aged Brie":
            this.updateBrie(item);
            break;
          case "Backstage passes to a TAFKAL80ETC concert":
            this.updateBackstagePasses(item);
            break;
          default:
            item.quality > 0 ? item.quality-- : null;
            item.sellIn < 0 && item.quality > 0 ? item.quality-- : null;
        }
      }
    });

    return this.items;
  }
}

module.exports = {
  Shop,
};
