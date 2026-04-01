import 'package:flutter/material.dart';
import '../../../stat/widgets/action_card.dart';
import '../../../../core/widgets/primary_button.dart';

class AccountTab extends StatelessWidget {
  const AccountTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        // --- PROFILE PICTURE SECTION ---
        ActionCard(
          child: Row(
            children: [
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Color(0xFF155DFC),
                    child: Text(
                      "JD",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Color(0xFF155DFC),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.camera_alt, color: Colors.white, size: 16),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              const Expanded(
                child: Text(
                  "Upload a photo to personalize your account",
                  style: TextStyle(color: Color(0xFF64748B), fontSize: 14),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // --- SUBSCRIPTION SECTION ---
        ActionCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Subscription",
                  style: TextStyle(color: Color(0xFF64748B), fontSize: 14)),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF155DFC),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "Premium Plan",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      visualDensity: VisualDensity.compact,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      side: const BorderSide(color: Color(0xFFE2E8F0)),
                    ),
                    child: const Text(
                      "Manage",
                      style: TextStyle(color: Color(0xFF1E293B), fontSize: 13),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              const Text("All features unlocked",
                  style: TextStyle(color: Color(0xFF64748B), fontSize: 14)),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // --- PERSONAL INFORMATION SECTION ---
        ActionCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Personal Information",
                style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
              ),
              const SizedBox(height: 16),
              _buildDataField("Email", "john.doe@email.com"),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _buildDataField("First Name", "John")),
                  const SizedBox(width: 12),
                  Expanded(child: _buildDataField("Last Name", "Doe")),
                ],
              ),
              const SizedBox(height: 12),
              _buildDataField("Birth Date", "Select Date", isPlaceholder: true),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // --- CHANGE PASSWORD SECTION ---
        ActionCard(
          padding: const EdgeInsets.all(12),
          child: InkWell(
            onTap: () {},
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFF6FF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.lock_outline, color: Color(0xFF155DFC)),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Text(
                    "Change Password",
                    style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF1E293B)),
                  ),
                ),
                const Icon(Icons.chevron_right, color: Color(0xFF94A3B8)),
              ],
            ),
          ),
        ),

        const SizedBox(height: 32),

        // --- LOG OUT BUTTON ---
        SecondaryButton(
          label: "Log Out",
          onPressed: () {
            // Handle Logout
          },
        ),

        const SizedBox(height: 40),
      ],
    );
  }

  // --- REUSABLE DATA FIELD HELPER ---
  Widget _buildDataField(String label, String value, {bool isPlaceholder = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Color(0xFF64748B), fontSize: 12)),
        const SizedBox(height: 6),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          decoration: BoxDecoration(
            color: const Color(0xFFF8FAFC),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFF1F5F9)),
          ),
          child: Text(
            value,
            style: TextStyle(
              color: isPlaceholder ? const Color(0xFF94A3B8) : const Color(0xFF1E293B),
            ),
          ),
        ),
      ],
    );
  }
}