import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
// ignore: unused_import
import 'package:weatherify/constants/theme.dart';

import 'package:weatherify/domain/weather/weather_bloc.dart';
import 'package:weatherify/presentation/screens/home_screen.dart';
import 'package:weatherify/presentation/screens/information_screen.dart';
import 'package:weatherify/presentation/screens/search_screen.dart';
import 'package:weatherify/presentation/screens/splash_screen.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => WeatherBloc(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      initialRoute: '/splash', // Set this to match the route below
      getPages: [
        GetPage(
          name: '/splash', // Use the same name as the initialRoute
          page: () => SplashScreen(),
        ),
        GetPage(
          name: '/home', // Route for HomeScreen
          page: () => const HomeScreen(cityname: 'Kolkata'),
        ),
        GetPage(
          name: '/search',
          page: () => const SearchScreen(),
        ),
        GetPage(
            name: '/info', page: () => const InformationScreen(cityname: '')),
      ],
    );

    // return MaterialApp(
    //   home: InformationScreen(cityname: 'Kolkata'),
    // );
  }
}
