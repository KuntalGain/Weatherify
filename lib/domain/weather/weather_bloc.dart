import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:weatherify/data/model/weather.dart';

import 'package:weatherify/data/repos/weather_repository.dart';

import 'package:weatherify/data/services/weather_services.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final APIService apiService = APIService();
  final WeatherRepository repository = WeatherRepository();

  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherInitialEvent>((event, emit) async {
      emit(WeatherInitial());

      // execute bussiness logic

      debugPrint('Weather Initial Event Triggered');

      // await Future.delayed(Duration(seconds: 2));

      emit(WeatherLoadingState());

      await Future.delayed(const Duration(seconds: 2));

      debugPrint('Weather Loading State');
    });
    on<RequestWeatherEvent>((event, emit) async {
      try {
        final weatherData = await repository.getWeather(event.cityName);

        emit(WeatherLoadedState(weatherData: weatherData));
      } catch (e) {
        emit(WeatherErrorState(message: e.toString()));
      }
    });
    on<SearchBtnPressedEvent>((event, emit) async {
      Get.toNamed('/search');
    });
  }
}
