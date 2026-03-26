import 'package:flutter/material.dart';

class AppTheme {
  // Define your primary brand color (from your splash screen)
  static const Color primaryBlue = Color(0xFF1955FF);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryBlue,
        primary: primaryBlue,
        surface: Colors.white,
      ),
      // Set the default background for all screens
      scaffoldBackgroundColor: Colors.white,
      // Define a clean text theme
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          color: Colors.black87,
        ),
      ),
    );
  }
}