// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotificationsModelAdapter extends TypeAdapter<NotificationsModel> {
  @override
  final int typeId = 1;

  @override
  NotificationsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NotificationsModel(
      sessionId: fields[1] as int,
      title: fields[2] as String,
      image: fields[3] as String,
      content: fields[4] as String,
      customField: fields[5] as NotificationSessionCustomField,
      customFieldVideo: fields[6] as String,
      favoriteStatus: fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, NotificationsModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(1)
      ..write(obj.sessionId)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.content)
      ..writeByte(5)
      ..write(obj.customField)
      ..writeByte(6)
      ..write(obj.customFieldVideo)
      ..writeByte(7)
      ..write(obj.favoriteStatus);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class NotificationSessionCustomFieldAdapter
    extends TypeAdapter<NotificationSessionCustomField> {
  @override
  final int typeId = 2;

  @override
  NotificationSessionCustomField read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NotificationSessionCustomField(
      pageCaption: fields[1] as String,
      sessionType: fields[2] as String,
      sessionSpeaker: (fields[3] as List).cast<String>(),
      sessionDate: fields[4] as String,
      sessionTime: fields[5] as String,
      location: fields[6] as String,
      documentLink: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NotificationSessionCustomField obj) {
    writer
      ..writeByte(7)
      ..writeByte(1)
      ..write(obj.pageCaption)
      ..writeByte(2)
      ..write(obj.sessionType)
      ..writeByte(3)
      ..write(obj.sessionSpeaker)
      ..writeByte(4)
      ..write(obj.sessionDate)
      ..writeByte(5)
      ..write(obj.sessionTime)
      ..writeByte(6)
      ..write(obj.location)
      ..writeByte(7)
      ..write(obj.documentLink);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationSessionCustomFieldAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
