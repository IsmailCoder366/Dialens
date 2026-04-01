import 'package:flutter/material.dart';
import '../widgets/action_card.dart';
import '../widgets/primary_button.dart';
import '../widgets/state_grid_card.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color greenTheme = Color(0xFF10B981);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: greenTheme,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Stats", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.tune, color: Colors.white), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- TOP HEADER BLOCK ---
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
              decoration: const BoxDecoration(
                color: greenTheme,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: ActionCard(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(color: Color(0xFFF0FDF4), shape: BoxShape.circle),
                      child: const Icon(Icons.show_chart, color: greenTheme),
                    ),
                    const SizedBox(width: 12),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Selected range", style: TextStyle(color: Color(0xFF64748B), fontSize: 12)),
                        Text("Weekly Stats", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                      ],
                    ),
                    const Spacer(),
                    const Icon(Icons.chevron_right, color: Color(0xFF94A3B8)),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text("25 Sept – 1 Oct",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
                  const SizedBox(height: 20),

                  // --- CENTRAL FLOATING ICON ---
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: greenTheme,
                      shape: BoxShape.circle,
                      boxShadow: [BoxShadow(color: greenTheme.withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 5))],
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