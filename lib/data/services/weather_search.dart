// Handle the API Request here

import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchService {
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String Api_key = 'ad2b875148c8482485522321232609';

  Future<Map<String, dynamic>> fetchCityData(String param) async {
    final response = await http
        .get(Uri.parse('$baseUrl/search.json?key=${Api_key}&q=${param}'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
