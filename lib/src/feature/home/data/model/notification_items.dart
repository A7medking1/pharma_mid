import 'package:king_saud_hospital/src/feature/home/data/model/notification_model.dart';

class NotificationItems extends NotificationsModel {
  const NotificationItems({
    required super.sessionId,
    required super.title,
    required super.image,
    required super.content,
    required super.customField,
    required super.customFieldVideo,
    required super.favoriteStatus,
  });

  factory NotificationItems.fromEntity(NotificationsModel media) {
    return NotificationItems(
      sessionId: media.sessionId,
      title: media.title,
      image: media.image,
      content: media.content,
      customField: media.customField,
      customFieldVideo: media.customFieldVideo ?? '',
      favoriteStatus: media.favoriteStatus,
    );
  }
}
