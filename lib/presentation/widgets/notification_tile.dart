import 'package:flutter/material.dart';
import 'package:weatherify/constants/theme.dart';
import 'package:weatherify/data/model/notification.dart';

Widget makeNotificationTile(IconData? icon, NotificationModel message) {
  return Container(
    height: 50,
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
                  '${message.alert} - ${message.dateTime}',
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
