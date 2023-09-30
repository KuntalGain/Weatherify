// Handle the Response from API

// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:weatherify/data/model/weather.dart';
import 'package:weatherify/data/services/weather_services.dart';

class WeatherRepository {
  final APIService apiService = APIService();

  Future<Weather> getWeather(String cityName) async {
    final weatherData = await apiService.fetchWeatherData(cityName);

    final temp = weatherData["current"]["temp_c"];
    final condition = weatherData["current"]["condition"]["text"];
    final windSpeed = weatherData["current"]["wind_kph"];
    final humidity = weatherData["current"]["humidity"];

    // Json -> Model data
    final weather = Weather(
      temp: temp,
      condition: condition,
      windSpeed: windSpeed,
      humidity: humidity,
    );

    return weather;
  }
}
