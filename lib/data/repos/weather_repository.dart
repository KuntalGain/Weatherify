// Handle the Response from API

import 'package:weatherify/data/model/weather.dart';
import 'package:weatherify/data/services/weather_services.dart';

class WeatherRepository {
  final APIService apiService = APIService();

  Future<Weather> getWeather(String cityName) async {
    final weatherData = await apiService.fetchWeatherData(cityName);

    final _temp = weatherData["current"]["temp_c"];
    final _condition = weatherData["current"]["condition"]["text"];
    final _windSpeed = weatherData["current"]["wind_kph"];
    final _humidity = weatherData["current"]["humidity"];

    // Json -> Model data
    final weather = Weather(
      temp: _temp,
      condition: _condition,
      windSpeed: _windSpeed,
      humidity: _humidity,
    );

    return weather;
  }
}
