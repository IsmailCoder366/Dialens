import 'package:dialens/features/onboarding/screens/onboarding_profile_screen.dart';
import 'package:flutter/material.dart';
import '../../features/auth/screens/signin_screen.dart';
import '../../features/auth/screens/signup_screen.dart';
import '../../splash.dart';
import 'app_routes_names.dart';
import '../../features/welcome/screens/welcome_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteNames.splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());

      case AppRouteNames.welcome:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());

      case AppRouteNames.signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());

      case AppRouteNames.login:
        return MaterialPageRoute(builder: (_) => const SigninScreen());

      case AppRouteNames.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingProfileScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
