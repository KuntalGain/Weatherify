import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherInitialEvent>((event, emit) async {
      emit(WeatherInitial());

      // execute bussiness logic

      debugPrint('Weather Initial Event Triggered');

      await Future.delayed(Duration(seconds: 2));

      emit(WeatherLoadingState());

      await Future.delayed(Duration(seconds: 2));

      debugPrint('Weather Loading State');

      emit(WeatherLoadedState());
    });
  }
}
