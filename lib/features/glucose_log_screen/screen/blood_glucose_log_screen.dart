import 'package:flutter/material.dart';

import '../widgets/quick_selection_chip.dart';

class BloodGlucoseLogScreen extends StatelessWidget {
  const BloodGlucoseLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF2563EB);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: primaryBlue,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Blood Glucose", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.water_drop_outlined, color: Colors.white), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // --- READING INPUT SECTION ---
            _buildSectionCard(
              title: "Blood Glucose Reading",
              child: Column(
                children: [
                  _buildReadingInput(),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: ["70", "90", "110", "130", "150", "180", "200", "250"]
                        .map((val) => QuickSelectChip(label: val, onTap: () {}))
                        .toList(),
                  ),
                ],
              ),
            ),

            // --- TIME SELECTION ---
            _buildSectionCard(
              title: "When",
              child: Column(
                children: [
                  _buildSelectionRow(Icons.access_time, "Now", "12:58 PM", true),
                  const Divider(height: 1),
                  _buildSelectionRow(Icons.access_time, "Custom time", "", false, hasArrow: true),
                ],
              ),
            ),

            // --- CONTEXT SELECTION ---
            _buildSectionCard(
              title: "Context (Optional)",
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 3,
                children: ["Before Meal", "After Meal", "Fasting", "Before Bed", "After Exercise", "Sick"]
                    .map((label) => QuickSelectChip(label: label, onTap: () {}))
                    .toList(),
              ),
            ),

            // --- MOOD/FEELING SELECTION ---
            _buildSectionCard(
              title: "How are you feeling? (Optional)",
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  {"label": "Sweating", "icon": Icons.sentiment_dissatisfied},
                  {"label": "Tired", "icon": Icons.sentiment_neutral},
                  {"label": "Dizzy", "icon": Icons.sentiment_very_dissatisfied},
                  {"label": "Irritable", "icon": Icons.mood_bad},
                  {"label": "Nauseous", "icon": Icons.sick_outlined},
                  {"label": "Sleepy", "icon": Icons.nights_stay_outlined},
                ].map((item) => _buildMoodChip(item["label"] as String, item["icon"] as IconData)).toList(),
              ),
            ),

            // --- ADDITIONAL DETAILS ---
            _buildSectionCard(
              title: "Additional Details",
              child: Column(
                children: [
                  _buildSelectionRow(Icons.camera_alt_outlined, "Add photo", "", false),
                  const SizedBox(height: 8),
                  _buildSelectionRow(Icons.location_on_outlined, "Add location", "", false),
                ],
              ),
            ),

            // --- SAVE BUTTON ---
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryBlue.withOpacity(0.5), // Muted blue as seen in image
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 0,
                ),
                child: const Text("Save Glucose", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

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

  Widget _buildReadingInput() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("000", style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text("mg/dL", style: TextStyle(color: Color(0xFF94A3B8))),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: const Color(0xFF2563EB), borderRadius: BorderRadius.circular(50)),
              child: const Icon(Icons.mic, color: Colors.white, size: 20),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSelectionRow(IconData icon, String label, String value, bool isSelected, {bool hasArrow = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Icon(icon, size: 20, color: const Color(0xFF94A3B8)),
          const SizedBox(width: 12),
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF1E293B))),
          const Spacer(),
          if (value.isNotEmpty) Text(value, style: const TextStyle(color: Color(0xFF64748B))),
          if (hasArrow) const Icon(Icons.chevron_right, color: Color(0xFF94A3B8)),
        ],
      ),
    );
  }

  Widget _buildMoodChip(String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: const Color(0xFF475569)),
          const SizedBox(width: 6),
          Text(label, style: const TextStyle(color: Color(0xFF475569), fontSize: 12)),
        ],
      ),
    );
  }
}