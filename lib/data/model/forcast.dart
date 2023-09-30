class HourlyForecast {
  final String time;
  final String condition;
  final double temperature;
  final int willRain;
  final int willSnow;

  HourlyForecast({
    required this.time,
    required this.condition,
    required this.temperature,
    required this.willRain,
    required this.willSnow,
  });
  factory HourlyForecast.fromJson(Map<String, dynamic> json) {
    return HourlyForecast(
      time: json['time'] ??
          '', // Replace with the actual key in your JSON response
      condition: json['condition']['text'] ??
          '', // Replace with the correct key for the condition text
      temperature: (json['temp_c'] ?? 0.0).toDouble(),
      willRain: json["chance_of_rain"],
      willSnow: json["chance_of_snow"],
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
