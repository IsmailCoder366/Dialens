import 'package:flutter/material.dart';

class ActivityLogScreen extends StatelessWidget {
  const ActivityLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryGreen = Color(0xFF16A34A); // Signature green for Activity

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: primaryGreen,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Physical Activity", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.bolt, color: Colors.white), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // --- ACTIVITY TYPE GRID ---
            _buildSectionCard(
              title: "Activity Type",
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 2.2,
                children: [
                  _buildActivityTile(Icons.directions_walk, "Walking"),
                  _buildActivityTile(Icons.directions_run, "Running"),
                  _buildActivityTile(Icons.directions_bike, "Cycling"),
                  _buildActivityTile(Icons.pool, "Swimming"),
                  _buildActivityTile(Icons.fitness_center, "Gym"),
                  _buildActivityTile(Icons.self_improvement, "Yoga"),
                  _buildActivityTile(Icons.sports_tennis, "Sports"),
                  _buildActivityTile(Icons.more_horiz, "Other"),
                ],
              ),
            ),

            // --- DURATION INPUT ---
            _buildSectionCard(
              title: "Duration",
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("60", style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
                      Row(
                        children: [
                          Icon(Icons.history, size: 18, color: Color(0xFF94A3B8)),
                          SizedBox(width: 4),
                          Text("min", style: TextStyle(color: Color(0xFF94A3B8))),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: ["15m", "30m", "45m", "60m"]
                        .map((val) => _buildQuickTimeChip(val, val == "60m"))
                        .toList(),
                  ),
                ],
              ),
            ),

            // --- INTENSITY LEVEL ---
            _buildSectionCard(
              title: "Intensity Level",
              child: Column(
                children: [
                  _buildIntensityTile("Light", "Easy pace", Colors.green, true),
                  _buildIntensityTile("Moderate", "Comfortable", Colors.amber, false),
                  _buildIntensityTile("Vigorous", "Challenging", Colors.orange, false),
                  _buildIntensityTile("Intense", "Maximum effort", Colors.red, false),
                ],
              ),
            ),

            // --- ACTIVITY IMPACT BANNER ---
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFEFF6FF), // Light blue background
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFDBEAFE)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.show_chart, color: Color(0xFF2563EB)),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Activity Impact", style: TextStyle(color: Color(0xFF1E40AF), fontWeight: FontWeight.bold, fontSize: 13)),
                        const SizedBox(height: 4),
                        Text(
                          "Exercise may lower your blood glucose. Consider checking BG during and after activity.",
                          style: TextStyle(color: const Color(0xFF2563EB).withOpacity(0.8), fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // --- RECENT ACTIVITIES ---
            _buildSectionCard(
              title: "Recent Activities",
              child: Column(
                children: [
                  _buildRecentActivity("Morning walk", "Today, 7:00 AM", "30 min", "Light"),
                  _buildRecentActivity("Gym workout", "Yesterday", "45 min", "Moderate"),
                ],
              ),
            ),

            // --- SAVE BUTTON ---
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF86EFAC), // Muted green for button
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 0,
                ),
                child: const Text("Save Activity", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 8),
            const Text("Logging 💫 Other • 60 min • Vigorous", style: TextStyle(color: Color(0xFF94A3B8), fontSize: 11)),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // --- REUSABLE BUILDING BLOCKS ---

  Widget _buildSectionCard({required String title, required Widget child}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Color(0xFF64748B), fontSize: 13, fontWeight: FontWeight.w500)),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }

  Widget _buildActivityTile(IconData icon, String label) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 18, color: const Color(0xFF475569)),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
        ],
      ),
    );
  }

  Widget _buildQuickTimeChip(String label, bool isSelected) {
    return Container(
      width: 75,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: isSelected ? const Color(0xFF94A3B8) : const Color(0xFFE2E8F0)),
      ),
      alignment: Alignment.center,
      child: Text(label, style: const TextStyle(color: Color(0xFF1E293B))),
    );
  }

  Widget _buildIntensityTile(String label, String sub, Color color, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                Text(sub, style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 11)),
              ],
            ),
          ),
          Container(
            width: 8,
            height: 24,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildRecentActivity(String title, String time, String duration, String level) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
              Text(time, style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 12)),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(duration, style: const TextStyle(color: Color(0xFF16A34A), fontWeight: FontWeight.bold, fontSize: 14)),
              Text(level, style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 11)),
            ],
          )
        ],
      ),
    );
  }
}