// 🌐 Integration with ICON & GFS APIs
const fetch = require("node-fetch");

class WeatherSync {
  constructor() {}

  async fetchGlobalWeather() {
    const gfs = await fetch("https://api.weather.gov/gridpoints/MPX/107,71/forecast");
    const data = await gfs.json();
    return data.properties.periods[0];
  }
}

module.exports = { WeatherSync };