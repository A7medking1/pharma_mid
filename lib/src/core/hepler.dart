import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

RoundedRectangleBorder buildRoundedRectangleBorder(double radius) {
  return RoundedRectangleBorder(
      borderRadius: BorderRadiusDirectional.circular(radius));
}

extension MyRadius on double {
  void radius() {
    RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(this));
  }
}

extension DateStringsSorting on List<String> {
  List<String> sortDateStrings() {
    List<String> list = toSet().toList();
    return list
      ..sort((a, b) {
        if (a == '') {
          a = '2024-11-20';
        }
        if (b == '') {
          b = '2024-11-20';
        }
        return DateTime.parse(a).compareTo(DateTime.parse(b));
      });
  }
}

// Example usage:
// List<String> dateStrings = ['2023-01-15', '2022-12-20', '2023-05-01'];
// List<String> sortedDateStrings = dateStrings.sortDateStrings();

extension ThemeShortcuts on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  ColorScheme get colorScheme => theme.colorScheme;

  Color get primaryColor => theme.primaryColor;
}

// extension BaseUrl on String {
//   String get toImageUrl {
//    return ApiConstant.imagePath(this);
//   }
// }

extension CapitalizeFirstLast on String {
  String capitalizedFirst() =>
      substring(0, 1).toUpperCase() + substring(1).toLowerCase();

  String capitalizeFirstLastSymbols() {
    if (isNotEmpty && contains('-')) {
      String firstSymbol = this[0].toUpperCase();
      String lastSymbol = this[length - 1].toUpperCase();
      return '$firstSymbol${substring(1, length - 1)}$lastSymbol';
    } else {
      return capitalizedFirst();
    }
  }
}

extension UrlLauncherExtension on String {
  Future<void> goToUrl() async {
    if (!await launchUrl(Uri.parse(this))) {
      throw Exception('Could not launch $this');
    }
  }
}

class FadeAnimation extends StatelessWidget {
  final Widget child;

  const FadeAnimation({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      from: 20,
      duration: const Duration(milliseconds: 500),
      child: child,
    );
  }
}
