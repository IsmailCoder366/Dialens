import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ActivityImpactChart extends StatelessWidget {
  const ActivityImpactChart({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: LineChart(
        LineChartData(
          gridData: const FlGridData(show: false),
          titlesData: const FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            // Glucose Line
            LineChartBarData(
              spots: const [FlSpot(0, 140), FlSpot(3, 110), FlSpot(6, 100), FlSpot(9, 130)],
              isCurved: true,
              color: Colors.teal,
              barWidth: 3,
              dotData: const FlDotData(show: false),
            ),
            // Activity Line (Dashed)
            LineChartBarData(
              spots: const [FlSpot(0, 80), FlSpot(3, 150), FlSpot(6, 120), FlSpot(9, 90)],
              isCurved: true,
              dashArray: [5, 5],
              color: Colors.grey.withOpacity(0.5),
              barWidth: 2,
              dotData: const FlDotData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}