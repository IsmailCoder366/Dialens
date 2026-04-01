import 'package:flutter/material.dart';
import '../../../core/widgets/primary_button.dart';
import '../widgets/action_card.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/state_grid_card.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: CustomGradientAppBar(
        gradientColors: [
          Color(0xff00A63E),
          Color(0xff008236),
        ],
        title: "Stats",
        height: 140, // Set your custom height here
        actions: [
          IconButton(
            icon: const Icon(Icons.tune, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            /// --- TOP HEADER BLOCK ---
            Container(
              width: 380,
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration:  BoxDecoration(
                color: Color(0xff00A23D),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const Icon(Icons.show_chart, color: Colors.white),
                  const SizedBox(width: 12),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Selected range", style: TextStyle(color: Colors.white, fontSize: 12)),
                      Text("Weekly Stats", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white)),
                    ],
                  ),
                  const Spacer(),
                  const Icon(Icons.chevron_right, color: Colors.white),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text("25 Sept – 1 Oct",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
                  const SizedBox(height: 20),

                  /// --- CENTRAL FLOATING ICON ---
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Color(0xff00A23D),
                      shape: BoxShape.circle,
                      gradient: LinearGradient(colors: [
                        Color(0xff05DF72),
                        Color(0xff00A63E),
                      ])
                    ),
                    child: const Icon(Icons.bar_chart, color: Colors.white, size: 40),
                  ),

                  const SizedBox(height: 24),

                  // --- STATS GRID ---
                  Row(
                    children: [
                      const Expanded(child: StatGridCard(
                        title: "Average", value: "∅", icon: Text("mg/dL", style: TextStyle(fontSize: 10, color: Color(0xFF94A3B8))),
                        backgroundColor: Color(0xFFF0F9FF),
                      )),
                      const SizedBox(width: 12),
                      const Expanded(child: StatGridCard(
                        title: "Deviation", value: "∅", icon: Text("mmol/L", style: TextStyle(fontSize: 10, color: Color(0xFF94A3B8))),
                        backgroundColor: Color(0xFFFDF2F8),
                      )),
                      const SizedBox(width: 12),
                      Expanded(child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(color: const Color(0xFFFFFBEB), borderRadius: BorderRadius.circular(16)),
                        child: const Column(
                          children: [
                            Text("—", style: TextStyle(color: Color(0xFF94A3B8))),
                            SizedBox(height: 8),
                            Text("Highs", style: TextStyle(color: Color(0xFF64748B), fontSize: 13)),
                            Divider(),
                            Text("Lows", style: TextStyle(color: Color(0xFF64748B), fontSize: 13)),
                          ],
                        ),
                      )),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Expanded(child: StatGridCard(
                        title: "Carbs", value: "∅", subTitle: "Day ∅", icon: Icon(Icons.bakery_dining_outlined, size: 18, color: Color(0xFF94A3B8)),
                        backgroundColor: Color(0xFFF0FDF4),
                      )),
                      const SizedBox(width: 12),
                      const Expanded(child: StatGridCard(
                        title: "Bolus", value: "∅", subTitle: "Day ∅", icon: Icon(Icons.medication_outlined, size: 18, color: Color(0xFF94A3B8)),
                        backgroundColor: Color(0xFFF0F9FF),
                      )),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // --- DATE RANGE SELECTOR ---
                  ActionCard(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Sept 22 - 28, 2025 | Week 39", style: TextStyle(color: Color(0xFF1E293B))),
                        Icon(Icons.expand_more, color: Color(0xFF94A3B8)),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // --- EMPTY STATE LOGGING CARD ---
                  ActionCard(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      children: [
                        const Icon(Icons.timeline, size: 48, color: Color(0xFFE2E8F0)),
                        const SizedBox(height: 20),
                        const Text(
                          "Log data or connect your blood sugar meter to see values.",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Color(0xFF64748B), fontSize: 14),
                        ),
                        const SizedBox(height: 24),
                        PrimaryButton(
                          label: "Start Logging",
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}