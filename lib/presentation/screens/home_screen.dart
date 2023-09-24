// For Home Screen of App

import 'package:flutter/material.dart';
import 'package:weatherify/constants/theme.dart';
import 'package:weatherify/presentation/widgets/forcast_btn.dart';
import 'package:weatherify/presentation/widgets/weather_card.dart';
import 'package:weatherify/presentation/widgets/weather_condition.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String weatherCondition = "Sunny";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getConditions(weatherCondition),
      body: SafeArea(
        child: Column(
          children: [
            // custom app bar

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // location
                Row(
                  children: [
                    Image.asset(
                      'assets/pin.png',
                      color: Colors.white,
                      height: 60,
                      width: 60,
                    ),
                    const Text(
                      'New York',
                      style: AppTheme.condition,
                    ),
                  ],
                ),
                // Cityname

                // notification
                GestureDetector(
                  onTap: () {
                    showBottomSheet(
                      context: context,
                      builder: (ctx) => Container(
                        height: 200,
                        color: Colors.deepPurple,
                      ),
                    );
                  },
                  child: Image.asset(
                    'assets/bell.png',
                    color: Colors.white,
                    height: 60,
                    width: 60,
                  ),
                ),
              ],
            ),

            // image

            SizedBox(
              height: 200,
              width: 200,
              child: getWeatherIcon(weatherCondition),
            ),

            // weather card

            weatherCard(),

            // forcast button

            const SizedBox(
              height: 20,
            ),
            forcastButton(),
          ],
        ),
      ),
    );
  }
}
