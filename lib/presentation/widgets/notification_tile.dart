import 'package:flutter/material.dart';

import '../../constants/theme.dart';

Widget makeNotificationTile(IconData? icon, String message) {
  return Container(
    height: 90,
    margin: EdgeInsets.all(12),
    child: Row(
      children: [
        Icon(icon),
        SizedBox(
          width: 20,
        ),
        Container(
          height: 40,
          width: 270,
          child: Row(
            children: [
              Flexible(
                child: Text(
                  message,
                  style: AppTheme.buttonText,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
