part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

// states
class WeatherInitial extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final Weather weatherData;

  WeatherLoadedState({required this.weatherData});
}

class WeatherErrorState extends WeatherState {
  final String message;

  WeatherErrorState({required this.message});
}
