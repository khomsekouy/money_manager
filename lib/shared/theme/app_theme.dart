import 'package:flutter/material.dart';
import 'package:flutter_money_manager/core/colors/app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    fontFamily: 'Cormorant',
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: AppColors.tColor,
        fontSize: 18,
        fontWeight: FontWeight.w700, // Bold for emphasis
      ),
      bodyMedium: TextStyle(
        color: AppColors.tColor,
        fontSize: 16,
        fontWeight: FontWeight.w500, // Medium for better readability
      ),
      bodySmall: TextStyle(
        color: AppColors.tColor,
        fontSize: 14,
        fontWeight: FontWeight.w400, // Regular for default text
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    fontFamily: 'Cormorant',
    brightness: Brightness.dark,
    primarySwatch: Colors.grey,
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w700, // Bold for emphasis
      ),
      bodyMedium: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w500, // Medium for better readability
      ),
      bodySmall: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w400, // Regular for default text
      ),
    ),
  );
}