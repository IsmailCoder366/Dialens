import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/app_colors.dart';
import '../provider/onboarding_provider.dart';

class OnboardingTargetsScreen extends StatelessWidget {
  const OnboardingTargetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<OnboardingProvider>();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          const Text("Set Your Targets",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text("Define your glucose range and personal goals",
              style: TextStyle(color: Colors.grey[600])),

          const SizedBox(height: 32),

          // 1. Target Range Input Fields
          const Text("Target glucose range (mg/dL)",
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _buildRangeInput("Low", provider.lowTarget, (v) => provider.setLowTarget(int.tryParse(v) ?? 70))),
              const SizedBox(width: 16),
              Expanded(child: _buildRangeInput("High", provider.highTarget, (v) => provider.setHighTarget(int.tryParse(v) ?? 180))),
            ],
          ),
          const SizedBox(height: 12),
          Text("Recommended: 70-180 mg/dL for most adults",
              style: TextStyle(color: Colors.grey[500], fontSize: 13)),

          const SizedBox(height: 32),

          // 2. Primary Goal Selection
          const Text("What's your primary goal?",
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          ...[
            'Reduce high readings',
            'Reduce low readings',
            'Improve morning glucose',
            'Better post-meal control',
            'Reduce A1c'
          ].map((goal) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: _buildGoalButton(goal, provider),
          )),
        ],
      ),
    );
  }

  // Helper for Low/High TextFields
  Widget _buildRangeInput(String label, int value, Function(String) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
        const SizedBox(height: 4),
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: value.toString(),
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
          onChanged: onChanged,
        ),
      ],
    );
  }

  // Helper for the list of goals
  Widget _buildGoalButton(String goal, OnboardingProvider provider) {
    final isSelected = provider.primaryGoal == goal;
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () => provider.selectPrimaryGoal(goal),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          side: BorderSide(color: isSelected ? AppColors.primaryBlue : Colors.grey[300]!),
          backgroundColor: isSelected ? AppColors.primaryBlue.withOpacity(0.05) : Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Text(goal,
            style: TextStyle(
              color: isSelected ? AppColors.primaryBlue : Colors.black87,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            )),
      ),
    );
  }
}