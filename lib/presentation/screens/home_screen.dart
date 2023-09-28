// For Home Screen of App

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:weatherify/constants/theme.dart';
import 'package:weatherify/presentation/widgets/forcast_btn.dart';
import 'package:weatherify/presentation/widgets/weather_card.dart';
import 'package:weatherify/presentation/widgets/weather_condition.dart';
// ignore: unused_import
import 'package:weatherify/presentation/widgets/bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String weatherCondition = "Sunny";

  void _showNotificationBottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 490,
          // Customize your bottom sheet content here
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Your Notifications',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
              // Add your notification content here
              Expanded(
                  child: ListView.builder(
                itemCount: 3,
                itemBuilder: (ctx, idx) {
                  return Container(
                    height: 90,
                    margin: EdgeInsets.all(12),
                    color: Colors.black,
                  );
                },
              )),
            ],
          ),
        );
      },
    );
  }

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
                  onTap: _showNotificationBottomSheet,
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
