import 'package:flutter/material.dart';

class InsightsProvider extends ChangeNotifier {
  String _selectedPeriod = "Day";

  String get selectedPeriod => _selectedPeriod;
  bool get isDay => _selectedPeriod == "Day";

  // 1. Data mapping for Health Score Card
  final Map<String, Map<String, String>> _periodData = {
    "Day": {"score": "82/100", "trend": "+2 today"},
    "Week": {"score": "85/100", "trend": "+5 week"},
    "Month": {"score": "88/100", "trend": "+12 month"},
    "3 Months": {"score": "91/100", "trend": "+18 total"},
  };

  // 2. Data mapping for Summary Section
  final Map<String, Map<String, String>> _summaryData = {
    "Day": {
      "header": "Today Summary",
      "glucose": "8 readings today",
      "meals": "3 meals logged",
      "insulin": "5 doses recorded",
      "activity": "1 workout logged",
      "status": "Fair"
    },
    "Week": {
      "header": "Weekly Summary",
      "glucose": "56 readings this week",
      "meals": "21 meals logged",
      "insulin": "35 doses recorded",
      "activity": "5 workouts logged",
      "status": "Good"
    },
    "Month": {
      "header": "Monthly Summary",
      "glucose": "240 readings this month",
      "meals": "90 meals logged",
      "insulin": "150 doses recorded",
      "activity": "22 workouts logged",
      "status": "Great"
    },
    "3 Months": {
      "header": "Quarterly Summary",
      "glucose": "720 readings total",
      "meals": "270 meals logged",
      "insulin": "450 doses recorded",
      "activity": "65 workouts logged",
      "status": "Excellent"
    },
  };

  // Health Score Getters
  String get healthScore => _periodData[_selectedPeriod]?["score"] ?? "82/100";
  String get healthTrend => _periodData[_selectedPeriod]?["trend"] ?? "+2 today";

  // Summary Section Getters
  String get summaryHeader => _summaryData[_selectedPeriod]!["header"]!;
  String get glucoseSummary => _summaryData[_selectedPeriod]!["glucose"]!;
  String get mealsSummary => _summaryData[_selectedPeriod]!["meals"]!;
  String get insulinSummary => _summaryData[_selectedPeriod]!["insulin"]!;
  String get activitySummary => _summaryData[_selectedPeriod]!["activity"]!;
  String get activityStatus => _summaryData[_selectedPeriod]!["status"]!;

  void setPeriod(String period) {
    _selectedPeriod = period;
    notifyListeners();
  }
}