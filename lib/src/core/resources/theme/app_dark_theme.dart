import 'package:king_saud_hospital/src/core/resources/app_colors.dart';
import 'package:king_saud_hospital/src/core/resources/font_manager.dart';
import 'package:king_saud_hospital/src/core/resources/style.dart';
import 'package:flutter/material.dart';

ThemeData getAppDarkTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.backGroundColor,
    appBarTheme: AppBarTheme(
      elevation: 0.0,
      backgroundColor: Colors.white,
      titleTextStyle: getBoldStyle(),
      iconTheme: const IconThemeData(color: Colors.black),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 10.0,
      selectedIconTheme: IconThemeData(color: AppColors.primary),
      unselectedIconTheme: IconThemeData(color: Colors.white),
      unselectedItemColor: Colors.black,
    ),
    textTheme: TextTheme(
      displayLarge: getMediumStyle(fontSize: FontSize.s30,color: AppColors.white),
      displayMedium: getRegularStyle(fontSize: FontSize.s24,),
      headlineLarge: getSemiBoldStyle(fontSize: FontSize.s30),
      headlineMedium: getRegularStyle(fontSize: FontSize.s24),
      titleMedium: getBoldStyle(fontSize: FontSize.s24,color: AppColors.white),
      titleLarge: getSemiBoldStyle(fontSize: FontSize.s30,color: AppColors.white),
      titleSmall: getBoldStyle(fontSize: FontSize.s16,color: AppColors.white),
      bodyLarge: getBoldStyle(
        color: AppColors.white ,
        fontSize: FontSize.s28,
      ),
      bodySmall: getBoldStyle(color: Colors.grey),
      bodyMedium:
          getRegularStyle(color: AppColors.grey, fontSize: FontSize.s20),
      labelSmall: getBoldStyle(
        color: AppColors.white,
        fontSize: FontSize.s12,
      ),
    ),
  );
}
