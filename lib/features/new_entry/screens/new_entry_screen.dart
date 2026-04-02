import 'package:flutter/material.dart';
import '../widgets/entry_selection_card.dart';
import '../widgets/selection_tile.dart';

class NewEntryScreen extends StatelessWidget {
  const NewEntryScreen({super.key});

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
        title: const Text("New Entry", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.bookmark_border, color: Colors.white), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // --- DATE & LOCATION HEADER ---
            _buildHeaderInput("02/12/2025 10:51", Icons.calendar_today),
            const SizedBox(height: 12),
            _buildHeaderInput("Add location (optional)", Icons.location_on_outlined),
            const SizedBox(height: 20),

            // --- BLOOD GLUCOSE SECTION ---
            EntrySectionCard(
              title: "Blood Glucose",
              indicatorColor: Colors.red,
              child: Column(
                children: [
                  _buildValueInput("Meter", "mg/dL"),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(child: SelectionTile(icon: Icons.sentiment_dissatisfied_outlined, label: "Hypo Symptoms", onTap: () {})),
                      const SizedBox(width: 8),
                      Expanded(child: SelectionTile(icon: Icons.sentiment_neutral, label: "Normal", onTap: () {})),
                      const SizedBox(width: 8),
                      Expanded(child: SelectionTile(icon: Icons.sentiment_very_satisfied_outlined, label: "Hyper Symptoms", onTap: () {})),
                    ],
                  )
                ],
              ),
            ),

            // --- MEAL TYPE & TIMING ---
            EntrySectionCard(
              title: "Meal Type & Timing",
              indicatorColor: Colors.transparent,
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                children: [
                  SelectionTile(icon: Icons.breakfast_dining_outlined, label: "Breakfast", onTap: () {}),
                  SelectionTile(icon: Icons.lunch_dining_outlined, label: "Lunch", onTap: () {}),
                  SelectionTile(icon: Icons.dinner_dining_outlined, label: "Dinner", onTap: () {}),
                  SelectionTile(icon: Icons.icecream_outlined, label: "Snack", onTap: () {}),
                  SelectionTile(icon: Icons.access_time, label: "Before Meal", onTap: () {}),
                  SelectionTile(icon: Icons.history_toggle_off, label: "After Meal", onTap: () {}),
                  SelectionTile(icon: Icons.add_box_outlined, label: "Correction", onTap: () {}),
                  SelectionTile(icon: Icons.timer_outlined, label: "Fasting", onTap: () {}),
                ],
              ),
            ),

            // --- CARBOHYDRATES SECTION ---
            EntrySectionCard(
              title: "Carbohydrates",
              indicatorColor: Colors.orange,
              child: Column(
                children: [
                  _buildStepCounter("grams"),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(color: primaryBlue, borderRadius: BorderRadius.circular(12)),
                        child: const Icon(Icons.camera_alt, color: Colors.white, size: 20),
                      ),
                      const SizedBox(width: 12),
                      Expanded(child: _buildHeaderInput("Food description...", null)),
                    ],
                  )
                ],
              ),
            ),

            // --- INSULIN SECTION ---
            EntrySectionCard(
              title: "Insulin (Bolus)",
              indicatorColor: Colors.blue,
              trailing: TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.calculate_outlined, size: 16),
                label: const Text("Calculator", style: TextStyle(fontSize: 12)),
              ),
              child: _buildValueInput("Rapid (Humalog)", "units"),
            ),

            // --- SAVE BUTTON ---
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF94A3B8).withOpacity(0.5), // Matches muted blue in image
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 0,
                ),
                child: const Text("Save Entry", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // --- HELPER BUILDERS ---

  Widget _buildHeaderInput(String hint, IconData? icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Row(
        children: [
          if (icon != null) ...[Icon(icon, size: 18, color: const Color(0xFF94A3B8)), const SizedBox(width: 12)],
          Text(hint, style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildValueInput(String dropdownLabel, String unit) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 45,
            decoration: BoxDecoration(color: const Color(0xFFF8FAFC), borderRadius: BorderRadius.circular(8)),
            child: const Center(child: Text("--", style: TextStyle(color: Color(0xFF94A3B8)))),
          ),
        ),
        const SizedBox(width: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(color: const Color(0xFFF8FAFC), borderRadius: BorderRadius.circular(8)),
          child: Row(
            children: [
              Text(dropdownLabel, style: const TextStyle(fontSize: 12)),
              const Icon(Icons.keyboard_arrow_down, size: 16),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Text(unit, style: const TextStyle(color: Color(0xFF64748B), fontSize: 12)),
      ],
    );
  }

  Widget _buildStepCounter(String unit) {
    return Row(
      children: [
        _counterButton(Icons.remove),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            height: 45,
            decoration: BoxDecoration(color: const Color(0xFFF8FAFC), borderRadius: BorderRadius.circular(8)),
            child: const Center(child: Text("--", style: TextStyle(color: Color(0xFF94A3B8)))),
          ),
        ),
        _counterButton(Icons.add),
        const SizedBox(width: 12),
        Text(unit, style: const TextStyle(color: Color(0xFF64748B), fontSize: 12)),
      ],
    );
  }

  Widget _counterButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Icon(icon, size: 20, color: const Color(0xFF475569)),
    );
  }
}