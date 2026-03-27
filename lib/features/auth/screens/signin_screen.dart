import 'package:flutter/material.dart';
import '../../../core/app_colors.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_textfield.dart';
import '../../../core/widgets/social_button.dart';
import '../../../core/utils/app_routes_names.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false, // Hidden as per your design
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 20),

            /// Logo & Headers
            Image.asset('assets/images/logo.png', width: 50, color: AppColors.primaryBlue),
            const SizedBox(height: 24),
            const Text('Welcome Back', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Sign in to continue', style: TextStyle(color: Colors.grey[600], fontSize: 16)),

            const SizedBox(height: 40),

            /// Form Fields
            const CustomTextField(label: 'Email', hintText: 'you@example.com'),
            const SizedBox(height: 20),
            const CustomTextField(
                label: 'Password',
                hintText: 'Create a password',
                isPassword: true,
                showSuffixIcon: true
            ),

            /// Forgot Password
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {}, // Future Logic
                child: const Text('Forgot?', style: TextStyle(color: AppColors.primaryBlue)),
              ),
            ),

            /// "OR" Divider
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                children: [
                  const Expanded(child: Divider(thickness: 1)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text('or', style: TextStyle(color: Colors.grey[400])),
                  ),
                  const Expanded(child: Divider(thickness: 1)),
                ],
              ),
            ),

            /// Social Buttons

            // google
            SocialButton(
              label: 'Continue with Google',
              assetPath: 'assets/images/google_logo.png', // Add this to assets
              onPressed: () {},
            ),
            const SizedBox(height: 12),

            // apple
            SocialButton(
              label: 'Continue with Apple',
              assetPath: 'assets/images/apple_logo.png', // Add this to assets
              onPressed: () {},
            ),

            const SizedBox(height: 40),

            /// Primary Sign In Button
            CustomButton(
              color: Colors.white,
              label: 'Sign In',
              onPressed: () {
                Navigator.pushNamed(context, AppRouteNames.mainWrapper);
              },
            ),

            const SizedBox(height: 24),

            /// Footer Link
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, AppRouteNames.signup),
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 14),
                  children: [
                    TextSpan(text: "Don't have an account? ", style: TextStyle(color: Colors.black)),
                    TextSpan(
                        text: 'Create One',
                        style: TextStyle(color: AppColors.primaryBlue, fontWeight: FontWeight.bold, decoration: TextDecoration.underline)
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}