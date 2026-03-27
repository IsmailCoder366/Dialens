import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MealImpactChart extends StatelessWidget {
  const MealImpactChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 2.2,
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: 200,
              barGroups: [
                _buildBarGroup(0, 115, 165), // Breakfast
                _buildBarGroup(1, 100, 140), // Lunch
                _buildBarGroup(2, 125, 185), // Dinner
              ],
              titlesData: const FlTitlesData(show: false),
              gridData: const FlGridData(show: false),
              borderData: FlBorderData(show: false),
            ),
          ),
        ),
        const SizedBox(height: 12),
        _buildLegend(),
      ],
    );
  }

  BarChartGroupData _buildBarGroup(int x, double pre, double post) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(toY: pre, color: Colors.orange, width: 14, borderRadius: BorderRadius.circular(4)),
        BarChartRodData(toY: post, color: const Color(0xFF155DFC), width: 14, borderRadius: BorderRadius.circular(4)),
      ],
    );
  }

  Widget _buildLegend() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(radius: 4, backgroundColor: Colors.orange),
        SizedBox(width: 4),
        Text("Pre-meal", style: TextStyle(fontSize: 11, color: Colors.grey)),
        SizedBox(width: 20),
        CircleAvatar(radius: 4, backgroundColor: Color(0xFF155DFC)),
        SizedBox(width: 4),
        Text("Post-meal", style: TextStyle(fontSize: 11, color: Colors.grey)),
      ],
    );
  }
}