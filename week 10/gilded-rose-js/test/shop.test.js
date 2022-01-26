const { Shop } = require("../src/shop");
const { Item } = require("../src/item");

describe("Gilded Rose", function () {
  const items = [
    new Item("+5 Dexterity Vest", 10, 20),
    new Item("Aged Brie", 2, 0),
    new Item("Elixir of the Mongoose", 5, 7),
    new Item("Sulfuras, Hand of Ragnaros", 0, 50),
    new Item("Sulfuras, Hand of Ragnaros", -1, 50),
    new Item("Backstage passes to a TAFKAL80ETC concert", 15, 20),
    new Item("Backstage passes to a TAFKAL80ETC concert", 10, 49),
    new Item("Backstage passes to a TAFKAL80ETC concert", 5, 49),
  ];

  const gildedRose = new Shop(items);
  gildedRose.newDay();

  it("should have a list of items", function () {
    expect(gildedRose.items).toEqual(items);
  });

  it("should decrease sellIn", function () {
    expect(gildedRose.items[0].sellIn).toBe(9); // vest
    expect(gildedRose.items[1].sellIn).toBe(1); // brie
    expect(gildedRose.items[2].sellIn).toBe(4); // elixir
    expect(gildedRose.items[5].sellIn).toBe(14); // pass1
    expect(gildedRose.items[6].sellIn).toBe(9); // pass2
    expect(gildedRose.items[7].sellIn).toBe(4); // pass3
  });

  it("should decrease quality of normal items", function () {
    expect(gildedRose.items[0].quality).toBe(19); // vest
    expect(gildedRose.items[2].quality).toBe(6); // elixir
  });

  it("should not decrease quality of items to less than 0", function () {
    const shop1 = new Shop([new Item("+5 Dexterity Vest", 10, 5)]);
    for (let i = 0; i < 10; i++) {
      shop1.newDay();
    }
    expect(shop1.items[0].quality).toBe(0);
  });

  it("should not change the quality or sellIn of sulfuras", function () {
    expect(gildedRose.items[3].sellIn).toBe(0);
    expect(gildedRose.items[3].quality).toBe(50);

    expect(gildedRose.items[4].sellIn).toBe(-1);
    expect(gildedRose.items[4].quality).toBe(50);
  });

  it("should increase the quality of brie", function () {
    const shop2 = new Shop([new Item("Aged Brie", 2, 0)]);
    shop2.newDay();
    expect(shop2.items[0].quality).toBe(1);
  });

  describe("backstage passes", function () {
    const shop3 = new Shop([
      new Item("Backstage passes to a TAFKAL80ETC concert", 15, 50),
      new Item("Backstage passes to a TAFKAL80ETC concert", 10, 46),
      new Item("Backstage passes to a TAFKAL80ETC concert", 5, 44),
      new Item("Backstage passes to a TAFKAL80ETC concert", 0, 44),
    ]);

    shop3.newDay();

    it("should not increase quality above 50", function () {
      expect(shop3.items[0].sellIn).toBe(14);
      expect(shop3.items[0].quality).toBe(50);
    });

    it("increases quality by 2 when there are 10 days or less", function () {
      expect(shop3.items[1].sellIn).toBe(9);
      expect(shop3.items[1].quality).toBe(48);
    });

    it("reduces quality to 0 when concert is over", function () {
      expect(shop3.items[3].sellIn).toBe(-1);
      expect(shop3.items[3].quality).toBe(0);
    });
  });
});
