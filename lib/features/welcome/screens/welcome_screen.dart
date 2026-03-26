import 'package:flutter/material.dart';
import '../../../core/app_colors.dart';
import '../../../core/widgets/feature_card.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/utils/app_routes_names.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ///  Blue Header Section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 80, bottom: 40),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF155DFC),   // Your lighter blue
                  Color(0xFF193CB8),   // Your lighter blue
                ]
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0), // Keeping it flat like the image
                bottomRight: Radius.circular(0),
              ),
            ),
            child: Column(
              children: [
                Image.asset('assets/images/logo.png', width: 60, color: Colors.white),
                const SizedBox(height: 24),
                const Text(
                  'Welcome to Dialens',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Your diabetes care companion',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),

          /// Features Grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Expanded(
                    child: GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      shrinkWrap: true,
                      children: const [
                        FeatureCard(icon: Icons.water_drop, title: 'Track Glucose', subtitle: 'Fast, effortless logging'),
                        FeatureCard(icon: Icons.trending_up, title: 'See Insights', subtitle: 'Understand your patterns'),
                        FeatureCard(icon: Icons.description, title: 'Share Reports', subtitle: 'Clinician-ready exports'),
                        FeatureCard(icon: Icons.people, title: 'Caregiver Mode', subtitle: 'Support your loved ones'),
                      ],
                    ),
                  ),

                  /// Info Bar

                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFDBEAFE),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'Track, understand, and share your diabetes data with confidence',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 13),
                    ),
                  ),
                  const SizedBox(height: 32),

                  /// Buttons

                  // Get Started
                  CustomButton(
                    color: AppColors.primaryBlue,
                    label: 'Get Started',
                    onPressed: () => Navigator.pushNamed(context, AppRouteNames.signup),
                  ),
                  const SizedBox(height: 12),

                  // Sign In
                  CustomButton(
                    color: Colors.black,
                    label: 'Sign In',
                    isPrimary: false,
                    onPressed: () => Navigator.pushNamed(context, AppRouteNames.login),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}