part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}

// events

class WeatherInitialEvent extends WeatherEvent {}

class RequestWeatherEvent extends WeatherEvent {}
