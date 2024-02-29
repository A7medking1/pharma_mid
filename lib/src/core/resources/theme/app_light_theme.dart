import 'package:flutter/services.dart';
import 'package:king_saud_hospital/src/core/resources/app_colors.dart';
import 'package:king_saud_hospital/src/core/resources/font_manager.dart';
import 'package:king_saud_hospital/src/core/resources/style.dart';
import 'package:flutter/material.dart';

ThemeData getAppTheme() {
  return ThemeData(
    fontFamily: 'expo-book',
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
      elevation: 0.0,
      backgroundColor: Colors.white,
      centerTitle: true,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,

      ),
      titleTextStyle: getBoldStyle(),
      iconTheme: const IconThemeData(color: Colors.black),
    ),
    tabBarTheme: TabBarTheme(
      labelColor: AppColors.primary,
      indicator: const BoxDecoration(),
      dividerColor: Colors.transparent,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      unselectedLabelColor: AppColors.black,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 10.0,
      selectedIconTheme: IconThemeData(color: AppColors.primary),
      unselectedIconTheme: IconThemeData(color: Colors.black),
      unselectedItemColor: Colors.black,
    ),
    textTheme: TextTheme(
      displayLarge: getMediumStyle(fontSize: FontSize.s30),
      displayMedium: getRegularStyle(fontSize: FontSize.s24),
      headlineLarge: getSemiBoldStyle(fontSize: FontSize.s30),
      headlineMedium: getRegularStyle(fontSize: FontSize.s24),
      titleMedium: getMediumStyle(fontSize: FontSize.s24,),
      titleLarge: getMediumStyle(fontSize: FontSize.s30,),
      titleSmall: getRegularStyle(fontSize: FontSize.s16, ),
      bodyLarge: getBoldStyle(
        color: AppColors.black,
        fontSize: FontSize.s28,
      ),
      bodySmall: getBoldStyle(color: Colors.grey),
      bodyMedium:
          getRegularStyle(color: AppColors.grey, fontSize: FontSize.s20),
      labelSmall: getBoldStyle(
        color: AppColors.primary,
        fontSize: FontSize.s12,
      ),
    ),
  );
}
