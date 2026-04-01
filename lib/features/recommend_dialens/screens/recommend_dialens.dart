import 'package:flutter/material.dart';
import '../widgets/community_card.dart';
import '../widgets/flutter_info_card.dart';
import '../widgets/recommend_app_bar.dart';
import '../widgets/referral_card.dart';

class RecommendScreen extends StatelessWidget {
  const RecommendScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFFDFCFD),
      appBar: RecommendAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// --- HEADER SECTION ---
            _buildGiftHeader(),
            const SizedBox(height: 24),

            /// --- WHY SHARE DIALENS ---
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 4, bottom: 16),
                  child: Text(
                    "Why Share Dialens?",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    FeatureInfoCard(
                      icon: Text("🎁", style: TextStyle(fontSize: 32)),
                      title: "1 Month Free Premium",
                      description: "For every friend who joins",
                    ),
                    FeatureInfoCard(
                      icon: Text("❤️", style: TextStyle(fontSize: 32)),
                      title: "Help Others",
                      description: "Support friends with diabetes",
                    ),
                    FeatureInfoCard(
                      icon: Text("🏆", style: TextStyle(fontSize: 32)),
                      title: "Unlock Rewards",
                      description: "Earn points and badges",
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),

            /// --- STATS ROW ---
            _buildReferralStats(),
            const SizedBox(height: 24),

            /// --- REFERRAL CODE CARD ---
            Text('Your Referal Code'),
            const ReferralCard(
              code: "DIALENS2025",
              link: "https://dialens.app/join/DIALENS2025",
            ),
            const SizedBox(height: 24),



            /// --- SHARE SECTION ---
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Share via", style: TextStyle(color: Color(0xFF64748B), fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 12),
            _buildShareOptions(),
            const SizedBox(height: 32),


            /// --- HOW IT WORK ---
            _buildHowItWorks(),
            const SizedBox(height: 40),

            Text('Referral rewards are subject to terms and conditions.'),
            Center(child: Text('View Full Terms', style: TextStyle(color: Color(0xffE60076), fontSize: 16))),

            /// --- COMMUNITY SECTION ---
            Column(
              children: [
                // ... rest of recommend screen ...

                // THE COMMUNITY CARD
                CommunityCard(
                  onTap: () {
                    // Handle Join Community or link to social/forum
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildGiftHeader() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xffFB64B6),
                Color(0xffE60076),
              ]),

              shape: BoxShape.circle),
          child: const Icon(Icons.card_giftcard, color: Colors.white, size: 40),
        ),
        const SizedBox(height: 16),

        const Text("Share the Gift of Better Health", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        const Text("Help your friends and family manage diabetes better while earning rewards",
          textAlign: TextAlign.center,
          style: TextStyle(color: Color(0xFF64748B), height: 1.4),
        ),
      ],
    );
  }

  Widget _buildReferralStats() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFFEC4899), Color(0xFF8B5CF6)]),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _statItem("5", "Invites Sent"),
          _divider(),
          _statItem("2", "Friends Joined"),
          _divider(),
          _statItem("2", "Months Free"),
        ],
      ),
    );
  }

  Widget _statItem(String val, String label) {
    return Column(
      children: [
        Text(val, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 10)),
      ],
    );
  }

  Widget _divider() => Container(height: 30, width: 1, color: Colors.white24);

  Widget _buildShareOptions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _shareTile(Icons.message_outlined, "Message", const Color(0xFFF0FDF4), Colors.green),
        _shareTile(Icons.email_outlined, "Email", const Color(0xFFEFF6FF), Colors.blue),
        _shareTile(Icons.share_outlined, "Share", const Color(0xFFFAF5FF), Colors.purple),
      ],
    );
  }

  Widget _shareTile(IconData icon, String label, Color bg, Color iconColor) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Icon(icon, color: iconColor),
          const SizedBox(height: 8),
          Text(label, style: TextStyle(color: iconColor, fontWeight: FontWeight.w600, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildHowItWorks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("How It Works", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        _stepItem("1", "Share Your Code", "Send your unique referral code to friends and family."),
        _stepItem("2", "They Sign Up", "Your friend creates an account using your code."),
        _stepItem("3", "Both Get Rewards", "You both receive 1 month of Premium free!"),
      ],
    );
  }

  Widget _stepItem(String num, String title, String sub) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(radius: 12, backgroundColor: const Color(0xFFFCE4EC), child: Text(num, style: const TextStyle(color: Color(0xFFE91E63), fontSize: 12))),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                Text(sub, style: const TextStyle(color: Color(0xFF64748B), fontSize: 12)),
              ],
            ),
          )
        ],
      ),
    );
  }
}