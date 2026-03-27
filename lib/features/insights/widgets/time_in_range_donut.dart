import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TimeInRangeDonut extends StatelessWidget {
  const TimeInRangeDonut({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1.5,
          child: PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 35,
              sections: [
                PieChartSectionData(color: Colors.green, value: 70, radius: 12, title: ''),
                PieChartSectionData(color: Colors.orange, value: 20, radius: 12, title: ''),
                PieChartSectionData(color: Colors.red, value: 10, radius: 12, title: ''),
              ],
            ),
          ),
        ),
        // Progress Bars logic from image
        _buildProgressBar("Target (70-140)", 0.7, Colors.green),
        _buildProgressBar("High (>140)", 0.2, Colors.orange),
        _buildProgressBar("Low (<70)", 0.1, Colors.red),
      ],
    );
  }

  Widget _buildProgressBar(String label, double val, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 12)),
          const SizedBox(height: 4),
          LinearProgressIndicator(
            value: val,
            backgroundColor: Colors.grey.shade100,
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      ),
    );
  }
}