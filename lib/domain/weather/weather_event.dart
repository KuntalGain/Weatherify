part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}

// events

class WeatherInitialEvent extends WeatherEvent {}

class RequestWeatherEvent extends WeatherEvent {
  final String cityName;

  RequestWeatherEvent({required this.cityName});
}

class SearchBtnPressedEvent extends WeatherEvent {
  final BuildContext context;

  SearchBtnPressedEvent({required this.context});
}
