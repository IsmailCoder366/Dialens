import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/app_colors.dart';
import '../provider/onboarding_provider.dart';

class OnboardingPermissionsScreen extends StatelessWidget {
  const OnboardingPermissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<OnboardingProvider>();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          const Text("Enable Key Features",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text("Grant permissions to unlock the full Dialens experience",
              style: TextStyle(color: Colors.grey[600])),

          const SizedBox(height: 32),

          // 1. Permission Cards
          PermissionCard(
            title: "Notifications",
            subtitle: "Get reminders for glucose checks and medications",
            icon: Icons.notifications_none_outlined,
            isEnabled: provider.notificationsEnabled,
            onTap: () => provider.toggleNotifications(!provider.notificationsEnabled),
          ),

          PermissionCard(
            title: "Bluetooth",
            subtitle: "Sync data from your glucose meter automatically",
            icon: Icons.bluetooth,
            isEnabled: provider.bluetoothEnabled,
            onTap: () => provider.toggleBluetooth(!provider.bluetoothEnabled),
          ),

          PermissionCard(
            title: "Health Data",
            subtitle: "Share glucose data with Apple Health / Google Fit",
            icon: Icons.monitor_heart_outlined,
            isEnabled: provider.healthDataEnabled,
            onTap: () => provider.toggleHealthData(!provider.healthDataEnabled),
          ),

          const SizedBox(height: 24),

          // 2. Privacy Notice Box
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey[200]!),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Privacy first:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(height: 4),
                Text(
                  "You control your data. We never share your health information without your explicit consent.",
                  style: TextStyle(color: Colors.grey[600], fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// --- Helper Widget for the Permission Cards ---
class PermissionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool isEnabled;
  final VoidCallback onTap;

  const PermissionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.isEnabled,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isEnabled ? AppColors.primaryBlue : Colors.grey[200]!,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: Colors.black87),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 2),
                  Text(subtitle, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}