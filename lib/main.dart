import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'features/onboarding/provider/onboarding_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OnboardingProvider()),
      ],
      child: const DialensApp(),
    ),
  );
}