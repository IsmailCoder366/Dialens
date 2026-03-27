import 'package:flutter/material.dart';
import '../widgets/activity_impact_chart.dart';
import '../widgets/daily_pattern_chart.dart';
import '../widgets/glucose_area_chart.dart';
import '../widgets/glucose_variability_module.dart';
import '../widgets/insight_action_card.dart';
import '../widgets/low_glucose_module.dart';
import '../widgets/meal_impact_chart.dart';
import '../widgets/medication_insuline_module.dart';
import '../widgets/time_in_range_donut.dart'; // Use your primaryBlue here

class InsightsScreen extends StatelessWidget {
  const InsightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF155DFC),
        elevation: 0,
        centerTitle: true,
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        title: const Text("Insights", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        actions: [IconButton(icon: const Icon(Icons.file_download_outlined, color: Colors.white), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. Time Selection Tabs
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTimeTab("Day", true),
                  _buildTimeTab("Week", false),
                  _buildTimeTab("Month", false),
                  _buildTimeTab("3 Months", false),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  // 2. Health Score Card
                  _buildHealthScoreCard(),
                  const SizedBox(height: 16),

                  // 3. Share Button
                  _buildShareButton(),
                  const SizedBox(height: 24),

                  // 4. Accordion List - High Fidelity Injection
                  _buildInsightTile(
                    Icons.analytics_outlined,
                    Colors.blue,
                    "Glucose Overview",
                    content: const GlucoseAreaChart(),
                  ),
                  _buildInsightTile(
                    Icons.timelapse_rounded,
                    Colors.green,
                    "Time in Range",
                    content: const TimeInRangeDonut(),
                  ),
                  _buildInsightTile(
                    Icons.bolt_rounded,
                    Colors.purple,
                    "Daily Patterns",
                    content: const DailyPatternsChart(),
                  ),
                  _buildInsightTile(
                    Icons.favorite_border_rounded,
                    Colors.red,
                    "Glucose Variability",
                    content: const GlucoseVariabilityModule(), // Added
                  ),
                  _buildInsightTile(
                    Icons.restaurant_menu_outlined,
                    Colors.orange,
                    "Meal Impact",
                    content: const MealImpactChart(),
                  ),
                  _buildInsightTile(
                    Icons.show_chart_rounded,
                    Colors.teal,
                    "Activity Impact",
                    content: const ActivityImpactChart(), // Added
                  ),
                  _buildInsightTile(
                    Icons.error_outline_rounded,
                    Colors.redAccent,
                    "Low Glucose Events",
                    content: const LowGlucoseModule(), // Added
                  ),
                  _buildInsightTile(
                    Icons.medication_outlined,
                    Colors.indigo,
                    "Medication & Insulin",
                    content: const MedicationInsulinModule(), // Added
                  ),

                  const SizedBox(height: 32),

                  // 5. AI Recommendations Header
                  _buildSectionHeader(Icons.auto_awesome, Colors.purple, "AI Recommendations"),
                  const SizedBox(height: 16),

                  InsightActionCard(
                    icon: Icons.restaurant,
                    iconBgColor: const Color(0xFFEFF6FF),
                    iconColor: Colors.blue,
                    title: "Lighter Dinner Tonight",
                    description: "Your dinner spike was high today. Try reducing carbs by 20g for better overnight control.",
                    actionText: "View Low-Carb Ideas",
                    onTap: () {},
                  ),
                  InsightActionCard(
                    icon: Icons.directions_walk,
                    iconBgColor: const Color(0xFFF0FDF4),
                    iconColor: Colors.green,
                    title: "Evening Walk",
                    description: "A 10-minute walk after dinner could lower tonight's spike by 15-20 mg/dL.",
                    actionText: "Set Reminder",
                    onTap: () {},
                  ),
                  InsightActionCard(
                    icon: Icons.nights_stay_outlined,
                    iconBgColor: const Color(0xFFFFF7ED),
                    iconColor: Colors.orange,
                    title: "Check Before Bed",
                    description: "You had a low this morning. Check glucose before bed to prevent overnight lows.",
                    actionText: "Set Alert",
                    onTap: () {},
                  ),

                  const SizedBox(height: 32),

                  // 6. Today Summary
                  _buildSectionHeader(Icons.access_time, Colors.grey, "Today Summary"),
                  const SizedBox(height: 16),
                  _buildSummaryLogTile(Icons.water_drop, Colors.blue, "Glucose Logs", "8 readings today", true),
                  _buildSummaryLogTile(Icons.restaurant, Colors.green, "Meal Logs", "3 meals logged", true),
                  _buildSummaryLogTile(Icons.link, Colors.purple, "Insulin Doses", "5 doses recorded", true),
                  _buildSummaryLogTile(Icons.bolt, Colors.orange, "Activity Sessions", "1 workouts logged", false, status: "Fair"),

                  const SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- UI HELPER METHODS ---

  Widget _buildTimeTab(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF155DFC) : const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(label, style: TextStyle(color: isSelected ? Colors.white : Colors.grey, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildHealthScoreCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF155DFC),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.check_circle_outline, color: Colors.white, size: 18),
              SizedBox(width: 8),
              Text("Overall Health Score", style: TextStyle(color: Colors.white70, fontSize: 13)),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text("82/100", style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold)),
              const SizedBox(width: 12),
              Icon(Icons.trending_up, color: Colors.greenAccent.shade100, size: 18),
              Text("+2 today", style: TextStyle(color: Colors.greenAccent.shade100, fontSize: 14)),
            ],
          ),
          const SizedBox(height: 12),
          const Text("Good progress! A few improvements can boost your score.", style: TextStyle(color: Colors.white, fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildShareButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.share_outlined, size: 18),
        label: const Text("Share"),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF155DFC),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }

  Widget _buildInsightTile(IconData icon, Color color, String title, {Widget? content}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: ExpansionTile(
        // This removes the default lines that appear when tile expands
        shape: const RoundedRectangleBorder(side: BorderSide.none),
        collapsedShape: const RoundedRectangleBorder(side: BorderSide.none),
        leading: Icon(icon, color: color),
        title: Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
        children: [
          if (content != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: content,
            ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(IconData icon, Color color, String title) {
    return Row(
      children: [
        Icon(icon, color: color, size: 22),
        const SizedBox(width: 8),
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
      ],
    );
  }

  Widget _buildSummaryLogTile(IconData icon, Color color, String title, String subtitle, bool isDone, {String? status}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          if (isDone)
            const Icon(Icons.check_circle, color: Colors.green, size: 24)
          else if (status != null)
            Text(status, style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}