import 'package:flutter/material.dart';
import '../../../core/app_colors.dart';
import '../../stat/widgets/action_card.dart';
import '../widgets/manual_app_bar.dart';
import '../widgets/tutorial_card.dart';

class UserManualScreen extends StatelessWidget {
  const UserManualScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: const ManualAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// --- URGENT HELP BANNER ---
            _buildUrgentBanner(),
            const SizedBox(height: 24),

            /// --- video Toturials ---
            const Text("Video Tutorials", style: TextStyle(color: Color(0xFF64748B), fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const TutorialCard(
              icon: Icons.movie_outlined,
              title: "Quick Start Guide",
              subtitle: "Get up and running in under 4 minutes",
              duration: "3:45",
            ),
            const TutorialCard(
              icon: Icons.edit_note_outlined,
              title: "Logging Your First Entry",
              subtitle: "Step-by-step logging tutorial",
              duration: "2:20",
            ),
            const TutorialCard(
              icon: Icons.edit_note_outlined,
              title: "Understanging Your Reports",
              subtitle: "Make sense of your data",
              duration: "5:10",
            ),
            const SizedBox(height: 24),


            const Text("Browse by Topic", style: TextStyle(color: Color(0xFF64748B), fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _buildTopicSection(Icons.bolt, "Getting Started", "4 articles", Colors.amber),
            _buildTopicSection(Icons.analytics_outlined, "Logging Data", "5 articles", Colors.blue),
            _buildTopicSection(Icons.phone_iphone, "Features & Tools", "6 articles", Colors.purple),

            const SizedBox(height: 24),
            const Text("Frequently Asked Questions", style: TextStyle(color: Color(0xFF64748B), fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _buildFaqItem("How do I connect my CGM?"),
            _buildFaqItem("Is my health data secure?"),

            const SizedBox(height: 32),
            _buildSupportFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildUrgentBanner() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFFA855F7), Color(0xFF7E22CE)]),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const Icon(Icons.notification_important_outlined, color: Colors.white),
          const SizedBox(width: 12),
          const Expanded(
            child: Text("Need immediate help?\nContact our 24/7 support team",
                style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500)),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xFF7E22CE),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text("Contact"),
          )
        ],
      ),
    );
  }

  Widget _buildTopicSection(IconData icon, String title, String count, Color iconColor) {
    return ActionCard(

      child: Row(
        children: [
          Icon(icon, color: iconColor),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(count, style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 12)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Color(0xFFCBD5E1)),
        ],
      ),
    );
  }

  Widget _buildFaqItem(String question) {
    return ActionCard(

      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(question, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          const Icon(Icons.expand_more, color: Color(0xFF94A3B8)),
        ],
      ),
    );
  }

  Widget _buildSupportFooter() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Column(
        children: [
          const CircleAvatar(
            backgroundColor: Color(0xFFF3E8FF),
            child: Icon(Icons.help_outline, color: Color(0xFF9333EA)),
          ),
          const SizedBox(height: 16),
          const Text("Still Need Help?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const Text("Our support team is available 24/7 to assist you",
              textAlign: TextAlign.center, style: TextStyle(color: Color(0xFF64748B), fontSize: 13)),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    // Add chat logic here
                  },
                  style: OutlinedButton.styleFrom(
                    // Blue text color
                    foregroundColor: const Color(0xFF2563EB),
                    // Blue border line
                    side: const BorderSide(color: Color(0xFF2563EB), width: 1.5),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Chat Support",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Add email logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2563EB), // Using the vibrant blue from the footer
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Email Us",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}