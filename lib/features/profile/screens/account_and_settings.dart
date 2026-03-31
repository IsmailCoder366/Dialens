import 'package:flutter/material.dart';
import '../widgets/action_card.dart';
import '../widgets/primary_button.dart';

class AccountSettingsScreen extends StatefulWidget {
  const AccountSettingsScreen({super.key});

  @override
  State<AccountSettingsScreen> createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // length 3: Account, Therapy, Settings
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: _buildAppBar(),
      body: Column(
        children: [
          SizedBox(height: 20),
          _buildCustomTabBar(),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildAccountTab(),
                _buildTherapyTab(),
                _buildSettingsTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- TAB 1: ACCOUNT ---
  Widget _buildAccountTab() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        _buildProfilePictureSection(),
        const SizedBox(height: 16),
        _buildSubscriptionSection(),
        const SizedBox(height: 16),
        _buildPersonalInfoSection(),
        const SizedBox(height: 16),
        _buildChangePasswordSection(),
        const SizedBox(height: 32),
        SecondaryButton(
          label: "Log Out",
          onPressed: () {
            // Handle Logout logic
          },
        ),
        const SizedBox(height: 40),
      ],
    );
  }

  // --- TAB 2: THERAPY ---
  Widget _buildTherapyTab() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        _buildPlaceholderSection("Therapy Content Section", Icons.medical_services_outlined),
      ],
    );
  }

  // --- TAB 3: SETTINGS ---
  Widget _buildSettingsTab() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        _buildPlaceholderSection("Settings Content Section", Icons.settings_suggest_outlined),
      ],
    );
  }

  // --- REFACTORED SECTIONS ---

  Widget _buildProfilePictureSection() {
    return ActionCard(
      child: Row(
        children: [
          Stack(
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundColor: Color(0xFF155DFC),
                child: Text("JD", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(color: Color(0xFF155DFC), shape: BoxShape.circle),
                  child: const Icon(Icons.camera_alt, color: Colors.white, size: 16),
                ),
              ),
            ],
          ),
          const SizedBox(width: 20),
          const Expanded(
            child: Text("Upload a photo to personalize your account",
                style: TextStyle(color: Color(0xFF64748B), fontSize: 14)),
          ),
        ],
      ),
    );
  }

  Widget _buildSubscriptionSection() {
    return ActionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Subscription", style: TextStyle(color: Color(0xFF64748B), fontSize: 14)),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(color: const Color(0xFF155DFC), borderRadius: BorderRadius.circular(20)),
                child: const Text("Premium Plan", style: TextStyle(color: Colors.white, fontSize: 12)),
              ),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  visualDensity: VisualDensity.compact,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  side: const BorderSide(color: Color(0xFFE2E8F0)),
                ),
                child: const Text("Manage", style: TextStyle(color: Color(0xFF1E293B), fontSize: 13)),
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Text("All features unlocked", style: TextStyle(color: Color(0xFF64748B), fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildPersonalInfoSection() {
    return ActionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Personal Information", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
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
          _buildDataField("Birth Date", "Select Date"),
        ],
      ),
    );
  }

  Widget _buildChangePasswordSection() {
    return ActionCard(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: const Color(0xFFEFF6FF), borderRadius: BorderRadius.circular(10)),
            child: const Icon(Icons.lock_outline, color: Color(0xFF155DFC)),
          ),
          const SizedBox(width: 16),
          const Expanded(child: Text("Change Password", style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF1E293B)))),
          const Icon(Icons.chevron_right, color: Color(0xFF94A3B8)),
        ],
      ),
    );
  }

  // --- HELPERS ---

  Widget _buildDataField(String label, String value) {
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
          child: Text(value, style: TextStyle(color: value.contains("Select") ? const Color(0xFF94A3B8) : const Color(0xFF1E293B))),
        ),
      ],
    );
  }

  Widget _buildPlaceholderSection(String text, IconData icon) {
    return ActionCard(
      child: Container(
        height: 300,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: const Color(0xFFCBD5E1)),
            const SizedBox(height: 16),
            Text(text, style: const TextStyle(color: Color(0xFF94A3B8))),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      toolbarHeight: 80.0,
      backgroundColor: const Color(0xFF155DFC),
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
      title: const Text("Account & Settings", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
      actions: [
        IconButton(icon: const Icon(Icons.settings_outlined, color: Colors.white), onPressed: () {}),
      ],
    );
  }

  Widget _buildCustomTabBar() {
    return Container(
      // This provides the solid blue background behind the tab bar

      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 16, top: 4),
      child: Container(

        height: 48,
        padding: const EdgeInsets.all(4), // Creates the inset "track" spacing
        decoration: BoxDecoration(
            color: const Color(0xFF155DFC),
          borderRadius: BorderRadius.circular(14)
        ),
        child: TabBar(
          controller: _tabController,
          // Critical: Removes the default bottom line that usually appears in Flutter
          dividerColor: Colors.transparent,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          labelColor: const Color(0xFF155DFC),
          unselectedLabelColor: Colors.white,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
          tabs: const [
            Tab(text: "Account"),
            Tab(text: "Therapy"),
            Tab(text: "Settings"),
          ],
        ),
      ),
    );
  }
}