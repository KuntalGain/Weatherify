import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:weatherify/data/model/forcast.dart';

class ForcastRepository {
  final String key = 'ad2b875148c8482485522321232609';
  final String baseUrl = 'http://api.weatherapi.com/v1/forecast.json?';

  Future<List<HourlyForecast>> fetchForcastDataHR(String query) async {
    final response = await http
        .get(Uri.parse('${baseUrl}key=$key&q=$query&days=1&aqi=no&alerts=no'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      final List<dynamic> hourlyDataJson =
          data['forecast']['forecastday'][0]['hour'];

      // Parse hourly data
      final List<HourlyForecast> hourlyData = hourlyDataJson
          .map((hourJson) => HourlyForecast.fromJson(hourJson))
          .toList();

      return hourlyData;
    } else {
      throw Exception('Failed to Fetch Data');
    }
  }

  Future<List<WeeklyForecast>> fetchForcastDataWK(String query) async {
    final response = await http
        .get(Uri.parse('${baseUrl}key=$key&q=$query&days=5&aqi=no&alerts=no'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      final List<dynamic> weeklyDataJson = data['forecast']['forecastday'];

      // Parse hourly data
      final List<WeeklyForecast> weeklyData = weeklyDataJson
          .map((hourJson) => WeeklyForecast.fromJson(hourJson))
          .toList();

      return weeklyData;
    } else {
      throw Exception('Failed to Fetch Data');
    }
  }
}
