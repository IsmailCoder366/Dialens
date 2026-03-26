import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/app_colors.dart';
import '../../../core/widgets/selection_chip.dart';
import '../provider/onboarding_provider.dart';

class OnboardingUnitsScreen extends StatelessWidget {
  const OnboardingUnitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // We only use context.watch if we need to show/hide specific things here
    final provider = context.watch<OnboardingProvider>();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          const Text("Units & Device Setup",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text("Configure your preferred units and connect your meter",
              style: TextStyle(color: Colors.grey[600])),

          const SizedBox(height: 32),

          // Glucose Unit Selection
          const Text("Glucose measurement unit", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Row(
            children: ['mg/dL', 'mmol/L'].map((unit) => Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: SelectionChip(
                  label: unit,
                  isSelected: provider.carbUnit == unit,
                  onTap: () => provider.setCarbUnit(unit),
                ),
              ),
            )).toList(),
          ),
          const SizedBox(height: 20),
          // Carbohydrate Unit
          const Text("Carbohydrate Unit", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Row(
            children: ['Grams', 'Exchanges'].map((unit) => Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: SelectionChip(
                  label: unit,
                  isSelected: provider.glucoseUnit == unit,
                  onTap: () => provider.setGlucoseUnit(unit),
                ),
              ),
            )).toList(),
          ),

          const SizedBox(height: 24),

          // Device Selection List
          const Text("Select your glucose meter", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          ...['Accu-Chek Guide', 'OneTouch Ultra', 'Contour Next', 'FreeStyle Libre', 'Dexcom G6', 'Other / Manual Entry']
              .map((device) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: CustomDeviceButton( // Use the helper widget from your previous file
              label: device,
              isSelected: provider.selectedDevice == device,
              onTap: () => provider.selectDevice(device),
            ),
          )),
        ],
      ),
    );
  }
}
// Small helper widget for the device list
class CustomDeviceButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomDeviceButton({super.key, required this.label, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          side: BorderSide(color: isSelected ? AppColors.primaryBlue : Colors.grey[300]!),
          backgroundColor: isSelected ? AppColors.primaryBlue.withOpacity(0.05) : Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Text(label, style: TextStyle(color: isSelected ? AppColors.primaryBlue : Colors.black87)),
      ),
    );
  }
}