import 'package:flutter/material.dart';

class LowGlucoseModule extends StatelessWidget {
  const LowGlucoseModule({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildLowStat("Total", "1", Colors.red),
            _buildLowStat("Critical", "0", Colors.orange),
            _buildLowStat("Avg Duration", "12 min", Colors.blueGrey),
          ],
        ),
        const Divider(height: 32),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text("Event Timeline", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
        ),
        const SizedBox(height: 8),
        const Text("11:30 PM (65 mg/dL) - Duration: 12 mins", style: TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }

  Widget _buildLowStat(String label, String val, Color color) {
    return Column(
      children: [
        Text(val, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
        Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey)),
      ],
    );
  }
}