import 'package:dialens/features/carbs_log/screens/carbs_log_screen.dart';
import 'package:dialens/features/challenges/screens/challenge_screen.dart';
import 'package:dialens/features/glucose_log_screen/screen/blood_glucose_log_screen.dart';
import 'package:dialens/features/insuline_log/screens/insuline_log_screen.dart';
import 'package:dialens/features/log_hub/screens/log_hub_screen.dart';
import 'package:dialens/features/new_entry/screens/new_entry_screen.dart';
import 'package:dialens/features/onboarding/screens/onboarding_profile_screen.dart';
import 'package:dialens/features/profile/screens/account_and_settings.dart';
import 'package:dialens/features/recommend_dialens/screens/recommend_dialens.dart';
import 'package:dialens/features/support/screens/support_screen.dart';
import 'package:dialens/features/user_manual/screens/user_manual_screen.dart';
import 'package:flutter/material.dart';
import '../../features/auth/screens/signin_screen.dart';
import '../../features/auth/screens/signup_screen.dart';
import '../../features/home/presentation/screens/main_wrapper.dart';
import '../../features/stat/screens/state_screen.dart';
import '../../splash.dart';
import 'app_routes_names.dart';
import '../../features/welcome/screens/welcome_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteNames.splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());

      case AppRouteNames.mainWrapper:
        return MaterialPageRoute(builder: (_) => const MainWrapper());

      case AppRouteNames.welcome:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());

      case AppRouteNames.signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());

      case AppRouteNames.login:
        return MaterialPageRoute(builder: (_) => const SigninScreen());

      case AppRouteNames.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingProfileScreen());

      case AppRouteNames.account_settings:
        return MaterialPageRoute(builder: (_) => const AccountSettingsScreen());

      case AppRouteNames.stat:
        return MaterialPageRoute(builder: (_) => const StatsScreen());

      case AppRouteNames.challenges:
        return MaterialPageRoute(builder: (_) => const ChallengesScreen());

      case AppRouteNames.user_manual:
        return MaterialPageRoute(builder: (_) => const UserManualScreen());

      case AppRouteNames.recommend_dialens:
        return MaterialPageRoute(builder: (_) => const RecommendScreen());

      case AppRouteNames.support:
        return MaterialPageRoute(builder: (_) => const SupportFeedbackScreen());

      case AppRouteNames.log_hub:
        return MaterialPageRoute(builder: (_) => const LogHubScreen());

      case AppRouteNames.new_entry:
        return MaterialPageRoute(builder: (_) => const NewEntryScreen());

      case AppRouteNames.glucose_log:
        return MaterialPageRoute(builder: (_) => const BloodGlucoseLogScreen());

      case AppRouteNames.carbs_log:
        return MaterialPageRoute(builder: (_) => const CarbsLogScreen());

      case AppRouteNames.insulin_log:
        return MaterialPageRoute(builder: (_) => const InsulinLogScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
