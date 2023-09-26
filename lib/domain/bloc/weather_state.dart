part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

// states
class WeatherInitial extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {}

class WeatherErrorState extends WeatherState {}
