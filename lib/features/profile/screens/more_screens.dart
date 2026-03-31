import 'package:flutter/material.dart';
import '../widgets/menu_tile.dart';
import '../widgets/profile_card.dart';
import 'account_and_settings.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: Column(
        children: [
          // 1. Square Blue Header (No rounded corners at bottom)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 50, bottom: 20, left: 20, right: 20),
            decoration: const BoxDecoration(
              color: Color(0xFF155DFC), // Matching the blue in More Screen (1).png
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildHeaderCircle(const BackButton(color: Colors.white)),
                const Text(
                  "More",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                ),
                _buildHeaderCircle(const Icon(Icons.person, color: Colors.white, size: 24)),
              ],
            ),
          ),

          // 2. Content Area (Direct flow, no stack/overlap)
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                // Profile Section sits directly on the grey background
                const ProfileCard(
                  name: "John Doe",
                  email: "john.doe@email.com",
                  initials: "JD",
                ),
                const SizedBox(height: 24),

                // Group 1: Internal App Features
                MenuTile(
                  icon: Icons.settings_outlined,
                  iconColor: const Color(0xFF155DFC),
                  iconBgColor: const Color(0xFFEFF6FF),
                  title: "Account & Settings",
                  subtitle: "Manage your profile and preferences",
                  onTap: () {
                    // Standard Navigation to the new screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AccountSettingsScreen(),
                      ),
                    );
                  },
                ),
                MenuTile(
                  icon: Icons.trending_up,
                  iconColor: const Color(0xFF22C55E),
                  iconBgColor: const Color(0xFFF0FDF4),
                  title: "Stats",
                  subtitle: "View your health statistics",
                  onTap: () {},
                ),
                MenuTile(
                  icon: Icons.emoji_events_outlined,
                  iconColor: const Color(0xFFF59E0B),
                  iconBgColor: const Color(0xFFFFFBEB),
                  title: "Challenges",
                  subtitle: "Complete goals and earn rewards",
                  onTap: () {},
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Divider(color: Color(0xFFE2E8F0)),
                ),

                // Group 2: Support & Info
                MenuTile(
                  icon: Icons.menu_book_outlined,
                  iconColor: const Color(0xFF9333EA),
                  iconBgColor: const Color(0xFFF5F3FF),
                  title: "User Manual",
                  subtitle: "Learn how to use Dialens",
                  onTap: () {},
                ),
                MenuTile(
                  icon: Icons.favorite_border,
                  iconColor: const Color(0xFFEC4899),
                  iconBgColor: const Color(0xFFFDF2F8),
                  title: "Recommend Dialens",
                  subtitle: "Share with friends and family",
                  onTap: () {},
                ),
                MenuTile(
                  icon: Icons.chat_bubble_outline,
                  iconColor: const Color(0xFF6366F1),
                  iconBgColor: const Color(0xFFEEF2FF),
                  title: "Support & Feedback",
                  subtitle: "Get help or share your thoughts",
                  onTap: () {},
                ),

                const SizedBox(height: 24),
                _buildVersionFooter(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderCircle(Widget child) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        shape: BoxShape.circle,
      ),
      child: Center(child: child),
    );
  }

  Widget _buildVersionFooter() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.cloud_outlined, size: 16, color: Color(0xFF64748B)),
            SizedBox(width: 6),
            Text("Last synced: 2 mins ago",
                style: TextStyle(color: Color(0xFF64748B), fontSize: 13)),
          ],
        ),
        const SizedBox(height: 8),
        const Text("Dialens v2.1.0",
            style: TextStyle(color: Color(0xFF94A3B8), fontSize: 12)),
        const Text("© 2025 Dialens Health Technologies",
            style: TextStyle(color: Color(0xFF94A3B8), fontSize: 11)),
      ],
    );
  }
}