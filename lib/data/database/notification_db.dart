import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:weatherify/data/model/notification.dart';

class NotificationDB {
  List<NotificationModel> alerts = [];

  // reference the box
  final _myBox = Hive.box('notification');

  // methods

  void createInitialData() {
    alerts = [
      NotificationModel(
        alert:
            'Welcome to Weatherify , here All Forcast Alert will be show here',
        dateTime: DateTime.now().toString(),
      ),
    ];
  }

  void loadData() {
    final storedData = _myBox.get("WEATHERIFY") as List<dynamic>;
    alerts = storedData.map((data) => data as NotificationModel).toList();
  }

  void updateDB() {
    _myBox.put("WEATHERIFY", alerts);
  }
}
