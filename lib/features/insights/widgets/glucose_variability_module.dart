import 'package:flutter/material.dart';

class GlucoseVariabilityModule extends StatelessWidget {
  const GlucoseVariabilityModule({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _buildVarCard("Standard Deviation", "32 mg/dL", Colors.blue),
            const SizedBox(width: 12),
            _buildVarCard("Coefficient of Variation", "28%", Colors.purple),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: Colors.green.withOpacity(0.05), borderRadius: BorderRadius.circular(12)),
          child: const Row(
            children: [
              Icon(Icons.check_circle_outline, color: Colors.green, size: 16),
              SizedBox(width: 8),
              Expanded(child: Text("Your variability is within the stable range today.", style: TextStyle(fontSize: 12, color: Colors.green))),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildVarCard(String title, String val, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.05),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.1)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 11, color: Colors.grey)),
            const SizedBox(height: 4),
            Text(val, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color)),
          ],
        ),
      ),
    );
  }
}