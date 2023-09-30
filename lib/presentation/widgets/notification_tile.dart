import 'package:flutter/material.dart';

import '../../constants/theme.dart';

Widget makeNotificationTile(IconData? icon, String message) {
  return Container(
    height: 90,
    margin: const EdgeInsets.all(12),
    child: Row(
      children: [
        Icon(icon),
        const SizedBox(
          width: 20,
        ),
        // ignore: sized_box_for_whitespace
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
