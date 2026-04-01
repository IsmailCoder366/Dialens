import 'package:flutter/material.dart';
import '../../widgets/action_card.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        // --- CONNECTED DEVICES SECTION ---
        const Text("Connected Devices",
            style: TextStyle(color: Color(0xFF64748B), fontSize: 14, fontWeight: FontWeight.w500)),
        const SizedBox(height: 12),
        ActionCard(
          padding: EdgeInsets.zero, // Zero padding to handle internal list styling
          child: Column(
            children: [
              _buildDeviceTile(
                icon: Icons.monitor_heart_outlined,
                title: "Blood Glucose Meter",
                subtitle: "Not connected",
                statusColor: const Color(0xFF94A3B8),
              ),
              const Divider(height: 1, color: Color(0xFFF1F5F9)),
              _buildDeviceTile(
                icon: Icons.vaccines_outlined,
                title: "Insulin Pump",
                subtitle: "Connected: Tandem t:slim X2",
                statusColor: const Color(0xFF10B981),
              ),
              const Divider(height: 1, color: Color(0xFFF1F5F9)),
              _buildDeviceTile(
                icon: Icons.settings_input_antenna,
                title: "CGM Sensor",
                subtitle: "Connected: Dexcom G7",
                statusColor: const Color(0xFF10B981),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // --- MOTIVATION & GAMIFICATION ---
        const Text("Motivation & Gamification",
            style: TextStyle(color: Color(0xFF64748B), fontSize: 14, fontWeight: FontWeight.w500)),
        const SizedBox(height: 12),
        ActionCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Companion Name", style: TextStyle(color: Color(0xFF64748B), fontSize: 12)),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text("Dia-Buddy", style: TextStyle(color: Color(0xFF1E293B))),
              ),
              const SizedBox(height: 4),
              const Text("Your friendly diabetes management buddy",
                  style: TextStyle(color: Color(0xFF94A3B8), fontSize: 11)),
              const SizedBox(height: 20),
              _buildToggleRow("Companion Sounds", "Enable sound effects", true),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // --- DISPLAY OPTIONS ---
        const Text("Display Options",
            style: TextStyle(color: Color(0xFF64748B), fontSize: 14, fontWeight: FontWeight.w500)),
        const SizedBox(height: 12),
        ActionCard(
          child: _buildToggleRow("Show Estimated A1c", "Based on average glucose", true),
        ),

        const SizedBox(height: 24),

        // --- PRIVACY & DATA ---
        const Text("Privacy & Data",
            style: TextStyle(color: Color(0xFF64748B), fontSize: 14, fontWeight: FontWeight.w500)),
        const SizedBox(height: 12),
        ActionCard(
          child: Column(
            children: [
              _buildToggleRow("Track Location", "For context-aware insights", false),
              const SizedBox(height: 16),
              _buildToggleRow("Save Photos to Library", "Auto-save meal photos", true),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // --- LEGAL & DATA ---
        const Text("Legal & Data",
            style: TextStyle(color: Color(0xFF64748B), fontSize: 14, fontWeight: FontWeight.w500)),
        const SizedBox(height: 12),
        ActionCard(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              _buildSimpleTile(Icons.shield_outlined, "Regulatory Information"),
              const Divider(height: 1, color: Color(0xFFF1F5F9)),
              _buildSimpleTile(Icons.description_outlined, "Consent Management"),
              const Divider(height: 1, color: Color(0xFFF1F5F9)),
              _buildSimpleTile(Icons.download_outlined, "Export App Data"),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // --- LOCATION SECTION ---
        const Text("Location",
            style: TextStyle(color: Color(0xFF64748B), fontSize: 14, fontWeight: FontWeight.w500)),
        const SizedBox(height: 12),
        ActionCard(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.location_on_outlined, color: Color(0xFF64748B)),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Country", style: TextStyle(color: Color(0xFF64748B), fontSize: 12)),
                    const Text("United States", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
                    const SizedBox(height: 4),
                    const Text(
                      "You were assigned to this country during registration. If this is incorrect, please contact Customer Support.",
                      style: TextStyle(color: Color(0xFF94A3B8), fontSize: 11),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // --- DELETE ACCOUNT BUTTON ---
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFFEE2E2)), // Light red border
          ),
          child: TextButton.icon(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              foregroundColor: Colors.red,
            ),
            icon: const Icon(Icons.delete_outline),
            label: const Text("Delete My Account", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }

  // --- REUSABLE SETTINGS HELPERS ---

  Widget _buildDeviceTile({required IconData icon, required String title, required String subtitle, required Color statusColor}) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFEFF6FF), // Light blue icon background
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xFF155DFC)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                Text(subtitle, style: TextStyle(color: statusColor, fontSize: 12)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Color(0xFFCBD5E1)),
        ],
      ),
    );
  }

  Widget _buildSimpleTile(IconData icon, String title) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: const Color(0xFF1E293B), size: 20),
      ),
      title: Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
      trailing: const Icon(Icons.chevron_right, color: Color(0xFFCBD5E1)),
      onTap: () {},
    );
  }

  Widget _buildToggleRow(String title, String subtitle, bool value) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
              Text(subtitle, style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 12)),
            ],
          ),
        ),
        Switch.adaptive(
          value: value,
          activeColor: const Color(0xFF155DFC),
          onChanged: (val) {},
        ),
      ],
    );
  }
}