import 'package:hive/hive.dart';

@HiveType(typeId: 0) // Use the same type ID as in the adapter
class NotificationModel extends HiveObject {
  @HiveField(0)
  final String alert;

  @HiveField(1)
  final String dateTime;

  NotificationModel({
    required this.alert,
    required this.dateTime,
  });
}
