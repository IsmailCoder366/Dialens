import 'package:flutter/material.dart';
import '../widgets/quick_link_card.dart';
import '../widgets/support_app_bar.dart';
import '../widgets/support_tile.dart';

class SupportFeedbackScreen extends StatefulWidget {
  const SupportFeedbackScreen({super.key});

  @override
  State<SupportFeedbackScreen> createState() => _SupportFeedbackScreenState();
}

class _SupportFeedbackScreenState extends State<SupportFeedbackScreen> {
  int _selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    const primaryPurple = Color(0xFF6366F1);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: SupportAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// --- HEADER HELP BANNER ---
            _buildHeaderBanner(primaryPurple),
            const SizedBox(height: 24),

            /// --- GET IN TOUCH ---
            const Text("Get in Touch", style: TextStyle(color: Color(0xFF64748B), fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const SupportTile(
              icon: Icons.chat_bubble_outline,
              title: "Live Chat",
              subtitle: "Chat with our support team",
              availability: "Available 24/7",
              iconBgColor: Color(0xFFF0FDF4),
            ),
            const SupportTile(
              icon: Icons.email_outlined,
              title: "Email Support",
              subtitle: "support@dialens.app",
              availability: "Response within 24 hours",
              iconBgColor: Color(0xFFEFF6FF),
            ),
            const SupportTile(
              icon: Icons.call,
              title: "Phone Support",
              subtitle: "1-800-DIALENS",
              availability: "Mon-Fri, 9am-5pm EST",
              iconBgColor: Color(0xFFEFF6FF),
            ),
            const SizedBox(height: 24),


            /// --- QUICK LINKS ---
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 12),
                  child: Text(
                    "Quick Links",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                ),
                Row(
                  children: [
                    QuickLinkCard(
                      icon: Icons.quiz_outlined,
                      label: "FAQs",
                      onTap: () {},
                    ),
                    const SizedBox(width: 12),
                    QuickLinkCard(
                      icon: Icons.chat_bubble_outline,
                      label: "Community\nForum",
                      onTap: () {},
                    ),
                    const SizedBox(width: 12),
                    QuickLinkCard(
                      icon: Icons.open_in_new_rounded,
                      label: "Knowledge\nBase",
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),


            /// --- SEND FEEDBACK ---
            const Text("Send Feedback", style: TextStyle(color: Color(0xFF64748B), fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),


            /// --- FEEDBACK CATEGORY GRID ---
            _buildFeedbackGrid(),
            const SizedBox(height: 20),

            /// --- INPUT FIELDS ---
            _buildInputField("Subject", "Brief description of your feedback"),
            const SizedBox(height: 16),
            _buildInputField("Message", "Tell us more... We'd love to hear your thoughts!", isMultiline: true),

            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.send_rounded, size: 18),
                label: const Text("Send Feedback", style: TextStyle(fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryPurple,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 0,
                ),
              ),
            ),

            const SizedBox(height: 24),
            /// --- RESPONSE TIME INFO ---
            _buildInfoBanner(),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }


  Widget _buildHeaderBanner(Color color) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(24)),
      child: Column(
        children: const [
          Text("We're Here to Help", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text("Get support or share your feedback with our team", style: TextStyle(color: Colors.white70, fontSize: 13)),
        ],
      ),
    );
  }

  Widget _buildFeedbackGrid() {
    final categories = [
      {'icon': Icons.bug_report_outlined, 'label': 'Report a Bug'},
      {'icon': Icons.lightbulb_outline, 'label': 'Feature Request'},
      {'icon': Icons.chat_outlined, 'label': 'General Feedback'},
      {'icon': Icons.thumb_up_off_alt, 'label': 'Compliment'},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 1.4,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        bool isSelected = _selectedCategory == index;
        return InkWell(
          onTap: () => setState(() => _selectedCategory = index),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: isSelected ? Colors.indigo : const Color(0xFFF1F5F9), width: 1.5),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(categories[index]['icon'] as IconData, color: isSelected ? Colors.indigo : const Color(0xFF94A3B8)),
                const SizedBox(height: 8),
                Text(categories[index]['label'] as String, style: TextStyle(fontSize: 12, fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildInputField(String label, String hint, {bool isMultiline = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Color(0xFF64748B), fontSize: 13, fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        TextField(
          maxLines: isMultiline ? 4 : 1,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Color(0xFFCBD5E1), fontSize: 14),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(16),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFF1F5F9))),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoBanner() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xFFEFF6FF), borderRadius: BorderRadius.circular(16)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Icon(Icons.info_outline, color: Colors.blue, size: 20),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              "We typically respond to all inquiries within 24 hours during business days. For urgent medical concerns, please contact your healthcare provider immediately.",
              style: TextStyle(color: Color(0xFF1E3A8A), fontSize: 12, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }
}