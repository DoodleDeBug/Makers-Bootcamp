const Thermostat = require("./thermostat");

describe("Thermostat class", () => {
  const thermostat = new Thermostat();

  it("returns the temperature", () => {
    expect(thermostat.getTemperature()).toBe(20);
  });

  it("returns an increased temperature", () => {
    thermostat.up();
    expect(thermostat.getTemperature()).toBe(22);
  });

  it("returns a decreased temperature", () => {
    thermostat.down();
    expect(thermostat.getTemperature()).toBe(21);
  });

  it("doesnt decrease temperature below 10", () => {
    for (let i = 0; i < 20; i++) {
      thermostat.down();
    }
    expect(thermostat.getTemperature()).toBe(10);
  });

  it("has power saving mode on by default", () => {
    for (let i = 0; i < 50; i++) {
      thermostat.up();
    }
    expect(thermostat.getTemperature()).toBe(25);
  });

  it("it has max temperature of 35 when power saving mode is off", () => {
    thermostat.setPowerSavingMode(false);
    for (let i = 0; i < 50; i++) {
      thermostat.up();
    }
    expect(thermostat.getTemperature()).toBe(35);
  });

  it("it has max temperature of 25 when power saving mode is on", () => {
    thermostat.setPowerSavingMode(true);
    for (let i = 0; i < 50; i++) {
      thermostat.up();
    }
    expect(thermostat.getTemperature()).toBe(25);
  });

  it("resets the temp to 20", () => {
    for (let i = 0; i < 50; i++) {
      thermostat.up();
    }
    thermostat.reset();
    expect(thermostat.getTemperature()).toBe(20);
  });

  it("returns low energy usage", () => {
    thermostat.reset();
    for (let i = 0; i < 4; i++) {
      thermostat.down();
    }
    expect(thermostat.usage()).toBe("low-usage");
  });
  it("returns medium energy usage", () => {
    thermostat.reset();
    thermostat.setPowerSavingMode(true);
    for (let i = 0; i < 5; i++) {
      thermostat.up();
    }
    expect(thermostat.usage()).toBe("medium-usage");
  });

  it("returns high energy usage", () => {
    thermostat.reset();
    thermostat.setPowerSavingMode(false);
    for (let i = 0; i < 10; i++) {
      thermostat.up();
    }
    expect(thermostat.usage()).toBe("high-usage");
  });
});
