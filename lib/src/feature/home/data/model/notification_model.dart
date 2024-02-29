import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:king_saud_hospital/src/feature/home/data/model/sessions_model.dart';

part 'notification_model.g.dart';

@HiveType(typeId: 1)
class NotificationsModel extends Equatable {
  @HiveField(1)
  final int sessionId;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String image;
  @HiveField(4)
  final String content;
  @HiveField(5)
  final NotificationSessionCustomField customField;
  @HiveField(6)
  final String customFieldVideo;
  @HiveField(7)
  final bool favoriteStatus;

  const NotificationsModel({
    required this.sessionId,
    required this.title,
    required this.image,
    required this.content,
    required this.customField,
    required this.customFieldVideo,
    required this.favoriteStatus,
  });

  factory NotificationsModel.fromJson(Map<String, dynamic> json) {
    return NotificationsModel(
      sessionId: int.parse(json["sessionId"]),
      title: json["title"],
      image: json["image"],
      content: json["content"],
      customField:
          NotificationSessionCustomField.fromJson(json["custom_field"]),
      customFieldVideo: json["custom_field_video"],
      favoriteStatus: json["favorite_status"],
    );
  }

  @override
  List<Object> get props => [
        sessionId,
        title,
        image,
        content,
        customField,
        customFieldVideo,
        favoriteStatus,
      ];
}


@HiveType(typeId: 2)
class NotificationSessionCustomField {
  @HiveField(1)
  final String pageCaption;
  @HiveField(2)
  final String sessionType;
  @HiveField(3)
  final List<String> sessionSpeaker;
  @HiveField(4)
  final String sessionDate;
  @HiveField(5)
  final String sessionTime;
  @HiveField(6)
  final String location;
  @HiveField(7)
  final String documentLink;

  NotificationSessionCustomField({
    required this.pageCaption,
    required this.sessionType,
    required this.sessionSpeaker,
    required this.sessionDate,
    required this.sessionTime,
    required this.location,
    required this.documentLink,
  });

  factory NotificationSessionCustomField.fromJson(Map<String, dynamic> json) {
    return NotificationSessionCustomField(
      pageCaption: json["page-caption"],
      sessionType: json["session-type"],
      sessionSpeaker: json["session-speaker"].cast<String>(),
      sessionDate: json["session-date"],
      sessionTime: json["session-time"],
      location: json["location"],
      documentLink: json["document-link"],
    );
  }

//
}
