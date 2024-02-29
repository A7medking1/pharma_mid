import 'package:king_saud_hospital/src/core/app_prefs/app_prefs.dart';
import 'package:king_saud_hospital/src/core/services/index.dart';

String stringLang(String text, String textAr) {
  final lang = sl<AppPreferences>().getAppLang();
  if (lang == 'en') {
    return text;
  } else {
    return textAr;
  }
}
