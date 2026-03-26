import 'package:flutter/material.dart';
import '../app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,

      /// Setting the global seed and primary color

      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryBlue,
        primary: AppColors.primaryBlue,
        onPrimary: Colors.white,
        surface: Colors.white
      ),
      scaffoldBackgroundColor: Colors.white,

      /// Setting a consistent font style for the app

      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.black
        ),
      ),
    );
  }
}