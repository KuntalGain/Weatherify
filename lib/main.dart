import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: unused_import
import 'package:weatherify/constants/theme.dart';
import 'package:weatherify/presentation/screens/splash_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
