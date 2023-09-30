import 'package:flutter/material.dart';
import 'package:weatherify/data/model/notification.dart';

import '../../constants/theme.dart';

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
        SizedBox(
          height: 40,
          width: 270,
          child: Row(
            children: [
              Flexible(
                child: Text(
                  '${message.alert} - ${message.dateTime.day}/${message.dateTime.month}',
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
