// Handle the API Request here

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchService {
  final String baseUrl = 'http://api.weatherapi.com/v1';
  // ignore: non_constant_identifier_names
  final String api_key = 'ad2b875148c8482485522321232609';

  Future<Map<String, dynamic>> fetchCityData(String param) async {
    final response =
        await http.get(Uri.parse('$baseUrl/search.json?key=$api_key&q=$param'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
