import 'dart:convert';
import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:king_saud_hospital/src/feature/auth/presentation/screens/sign_in/widget/form_field.dart';
import 'package:king_saud_hospital/src/feature/home/data/model/sessions_model.dart';
import 'package:rxdart/subjects.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationHandler {
  NotificationHandler._();

  static final BehaviorSubject<String?> onNotificationClick = BehaviorSubject();

  static final _notification = FlutterLocalNotificationsPlugin();

  static void init() async {
    final NotificationAppLaunchDetails? notificationAppLaunchDetails =
        await _notification.getNotificationAppLaunchDetails();

    final didNotificationLaunchApp =
        notificationAppLaunchDetails?.didNotificationLaunchApp ?? false;

   /* showToast(
      msg: 'didNotificationLaunchApp $didNotificationLaunchApp',
      state: ToastStates.SUCCESS,
    );*/

    if (didNotificationLaunchApp) {
      var payload = notificationAppLaunchDetails!.notificationResponse!;
      onSelectedBack(payload);
    } else {
      await _notification.initialize(
        const InitializationSettings(
          android: AndroidInitializationSettings('@mipmap/ic_launcher'),
          iOS: DarwinInitializationSettings(),
        ),
        onDidReceiveNotificationResponse: onDidReceive,
        onDidReceiveBackgroundNotificationResponse: onSelectedBack,
      );
    }
  }

  @pragma('vm:entry-point')
  static void onSelectedBack(NotificationResponse details) {
    if (details.payload != null && details.payload!.isNotEmpty) {
      onNotificationClick.add(details.payload);
    }
  }

  static void onDidReceive(NotificationResponse details) {
    if (details.payload != null && details.payload!.isNotEmpty) {
      onNotificationClick.add(details.payload);
    }
  }

  static Future notificationDetails() async {
    AndroidNotificationChannel channel = AndroidNotificationChannel(
      Random.secure().nextInt(10000).toString(),
      'High Importance Channel',
      importance: Importance.max,
    );
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      channel.id.toString(),
      channel.name.toString(),
      channelDescription: 'channel description',
      importance: Importance.max,
      priority: Priority.max,
      ticker: 'ticker',
    );
    DarwinNotificationDetails iOSPlatformChannelSpecifics =
        const DarwinNotificationDetails();
    NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    return platformChannelSpecifics;
  }

  static Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payLoad,
  }) async {
    return _notification.show(
      id,
      title,
      body,
      await notificationDetails(),
      payload: payLoad,
    );
  }

  static Future<void> scheduledNotification({
    required final HomePrograms session,
    required int remind,
    int id = 1,
    String? payload,
  }) async {
    await _notification.zonedSchedule(
      id,
      session.title!,
      session.title,
      //tz.TZDateTime.now(tz.local).add(const Duration(seconds: 50)),
      nextInstanceOfAfter30Min(session.customField!, remind),
      await notificationDetails(),
      payload: jsonEncode(session),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  static tz.TZDateTime nextInstanceOfAfter30Min(
    HomeCustomField dateTime,
    int remind,
  ) {
    String time = (dateTime.sessionTime!.split('-')[0]).trim();

    time = time.split('–')[0];

    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);

    print('now = $now');

    DateTime formattedDate = parseDateTime('${dateTime.sessionDate} $time');

    final tz.TZDateTime fd = tz.TZDateTime.from(formattedDate, tz.local);

    tz.TZDateTime scheduledDate = tz.TZDateTime(
      tz.local,
      fd.year,
      fd.month,
      fd.day,
      fd.hour,
      fd.minute,
    );

    scheduledDate = afterRemindSessionsInMin(remind, scheduledDate);

    return scheduledDate;
  }

  static tz.TZDateTime afterRemindSessionsInMin(
      int remind, tz.TZDateTime scheduledDate) {
    if (remind == 1) {
      scheduledDate = scheduledDate.subtract(const Duration(minutes: 1));
    }

    if (remind == 30) {
      scheduledDate = scheduledDate.subtract(const Duration(minutes: 30));
    }
    return scheduledDate;
  }

  static Future cancelAllNotifications() async {
    await _notification.cancelAll();
  }

  static Future cancelSingleNotification(int id) async {
    await _notification.cancel(id);
  }
}

DateTime parseDateTime(String date) {
  // '2020-9-20' => '2020-09-20'

  List<String> parts = date.split('-');

  String formattedDateStr =
      '${parts[0]}-${parts[1].padLeft(2, '0')}-${parts[2].padLeft(2, '0')}';
  //  ودي بعد الهندله

  DateTime formattedDate = DateTime.parse(formattedDateStr.trim());

  return formattedDate;
}
