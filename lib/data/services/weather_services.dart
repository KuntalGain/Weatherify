// Handle the API Request here

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIService {
  final String baseUrl = 'http://api.weatherapi.com/v1';
  // ignore: non_constant_identifier_names
  final String api_key = 'ad2b875148c8482485522321232609';

  Future<Map<String, dynamic>> fetchWeatherData(String cityName) async {
    final response = await http.get(
        Uri.parse('$baseUrl/current.json?key=$api_key&q=$cityName&aqi=no'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
