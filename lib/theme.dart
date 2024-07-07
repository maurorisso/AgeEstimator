import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColor = const Color.fromRGBO(73, 91, 253, 1);
  static Color background = const Color(0xFFF7F4F3);
  static Color succes = const Color.fromRGBO(9, 149, 110, 1);
  static Color error = const Color.fromRGBO(255, 59, 48, 1);
}

ThemeData appTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primaryColor,
    primary: AppColors.primaryColor,
    onPrimary: Colors.white,
  ),
  scaffoldBackgroundColor: AppColors.background,
  filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
          shape: WidgetStateProperty.all(RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  )))),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.background,
    elevation: 0,
    shape: const Border(bottom: BorderSide(color: Colors.black12, width: 1)),
  ),
);
