import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
// ignore: unused_import
import 'package:weatherify/constants/theme.dart';
import 'package:weatherify/data/database/notification_adapter.dart';
import 'package:weatherify/data/services/notiification_service.dart';

import 'package:weatherify/domain/weather/weather_bloc.dart';
import 'package:weatherify/presentation/screens/home_screen.dart';
import 'package:weatherify/presentation/screens/information_screen.dart';
import 'package:weatherify/presentation/screens/search_screen.dart';
import 'package:weatherify/presentation/screens/splash_screen.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  // init hive
  await Hive.initFlutter();
  Hive.registerAdapter(NotificationModelAdapter());

  var box = await Hive.openBox('notification');

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
      home: const RainAnimation(),
      initialRoute: '/splash', // Set this to match the route below
      getPages: [
        GetPage(
          name: '/splash', // Use the same name as the initialRoute
          page: () => const RainAnimation(),
        ),
        GetPage(
          name: '/home', // Route for HomeScreen
          page: () => const HomeScreen(cityname: 'Kolkata'),
        ),
        GetPage(
          name: '/search',
          // ignore: prefer_const_constructors
          page: () => SearchScreen(),
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
