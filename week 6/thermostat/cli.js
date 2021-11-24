const readlineSync = require("readline-sync");
const Thermostat = require("./thermostat");

const thermostat = new Thermostat();

let status = "";

// input = readlineSync.question('Command:');
while (true) {
  console.log(`Temperature is ${thermostat.getTemperature()} ${status}`);
  readlineSync.setDefaultOptions({
    limit: ["up", "down", "psm on", "psm off"],
  });
  command = readlineSync.question("Enter command:");
  if (command === "up") {
    thermostat.up();
  } else if (command === "down") {
    thermostat.down();
  } else if (command === "psm on") {
    thermostat.setPowerSavingMode(true);
    if (thermostat.getTemperature() == thermostat.getMaxTemp()) {
      status = "(maximum reached)";
    } else if (thermostat.getTemperature() == 10) {
      status = "(minimum reached)";
    }
  } else if (command === "psm off") {
    thermostat.setPowerSavingMode(false);
    status = "";
  }
}
