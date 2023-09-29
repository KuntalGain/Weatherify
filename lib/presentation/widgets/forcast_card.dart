import 'package:flutter/material.dart';

import '../../constants/theme.dart';

Widget hourlyForcastCard(bool isPressed, int time) {
  return Container(
    margin: EdgeInsets.all(4),
    width: 80,
    height: 155,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: (!isPressed)
          ? AppTheme.sunnyColor
          : Color.fromRGBO(255, 255, 255, 0.2),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          '24°C',
          style: AppTheme.attributes,
        ),
        Container(
          height: 60,
          width: 60,
          child: Image.asset('assets/sunny.png'),
        ),
        Text(
          '${time}.00',
          style: AppTheme.attributes,
        ),
      ],
    ),
  );
}

Widget dailyForcastCard() {
  return Container(
    height: 60,
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '29/9',
          style: AppTheme.attributes,
        ),
        Container(
          height: 60,
          width: 60,
          child: Image.asset('assets/sunny.png'),
        ),
        Text(
          '24°C',
          style: AppTheme.attributes,
        ),
      ],
    ),
  );
}
