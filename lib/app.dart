import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'core/utils/app_routes.dart';

class DialensApp extends StatelessWidget {
  const DialensApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dialens',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme, // A basic theme for consistent fonts
      // We start on the Splash route
      initialRoute: AppRouter.splashRoute,
      // The router handles how to navigate between screens
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}