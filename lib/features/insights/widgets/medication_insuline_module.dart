import 'package:flutter/material.dart';

class MedicationInsulinModule extends StatelessWidget {
  const MedicationInsulinModule({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _buildInsulinBox("Total Insulin", "42.5 U", "100%"),
            const SizedBox(width: 12),
            _buildInsulinBox("Basal / Bolus", "18 / 24", "45% / 55%"),
          ],
        ),
        const SizedBox(height: 16),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Latest Bolus", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            Text("8.0 U", style: TextStyle(fontSize: 12, color: Colors.indigo)),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Active Insulin (IOB)", style: TextStyle(fontSize: 12)),
            Text("2.4 U", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }

  Widget _buildInsulinBox(String title, String val, String sub) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: const Color(0xFFF1F5F9), borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(val, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigo)),
            Text(title, style: const TextStyle(fontSize: 10, color: Colors.grey)),
            Text(sub, style: const TextStyle(fontSize: 10, color: Colors.indigo, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}