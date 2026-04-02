import 'package:flutter/material.dart';

class InsulinLogScreen extends StatelessWidget {
  const InsulinLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryPurple = Color(0xFFA855F7);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF9333EA), // Deeper purple for header
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Insulin Dose", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.calculate_outlined, color: Colors.white), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // --- INSULIN UNITS INPUT ---
            _buildSectionCard(
              title: "Insulin Units",
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("6", style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
                      Text("units", style: TextStyle(color: Color(0xFF94A3B8))),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: ["2", "4", "6", "8", "10", "12"]
                        .map((val) => _buildUnitChip(val, val == "6"))
                        .toList(),
                  ),
                ],
              ),
            ),

            // --- INSULIN TYPE SELECTION ---
            _buildSectionCard(
              title: "Insulin Type",
              child: Column(
                children: [
                  _buildTypeTile("Rapid-Acting", "NovoRapid, Humalog", true),
                  _buildTypeTile("Short-Acting", "Regular insulin", false),
                  _buildTypeTile("Intermediate", "NPH", false),
                  _buildTypeTile("Long-Acting", "Lantus, Levemir", false),
                ],
              ),
            ),

            // --- DELIVERY METHOD ---
            _buildSectionCard(
              title: "Delivery Method",
              child: Row(
                children: [
                  Expanded(child: _buildMethodTile(Icons.vaccines, "Injection", true)),
                  const SizedBox(width: 12),
                  Expanded(child: _buildMethodTile(Icons.edit_outlined, "Pen", false)),
                  const SizedBox(width: 12),
                  Expanded(child: _buildMethodTile(Icons.ev_station, "Pump", false)),
                ],
              ),
            ),

            // --- RECENT DOSES ---
            _buildSectionCard(
              title: "Recent Doses",
              child: Column(
                children: [
                  _buildRecentItem("Breakfast Bolus", "Rapid-Acting", "6"),
                  _buildRecentItem("Basal (Morning)", "Long-Acting", "12"),
                  _buildRecentItem("Correction Dose", "Rapid-Acting", "3"),
                ],
              ),
            ),

            // --- SAVE BUTTON ---
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD8B4FE), // Muted purple as seen in image
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 0,
                ),
                child: const Text("Save Insulin Dose", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 8),
            const Text("Logging 6 units • Rapid-Acting", style: TextStyle(color: Color(0xFF94A3B8), fontSize: 11)),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // --- REUSABLE BUILDERS ---

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

  Widget _buildUnitChip(String label, bool isSelected) {
    return Container(
      width: 50,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: isSelected ? const Color(0xFF94A3B8) : const Color(0xFFE2E8F0)),
      ),
      alignment: Alignment.center,
      child: Text(label, style: const TextStyle(color: Color(0xFF1E293B))),
    );
  }

  Widget _buildTypeTile(String title, String sub, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isSelected ? const Color(0xFF9333EA) : const Color(0xFFE2E8F0)),
        color: isSelected ? const Color(0xFFFAF5FF) : Colors.white,
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              Text(sub, style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMethodTile(IconData icon, String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isSelected ? const Color(0xFF94A3B8) : const Color(0xFFE2E8F0)),
      ),
      child: Column(
        children: [
          Icon(icon, size: 20, color: const Color(0xFF475569)),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildRecentItem(String title, String type, String units) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
              Text(type, style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 12)),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(units, style: const TextStyle(color: Color(0xFF9333EA), fontWeight: FontWeight.bold, fontSize: 16)),
              const Text("units", style: TextStyle(color: Color(0xFF94A3B8), fontSize: 10)),
            ],
          )
        ],
      ),
    );
  }
}