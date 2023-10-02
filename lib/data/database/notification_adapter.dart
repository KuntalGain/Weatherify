import 'package:hive/hive.dart';
import 'package:weatherify/data/model/notification.dart';

class NotificationModelAdapter extends TypeAdapter<NotificationModel> {
  @override
  final int typeId = 0; // Assign a unique ID for your model

  @override
  NotificationModel read(BinaryReader reader) {
    return NotificationModel(
      alert: reader.readString(),
      dateTime: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, NotificationModel obj) {
    writer.writeString(obj.alert);
    writer.writeString(obj.dateTime);
  }
}
