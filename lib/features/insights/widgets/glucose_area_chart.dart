import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GlucoseAreaChart extends StatelessWidget {
  const GlucoseAreaChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // The Stats Row seen in your image (Avg, Range, Low/High)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStat("Average", "120", "mg/dL"),
              _buildStat("In Range", "85", "%"),
              _buildStat("Low/High", "2/1", "events"),
            ],
          ),
        ),
        // The Line Chart
        AspectRatio(
          aspectRatio: 1.7,
          child: LineChart(
            LineChartData(
              gridData: const FlGridData(show: false),
              titlesData: const FlTitlesData(show: false),
              borderData: FlBorderData(show: false),
              lineBarsData: [
                LineChartBarData(
                  spots: [
                    const FlSpot(0, 100), const FlSpot(2, 110),
                    const FlSpot(4, 95), const FlSpot(6, 145),
                    const FlSpot(8, 130), const FlSpot(10, 150),
                  ],
                  isCurved: true,
                  color: const Color(0xFF155DFC),
                  barWidth: 3,
                  dotData: const FlDotData(show: false),
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFF155DFC).withOpacity(0.2),
                        const Color(0xFF155DFC).withOpacity(0),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStat(String label, String value, String unit) {
    return Column(
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(width: 2),
            Text(unit, style: const TextStyle(color: Colors.grey, fontSize: 10)),
          ],
        ),
      ],
    );
  }
}