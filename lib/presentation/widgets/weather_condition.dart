import 'package:flutter/material.dart';
import 'package:weatherify/constants/theme.dart';

Color? getConditions(String weather) {
  Color clr;

  if (weather.toLowerCase() == "sunny") {
    clr = AppTheme.sunnyColor;
  } else if (weather.toLowerCase() == "rainy") {
    clr = AppTheme.rainyColor;
  } else {
    clr = AppTheme.stormyColor;
  }

  return clr;
}

Image? getWeatherIcon(String weather) {
  Image currentWeather;

  if (weather.toLowerCase() == "sunny") {
    currentWeather = Image.asset('assets/sunny.jpg');
  } else if (weather.toLowerCase() == "rainy") {
    currentWeather = Image.asset('assets/rainy.jpg');
  } else {
    currentWeather = Image.asset('assets/stormy.jpg');
  }

  return currentWeather;
}
