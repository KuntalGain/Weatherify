
String getWeatherIcon(String weather) {
  String currentWeather = '';

  switch (weather) {
    case "Sunny":
    case "clear":
      currentWeather = 'assets/sunny.png';
      break;

    case "Partly cloudy":
    case "Fog":
    case "Mist":
    case "Overcast":
    case "Cloudy":
      currentWeather = 'assets/cloudy.png';
      break;

    case "Patchy rain possible":
    case "Torrential rain shower":
    case "Moderate or heavy rain shower":
    case "Light rain shower":
    case "Heavy rain":
    case "Heavy rain at times":
    case "Moderate rain":
    case "Moderate rain at times":
    case "Light rain":
    case "Patchy light rain":
    case "Light drizzle":
    case "Patchy light drizzle":
      currentWeather = 'assets/rainy.png';
      break;

    case "Blizzard":
    case "Moderate or heavy snow with thunder":
    case "Patchy light snow with thunder":
    case "Moderate or heavy showers of ice pellets":
    case "Light showers of ice pellets":
    case "Moderate or heavy snow showers":
    case "Light snow showers":
    case "Ice pellets":
    case "Heavy snow":
    case "Patchy heavy snow":
    case "Moderate snow":
    case "Patchy moderate snow":
    case "Light snow":
    case "Patchy light snow":
    case "Moderate or heavy freezing rain":
    case "Light freezing rain":
    case "Freezing drizzle":
    case "Freezing fog":
    case "Blowing snow":
    case "Patchy freezing drizzle possible":
    case "Patchy snow possible":
      currentWeather = 'assets/snowy.png';
      break;

    default:
      currentWeather = 'assets/stormy.png';
  }

  return currentWeather;
}
