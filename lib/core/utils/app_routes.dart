import 'package:flutter/material.dart';

import '../../features/welcome/screens/welcome_screen.dart';
import '../../splash.dart';

class AppRouter {
  // Defined names for the routes
  static const String splashRoute = '/';
  static const String welcomeRoute = '/welcome';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case welcomeRoute:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());

      default:
      // A simple "Page Not Found" case
        return MaterialPageRoute(builder: (_) => const Text('Error: Route not found'));
    }
  }
}