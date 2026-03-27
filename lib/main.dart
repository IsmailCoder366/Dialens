import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/utils/app_router.dart';
import 'core/utils/app_routes_names.dart';
import 'features/onboarding/provider/onboarding_provider.dart';

void main() {
  runApp(
    // MultiProvider is the root
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OnboardingProvider()),
      ],
      // MyApp is the child, which contains the MaterialApp
      child: const DialensApp(),
    ),
  );
}

class DialensApp extends StatelessWidget {
  const DialensApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp provides Directionality and the Navigator
    return MaterialApp(
      title: 'Dialens',
      debugShowCheckedModeBanner: false,
      // theme: AppTheme.lightTheme,
      initialRoute: AppRouteNames.splash, // Starts at SplashScreen
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}