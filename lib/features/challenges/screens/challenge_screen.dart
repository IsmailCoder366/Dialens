import 'package:dialens/features/challenges/widgets/challenges_app_bar.dart';
import 'package:flutter/material.dart';
import '../widgets/challenge_card.dart';

class ChallengesScreen extends StatelessWidget {
  const ChallengesScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFFDFCF6), // Slight cream tint from image
      appBar: ChallengesAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [

            ///  --- XP SUMMARY HEADER ---
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFFFE9A00), Color(0xFFE17100)]),
                borderRadius: BorderRadius.circular(14),
                boxShadow: [BoxShadow(color: Colors.orange.withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 5))],
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Your Points", style: TextStyle(color: Colors.white70, fontSize: 12)),
                      Text("145 XP", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Completed", style: TextStyle(color: Colors.white70, fontSize: 12)),
                      Text("3/8", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const Spacer(),
                  const Icon(Icons.workspace_premium, color: Colors.white, size: 32),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  /// --- Available Challenges ---
                  const Text("Available challenges", style: TextStyle(color: Color(0xFF364153), fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),

                  const ChallengeCard(
                    title: "Snack's Check",
                    description: "Measuring your blood sugar after a meal is important. Are your BGs in range? Measure post-meal BGs 3 times a day to complete this challenge.",
                    xp: "+10 XP",
                    progress: 0.66,
                    progressText: "2/3",
                    icon: Icon(Icons.fastfood_outlined, color: Color(0xFFB45309)),
                  ),
                  ChallengeCard(
                    title: "Big Blue Test",
                    description: "Log blood sugar before and after 15-20 minutes of exercise.",
                    xp: "+20 XP",
                    icon: const Icon(Icons.directions_run, color: Color(0xFFB45309)),
                    onTap: () {},
                  ),
                  ChallengeCard(
                    title: "Go Pro",
                    description: "Tame your monster 7-days in a row and you'll gain mySugr PRO. No cash, no payment, no stress, no worry. Just 7-day streak!",
                    xp: "7-Day PRO Trail",
                    icon: const Icon(Icons.sentiment_dissatisfied, color: Color(0xFFB45309)),
                    onTap: () {},
                  ),
                  const SizedBox(height: 24),

                  /// --- Unavailable Challenges ---
                  const Text("Unavailable challenges", style: TextStyle(color: Color(0xFF94A3B8), fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),

                  const ChallengeCard(
                    title: "Vampire",
                    description: "You've won the Rookie challenge, now it's all about blood. Heaps of blood! Suck your own sweet, red juice before a vampire does it for you.",
                    xp: "+25 XP",
                    isLocked: true,
                    icon: Icon(Icons.face_retouching_natural, color: Color(0xFF94A3B8)),
                  ),
                  const ChallengeCard(
                    title: "Sweat it",
                    description: "Are you up for some action? No sweat without sweat! So, put on your sports duds and get your sweat glands going! Log sports activities 5 times.",
                    xp: "+25 XP",
                    isLocked: true,
                    icon: Icon(Icons.foggy, color: Color(0xFF94A3B8)),
                  ),
                  const ChallengeCard(
                    title: "Your monster",
                    description: "Want your own, cute hairy little monster? You'll build your own cool little monster if you maintain a streak for 7 days.",
                    xp: "+25 XP",
                    isLocked: true,
                    icon: Icon(Icons.monetization_on_outlined, color: Color(0xFF94A3B8)),
                  ),

                  /// --- UPGRADE BANNER ---
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 40),
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: const Color(0xFFFEF3C7)),
                      gradient: LinearGradient(
                        colors: [Colors.white, const Color(0xFFFFFBEB)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(colors: [Colors.orange, Colors.purple]),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.workspace_premium, color: Colors.white),
                        ),
                        const SizedBox(height: 16),
                        const Text("Unlock All Challenges", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        const SizedBox(height: 8),
                        const Text(
                          "Get Premium to access all challenges, earn more rewards, and track your progress.",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Color(0xFF64748B), fontSize: 13),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: const LinearGradient(colors: [Colors.orange, Colors.purple]),
                          ),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                            ),
                            child: const Text("Upgrade to Premium", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}