class Thermostat {
  constructor() {
    this.temp = 20;
    this.max_temp = 25;
  }

  getMaxTemp() {
    return this.max_temp;
  }

  getTemperature() {
    return this.temp;
  }

  up() {
    if (this.temp + 2 <= this.max_temp) {
      this.temp += 2;
    } else {
      this.temp = this.max_temp;
    }
  }

  down() {
    if (this.temp > 10) {
      this.temp -= 1;
    }
  }

  setPowerSavingMode(status) {
    if (status === true) {
      this.max_temp = 25;
    } else {
      this.max_temp = 35;
    }
  }

  reset() {
    this.temp = 20;
  }

  usage() {
    if (this.temp < 18) {
      return "low-usage";
    } else if (this.temp <= 25) {
      return "medium-usage";
    } else {
      return "high-usage";
    }
  }
}

module.exports = Thermostat;
