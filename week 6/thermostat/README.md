# Thermostat

A simple program to manage a thermostat built during week 6 of the Makers Bootcamp.

## Usage:

#### Requirements:
- node
- jest

#### Testing:

Run `jest` or `jest --verbose`

#### Steps:

1. Fork and clone this repo
2. `cd` into the folder
3. Run `node cli.js` for the cli temperature controller
4. Run `node thermostat.js` then `const thermostat = new Thermostat();` for main program

## Tech Used:

- JS
- Jest
- Node

## MVP Spec:

   - Thermostat starts at 20 degrees //done//
   - You can increase the temperature with an up function //done//
   - You can decrease the temperature with a down function //done//
   - The minimum temperature is 10 degrees //done//
   - If power saving mode is on, the maximum temperature is 25 degrees //done//
   - If power saving mode is off, the maximum temperature is 32 degrees //done//
   - Power saving mode is on by default but it can also be turned off //done//
   - You can reset the temperature to 20 with a reset function //done//
   - You can ask about the thermostat's current energy usage: < 18 is low-usage, <= - 25 is medium-usage, anything else is high-usage. //done//

  ## Usage Examples:

![image](https://user-images.githubusercontent.com/75613073/143284824-1a612762-f9aa-4bca-bada-596c8105d3ed.png)

![image](https://user-images.githubusercontent.com/75613073/143284930-1eaff6d0-3a0e-400f-96bd-237d8aacb995.png)
