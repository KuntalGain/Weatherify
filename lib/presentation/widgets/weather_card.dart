import 'package:flutter/material.dart';
import 'package:weatherify/constants/theme.dart';
import 'package:weatherify/presentation/widgets/card_atrribute.dart';

String getMonth() {
  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  return months[DateTime.now().month];
}

Widget weatherCard() {
  return Container(
    width: 353,
    height: 335,
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: const Color(0x4cffffff),
      border: Border.all(color: Colors.grey.shade300.withOpacity(0.5)),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // Date
        Text(
          'Today , ${DateTime.now().day} ${getMonth()}',
          style: AppTheme.date,
        ),
        // temp

        Text(
          ' ${24}°',
          style: AppTheme.temperature,
        ),

        // condition

        const Text(
          'Cloudy',
          style: AppTheme.condition,
        ),
        // wind

        cardAttribute('Wind', '10 km/h', 'assets/windy.png'),
        cardAttribute('Hum ', '54 %', 'assets/hum.png'),

        // hum
      ],
    ),
  );
}
