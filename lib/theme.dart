import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

    // Scaffold Background
    scaffoldBackgroundColor: AppColors.background,

    //FilledButton
    filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    )))),

    // AppBar
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: GoogleFonts.inter(
        textStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      shape: const Border(bottom: BorderSide(color: Colors.black12, width: 1)),
    ),
    textTheme: const TextTheme(
        headlineSmall: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
        headlineMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        headlineLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
        )),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    ));
