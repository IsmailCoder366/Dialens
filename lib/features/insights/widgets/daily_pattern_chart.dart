import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DailyPatternsChart extends StatelessWidget {
  const DailyPatternsChart({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.8,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: 40,
            getDrawingHorizontalLine: (value) => FlLine(color: Colors.grey.withOpacity(0.1), strokeWidth: 1),
          ),
          titlesData: const FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          // SHADED TARGET ZONE (70 to 140 mg/dL)
          extraLinesData: ExtraLinesData(
            horizontalLines: [
              HorizontalLine(
                y: 105, // Midpoint of 70-140
                color: Colors.green.withOpacity(0.05),
                strokeWidth: 70, // Height of the band
              ),
            ],
          ),
          lineBarsData: [
            LineChartBarData(
              spots: const [
                FlSpot(0, 85), FlSpot(2, 90), FlSpot(4, 120),
                FlSpot(6, 105), FlSpot(8, 135), FlSpot(10, 95),
              ],
              isCurved: true,
              color: Colors.purple,
              barWidth: 2,
              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
                  radius: 3, color: Colors.white, strokeWidth: 2, strokeColor: Colors.purple,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}