import 'package:dialens/features/onboarding/screens/onboarding_target_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/app_colors.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/selection_chip.dart';
import '../provider/onboarding_provider.dart';
import 'onboarding_permissions_screen.dart';
import 'onboarding_units_screen.dart';

class OnboardingProfileScreen extends StatelessWidget {
  const OnboardingProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<OnboardingProvider>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- 1. THE SHARED HEADER ---
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (provider.currentStep > 1)
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: const Icon(Icons.arrow_back, size: 20),
                      onPressed: () => provider.previousStep(),
                    )
                  else
                    const SizedBox(width: 20),

                  Text(
                    'Step ${provider.currentStep} of ${provider.totalSteps}',
                    style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w500),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Skip', style: TextStyle(color: AppColors.lightBlue)),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              LinearProgressIndicator(
                value: provider.progress,
                backgroundColor: Colors.grey[200],
                color: Colors.black,
                minHeight: 4,
              ),

              // --- 2. THE DYNAMIC CONTENT ---
              Expanded(
                child: _buildStepContent(provider),
              ),

              // --- 3. THE SHARED CONTINUE BUTTON ---
              _buildFooterButton(provider, context),

              // --- 4. CONDITIONAL STEP 4 TEXT ---
              if (provider.currentStep == 4) ...[
                const SizedBox(height: 16),
                const Center(
                  child: Text(
                    "You can change these settings anytime",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
              ],

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepContent(OnboardingProvider provider) {
    switch (provider.currentStep) {
      case 1:
        return _buildProfileStep(provider);
      case 2:
        return const OnboardingUnitsScreen();
      case 3:
        return const OnboardingTargetsScreen();
      case 4:
        return const OnboardingPermissionsScreen();
      default:
        return _buildProfileStep(provider);
    }
  }

  Widget _buildProfileStep(OnboardingProvider provider) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          const Text(
            "Let's Personalize Your Journey",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Text(
            "This helps Dialens give you better insights and reminders",
            style: TextStyle(color: Colors.grey[600], fontSize: 16),
          ),
          const SizedBox(height: 40),
          const Text("What type of diabetes do you have?",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
          const SizedBox(height: 16),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 2.5,
            physics: const NeverScrollableScrollPhysics(),
            children: ['Type 1', 'Type 2', 'Gestational', 'Other'].map((type) {
              return SelectionChip(
                label: type,
                isSelected: provider.selectedDiabetesType == type,
                onTap: () => provider.selectDiabetesType(type),
              );
            }).toList(),
          ),
          const SizedBox(height: 32),
          const Text("How do you manage your diabetes?",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
          const SizedBox(height: 16),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 2.5,
            physics: const NeverScrollableScrollPhysics(),
            children: ['Insulin', 'Pills', 'Both', 'None'].map((method) {
              return SelectionChip(
                label: method,
                isSelected: provider.selectedManagementMethod == method,
                onTap: () => provider.selectManagementMethod(method),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterButton(OnboardingProvider provider, BuildContext context) {
    bool canContinue = false;

    if (provider.currentStep == 1) {
      canContinue = provider.selectedDiabetesType != null && provider.selectedManagementMethod != null;
    } else if (provider.currentStep == 2) {
      canContinue = provider.selectedDevice != null;
    } else if (provider.currentStep == 3) {
      // Assuming primary goal selection is required for Step 3
      canContinue = provider.primaryGoal != null;
    } else {
      canContinue = true;
    }

    return CustomButton(
      color: canContinue ? AppColors.primaryBlue : Colors.grey[300]!,
      label: provider.currentStep == 4 ? 'Finish' : 'Continue',
      onPressed: canContinue ? () => provider.nextStep(context) : () {},
    );
  }
}