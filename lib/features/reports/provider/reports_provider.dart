import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReportsProvider extends ChangeNotifier {
  String _selectedPeriod = "Day";
  String _selectedTemplate = "Quick Summary";

  // Expansion states for the Preview Section
  bool _isGlucoseTrendsExpanded = true;
  bool _isTimeInRangeExpanded = true;

  // Getters
  String get selectedPeriod => _selectedPeriod;
  String get selectedTemplate => _selectedTemplate;
  bool get isGlucoseTrendsExpanded => _isGlucoseTrendsExpanded;
  bool get isTimeInRangeExpanded => _isTimeInRangeExpanded;
  bool get isDay => _selectedPeriod == "Day";
  final String _defaultMessage = "Dear Dr. Smith,\n\nPlease find my latest glucose report attached for review before our upcoming appointment.\n\nBest regards";
  String get defaultMessage => _defaultMessage;

  // Toggle methods for expansion tiles
  void toggleGlucoseTrends() {
    _isGlucoseTrendsExpanded = !_isGlucoseTrendsExpanded;
    notifyListeners();
  }

  void toggleTimeInRange() {
    _isTimeInRangeExpanded = !_isTimeInRangeExpanded;
    notifyListeners();
  }

  // Matches the green badge in Card.png
  String get previewStatus => "Ready";

  // Logic for the period badge in Template cards
  String get periodLabel {
    switch (_selectedPeriod) {
      case "Day": return "Daily";
      case "Week": return "Weekly";
      case "Month": return "Monthly";
      case "3 Months": return "Quarterly";
      default: return "Daily";
    }
  }

  // Pixel-perfect date range formatting
  String get reportDateRange {
    final now = DateTime.now();
    final formatter = DateFormat('MMMM d, yyyy');

    if (_selectedPeriod == "Day") {
      return formatter.format(now);
    } else if (_selectedPeriod == "Week") {
      final start = now.subtract(const Duration(days: 6));
      // Format: "Dec 2-8, 2024" style
      return "${DateFormat('MMM d').format(start)}-${DateFormat('d, yyyy').format(now)}";
    } else if (_selectedPeriod == "Month") {
      return DateFormat('MMMM yyyy').format(now);
    } else {
      return "Last 90 Days";
    }
  }

  // UI State modifiers
  void setPeriod(String period) {
    _selectedPeriod = period;
    notifyListeners();
  }

  void setTemplate(String template) {
    _selectedTemplate = template;
    notifyListeners();
  }


  void sendEmail(String recipient, String message) {
    // Implement actual email logic or API call here
    debugPrint("Sending email to $recipient");

  }
  final List<FlSpot> _dailyGlucoseData = [
    const FlSpot(0, 115),
    const FlSpot(1, 122),
    const FlSpot(2, 118),
    const FlSpot(3, 130),
    const FlSpot(4, 122),
    const FlSpot(5, 128),
    const FlSpot(6, 120),
  ];

  // 2. Create the Getter that the UI is looking for
  List<FlSpot> get graphData => _dailyGlucoseData;

  List<FlSpot> get dynamicGraphData {
    if (_selectedPeriod == "Day") {
      return _dailyGlucoseData;
    } else {

      return [
        const FlSpot(0, 100),
        const FlSpot(3, 140),
        const FlSpot(6, 110),
      ];
    }
  }


}