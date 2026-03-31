import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GlucoseTrendGraph extends StatelessWidget {
  final List<FlSpot> spots;

  const GlucoseTrendGraph({super.key, required this.spots});

  @override
  Widget build(BuildContext context) {
    // 1. Defining Colors based on Card.png palette
    final Color lineColor = const Color(0xFF155DFC); // Bold blue line
    final Color gridColor = const Color(0xFFE2E8F0); // Very light grey grid lines
    final Color textColor = const Color(0xFF94A3B8); // Gray for labels

    // 2. The main Line Chart Configuration
    return AspectRatio(
      aspectRatio: 2.2, // Keeps the graph short and wide like the screenshot
      child: LineChart(
        LineChartData(
          minX: 0, maxX: 6, // Mon (0) to Sun (6)
          minY: 0, maxY: 160, // Matches the Y-Axis range in Card.png
          baselineY: 80, // Target line emphasis (optional)

          // a. Line Styling (Bold Blue with Curve and Gradient)
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true, // Smooths the points into a curve
              color: lineColor,
              barWidth: 3, // Thicker line for emphasis
              isStrokeCapRound: true,
              dotData: const FlDotData(show: false), // Hide dots at points

              // Light Blue Area Gradient under the line (Pixel-Perfect Match)
              belowBarData: BarAreaData(
                show: true,
                color: const Color(0xFFDBEAFE).withOpacity(0.5), // Sky blue gradient
              ),
            ),
          ],

          // b. The Grid (Light dashed lines)
          gridData: FlGridData(
            show: true,
            drawVerticalLine: true,
            horizontalInterval: 40, // Lines at 0, 40, 80, 120, 160
            verticalInterval: 1, // Line for each day
            getDrawingHorizontalLine: (value) => FlLine(color: gridColor, strokeWidth: 1),
            getDrawingVerticalLine: (value) => FlLine(color: gridColor, strokeWidth: 1, dashArray: [4, 4]), // Dashed
          ),

          // c. Axis Titles (Days and Glucose Values)
          titlesData: FlTitlesData(
            show: true,
            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(sideTitles: _buildBottomTitles(textColor)),
            leftTitles: AxisTitles(sideTitles: _buildLeftTitles(textColor)),
          ),

          // d. Removing the black chart border
          borderData: FlBorderData(show: false),
        ),
      ),
    );
  }

  // --- PRIVATE HELPERS FOR LABELS ---

  SideTitles _buildBottomTitles(Color textColor) {
    return SideTitles(
      showTitles: true,
      reservedSize: 22,
      interval: 1, // Show every day
      getTitlesWidget: (value, meta) {
        String text;
        switch (value.toInt()) {
          case 0: text = 'Mon'; break;
          case 1: text = 'Tue'; break;
          case 2: text = 'Wed'; break;
          case 3: text = 'Thu'; break;
          case 4: text = 'Fri'; break;
          case 5: text = 'Sat'; break;
          case 6: text = 'Sun'; break;
          default: text = ''; break;
        }
        return Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(text, style: TextStyle(color: textColor, fontSize: 10, fontWeight: FontWeight.w500)),
        );
      },
    );
  }

  SideTitles _buildLeftTitles(Color textColor) {
    return SideTitles(
      showTitles: true,
      interval: 40, // Match grid lines (0, 40, 80, 120, 160)
      reservedSize: 32,
      getTitlesWidget: (value, meta) {
        if (value % 40 != 0) return Container(); // Hide values not on major lines
        return Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Text(
            '${value.toInt()}',
            style: TextStyle(color: textColor, fontSize: 10, fontWeight: FontWeight.w500),
            textAlign: TextAlign.right,
          ),
        );
      },
    );
  }
}