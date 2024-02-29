import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:king_saud_hospital/src/core/notification_service/notification_service.dart';
import 'package:king_saud_hospital/src/core/resources/language_manager.dart';
import 'package:king_saud_hospital/src/core/services/index.dart';
import 'package:king_saud_hospital/src/feature/home/data/model/notification_model.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  // Bloc.observer = MyBlocObserver();

  await Hive.initFlutter();
  Hive.registerAdapter(NotificationsModelAdapter());
  Hive.registerAdapter(NotificationSessionCustomFieldAdapter());

  await Hive.openBox('notification');

  await ServicesLocator().init();

  NotificationHandler.init();

  tz.initializeTimeZones();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(
    EasyLocalization(
      supportedLocales: const [arabicLocal, englishLocal],
      fallbackLocale: englishLocal,
      path: assetsLocalization,
      child: Phoenix(
        child: const MyApp(),
      ),
    ),
  );
}
