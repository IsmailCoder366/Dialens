import 'package:dialens/core/utils/app_routes_names.dart';
import 'package:flutter/material.dart';
import '../widgets/log_entry_card.dart';

class LogHubScreen extends StatelessWidget {
  const LogHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF2563EB);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryBlue,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Quick Log", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.history, color: Colors.white), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("What would you like to log?", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
            const SizedBox(height: 20),

            // --- NEW ENTRY RECOMMENDED SECTION ---
            _buildRecommendedEntry(context),
            const SizedBox(height: 24),

            const Text("Main Entries", style: TextStyle(color: Color(0xFF64748B), fontWeight: FontWeight.bold, fontSize: 14)),
            const SizedBox(height: 12),

            Row(
              children: [
                LogEntryCard(icon: Icons.water_drop, title: "Blood Glucose", subtitle: "Log BG reading", baseColor: Colors.blue, onTap: () {
                  Navigator.pushNamed(context, AppRouteNames.glucose_log);
                }),
                const SizedBox(width: 16),
                LogEntryCard(icon: Icons.restaurant, title: "Carbs & Meals", subtitle: "Track food intake", baseColor: Colors.orange, onTap: () {
                  Navigator.pushNamed(context, AppRouteNames.carbs_log);
                }),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                LogEntryCard(icon: Icons.medication, title: "Insulin", subtitle: "Log insulin doses", baseColor: Colors.purple, onTap: () {
                  Navigator.pushNamed(context, AppRouteNames.insulin_log);
                }),
                const SizedBox(width: 16),
                LogEntryCard(icon: Icons.show_chart, title: "Activity", subtitle: "Track exercise", baseColor: Colors.green, onTap: () {}),
              ],
            ),

            const SizedBox(height: 24),
            const Text("Recent & Favorites", style: TextStyle(color: Color(0xFF64748B), fontWeight: FontWeight.bold, fontSize: 14)),
            const SizedBox(height: 12),
            _buildListItem("Breakfast - Oatmeal", "45g carbs", "Used 3x", Icons.restaurant, Colors.orange),
            _buildListItem("Insulin - NovoRapid", "6 units", "Favorite", Icons.medication, Colors.purple),

            const SizedBox(height: 24),
            _buildAdditionalTracking(),
            const SizedBox(height: 24),

            // --- PRO TIP BANNER ---
            _buildProTip(),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendedEntry(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, AppRouteNames.new_entry);
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F3FF),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFDDD6FE)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFF8B5CF6), Color(0xFF6366F1)]),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(Icons.add, color: Colors.white, size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text("New Entry", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(color: const Color(0xFFA855F7), borderRadius: BorderRadius.circular(8)),
                        child: const Text("Recommended", style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  const Text("Log glucose, carbs, insulin & more - all in one place", style: TextStyle(color: Color(0xFF64748B), fontSize: 12)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(String title, String sub, String trailing, IconData icon, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xFFF8FAFC), borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Icon(icon, color: color.withOpacity(0.5)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
                Text(sub, style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 12)),
              ],
            ),
          ),
          Text(trailing, style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 11)),
        ],
      ),
    );
  }

  Widget _buildAdditionalTracking() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 2.2,
      children: [
        _miniTile(Icons.medication_liquid_sharp, "Medication", "Other medications"),
        _miniTile(Icons.sentiment_satisfied, "Mood & Feelings", "How you feel"),
        _miniTile(Icons.camera_alt, "Meal Photo", "Capture your meal"),
        _miniTile(Icons.location_on, "Add Location", "Where you are"),
      ],
    );
  }

  Widget _miniTile(IconData icon, String title, String sub) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: const Color(0xFF475569)),
          const SizedBox(height: 4),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
          Text(sub, style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 10)),
        ],
      ),
    );
  }

  Widget _buildProTip() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: const Color(0xFFEFF6FF), borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: const [
          Icon(Icons.lightbulb_outline, color: Colors.blue, size: 16),
          SizedBox(width: 8),
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: "Pro tip: ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
                  TextSpan(text: "You can log multiple related items in one session", style: TextStyle(color: Colors.blue)),
                ],
              ),
              style: TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}