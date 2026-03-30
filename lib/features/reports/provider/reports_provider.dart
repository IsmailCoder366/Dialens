import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:intl/intl.dart';

class ReportsProvider extends ChangeNotifier {
  String _selectedPeriod = "Day";
  String _selectedTemplate = "Quick Summary";

  String get selectedPeriod => _selectedPeriod;
  String get selectedTemplate => _selectedTemplate;
  bool get isDay => _selectedPeriod == "Day";

  String get previewBadge {
    switch (_selectedPeriod) {
      case "Day": return "Daily";
      case "Week": return "Weekly";
      case "Month": return "Monthly";
      case "3 Months": return "Quarterly";
      default: return "Daily";
    }
  }
  String get reportDateRange {
    final now = DateTime.now();
    final formatter = DateFormat('MMM d, yyyy');

    if (_selectedPeriod == "Day") {
      return formatter.format(now);
    } else if (_selectedPeriod == "Week") {
      final start = now.subtract(const Duration(days: 7));
      return "${DateFormat('MMM d').format(start)} - ${formatter.format(now)}";
    } else {
      // Logic for Month / 3 Months
      final start = now.subtract(const Duration(days: 30));
      return "${DateFormat('MMM d').format(start)} - ${formatter.format(now)}";
    }
  }

  void setPeriod(String period) {
    _selectedPeriod = period;
    notifyListeners();
  }

  void setTemplate(String template) {
    _selectedTemplate = template;
    notifyListeners();
  }
}