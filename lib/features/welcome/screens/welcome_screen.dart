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
      backgroundColor: Colors.white,
      body: Column(
        children: [
          /// 1. Blue Header Section
          Container(
            width: double.infinity,
            // Increased padding to make the header taller as seen in the image
            padding: const EdgeInsets.only(top: 100, bottom: 60),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF155DFC), // Your lighter blue
                  Color(0xFF193CB8), // Your lighter blue
                ],
              ),
            ),
            child: Column(
              children: [
                // Centered white drop icon
                Image.asset(
                  'assets/images/logo.png',
                  width: 60,
                  color: Colors.white,
                ),
                const SizedBox(height: 32),
                const Text(
                  'Welcome to Dialens',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold, // Bolder font
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Your diabetes care companion',
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ],
            ),
          ),

          /// 2. Features and Buttons Section
          Expanded(
            child: SingleChildScrollView(
              // Prevents overflow on smaller devices
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 20.0,
              ),
              child: Column(
                children: [
                  /// Features Grid
                  GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    shrinkWrap: true,
                    // Increased childAspectRatio to make cards wider and shorter
                    childAspectRatio: 1.3,
                    children: const [
                      FeatureCard(
                        icon: Icons.water_drop_outlined,
                        title: 'Track Glucose',
                        subtitle: 'Fast, effortless logging',
                      ),
                      FeatureCard(
                        icon: Icons.trending_up,
                        title: 'See Insights',
                        subtitle: 'Understand your patterns',
                      ),
                      FeatureCard(
                        icon: Icons.description_outlined,
                        title: 'Share Reports',
                        subtitle: 'Clinician-ready exports',
                      ),
                      FeatureCard(
                        icon: Icons.people_outline,
                        title: 'Caregiver Mode',
                        subtitle: 'Support your loved ones',
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// Info Bar
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 24,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFF6FF), // Lighter blue background
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'Track, understand, and share your diabetes data with confidence',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        // Darker blue text for contrast
                        fontSize: 14,
                        height: 1.4,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// Buttons
                  CustomButton(
                    color: AppColors.primaryBlue,
                    label: 'Get Started',
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRouteNames.signup),
                  ),
                  const SizedBox(height: 12),

                  // Sign In (Usually an outlined button or different color in design)
                  CustomButton(
                    color: Colors.white,
                    // White background for the secondary button
                    label: 'Sign In',
                    isPrimary: false,
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRouteNames.login),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
