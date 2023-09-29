class HourlyForecast {
  final String time; // Example: "12 PM"
  final String condition; // Example: "Partly Cloudy"
  final double temperature; // Example: 25.0 (in Celsius)

  HourlyForecast({
    required this.time,
    required this.condition,
    required this.temperature,
  });
  factory HourlyForecast.fromJson(Map<String, dynamic> json) {
    return HourlyForecast(
      time: json['time'] ??
          '', // Replace with the actual key in your JSON response
      condition: json['condition']['text'] ??
          '', // Replace with the correct key for the condition text
      temperature: (json['temp_c'] ?? 0.0).toDouble(),
    );
  }
}

class WeeklyForecast {
  final String date;
  final String condition;
  final double temperature;

  WeeklyForecast({
    required this.date,
    required this.condition,
    required this.temperature,
  });
  factory WeeklyForecast.fromJson(Map<String, dynamic> json) {
    return WeeklyForecast(
      date: json["date"] ??
          '', // Replace with the actual key in your JSON response
      condition: json['day']['condition']['text'] ??
          '', // Replace with the correct key for the condition text
      temperature: (json['day']['avgtemp_c'] ?? 0.0).toDouble(),
    );
  }
}
