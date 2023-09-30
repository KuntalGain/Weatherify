import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherify/data/model/forcast.dart';
import 'package:weatherify/presentation/widgets/weather_condition.dart';

import '../../constants/theme.dart';

Widget hourlyForcastCard(HourlyForecast forecast) {
  String originalTime = forecast.time;
  DateTime dateTime = DateTime.parse(originalTime);
  String formattedTime = DateFormat.Hm().format(dateTime); // "8:00"

  return Container(
    margin: const EdgeInsets.all(4),
    padding: const EdgeInsets.all(5),
    width: 80,
    height: 155,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(14),
      color: const Color.fromRGBO(255, 255, 255, 0.2),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          '${forecast.temperature}°C',
          style: AppTheme.attributes,
        ),
        SizedBox(
          height: 60,
          width: 60,
          child: Image.asset(getWeatherIcon(forecast.condition)),
        ),
        Text(
          formattedTime,
          style: AppTheme.attributes,
        ),
      ],
    ),
  );
}

Widget dailyForcastCard(WeeklyForecast forecast) {
  String originalDate = forecast.date;
  DateTime dateTime = DateTime.parse(originalDate);
  String formattedTime = DateFormat.MMMd().format(dateTime);

  return Container(
    height: 60,
    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          formattedTime,
          style: AppTheme.attributes,
        ),
        SizedBox(
          height: 60,
          width: 60,
          child: Image.asset(getWeatherIcon(forecast.condition)),
        ),
        Text(
          '${forecast.temperature}°C',
          style: AppTheme.attributes,
        ),
      ],
    ),
  );
}
