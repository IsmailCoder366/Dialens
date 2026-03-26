import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'core/utils/app_router.dart';
import 'core/utils/app_routes_names.dart'; // Import names

class DialensApp extends StatelessWidget {
  const DialensApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dialens',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRouteNames.splash,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}