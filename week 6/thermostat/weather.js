const key = require("./api_key");
const got = require("got");

console.log("Requesting weather data");

class Weather {
  fetchWeatherData(city, callback) {
    const apiKey = key();
    const apiUrl = `http://api.openweathermap.org/data/2.5/weather?units=metric&q=${city}&appid=${apiKey}`;

    let weatherData = null;

    got(apiUrl).then((response) => {
      callback(JSON.parse(response.body));
    });
  }
}

module.exports = Weather;
