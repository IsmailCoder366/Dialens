import 'package:dialens/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import '../../../core/app_colors.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/utils/app_routes_names.dart';
import '../../../core/widgets/custom_textfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 20),

            /// Logo and Header

            Image(image: AssetImage('assets/images/logo.png'),
                color: AppColors.primaryBlue,
                width: 50,
                height: 50,
            ),
            const SizedBox(height: 24),
            const Text('Create Your Account', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Join Dialens to start tracking', style: TextStyle(color: Colors.grey[600], fontSize: 14)),

            const SizedBox(height: 40),

            /// Input Form
            const CustomTextField(label: 'Full Name', hintText: 'Enter your name'),
            const SizedBox(height: 20),
            const CustomTextField(label: 'Email', hintText: 'you@example.com'),
            const SizedBox(height: 20),
            const CustomTextField(label: 'Password', hintText: 'Create a password', isPassword: true, showSuffixIcon: true),
            const SizedBox(height: 20),
            const CustomTextField(label: 'Confirm Password', hintText: 'Re-enter password', isPassword: true, showSuffixIcon: true),

            const SizedBox(height: 20),

            /// Terms & Conditions

            Row(
              children: [
                Checkbox(
                  value: _agreeToTerms,
                  onChanged: (val) => setState(() => _agreeToTerms = val!),
                  activeColor: AppColors.primaryBlue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.grey[600], fontSize: 12, height: 1.4),
                      children: const [
                        TextSpan(text: 'By signing up, you agree to our '),
                        TextSpan(text: 'Terms of Service', style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: ' and '),
                        TextSpan(text: 'Privacy Policy', style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            /// Buttons

            CustomButton(
              color: Colors.white,
              label: 'Sign Up',
              onPressed: () {
                Navigator.pushNamed(context, AppRouteNames.onboarding);
              },
            ),

            const SizedBox(height: 20),

            /// Already Have An Account?

            GestureDetector(
              onTap: () => Navigator.pushNamed(context, AppRouteNames.login),
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 14),
                  children: [
                    TextSpan(text: 'Already have an account? ', style: TextStyle(color: Colors.black)),
                    TextSpan(text: 'Sign In', style: TextStyle(color: AppColors.primaryBlue, fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
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