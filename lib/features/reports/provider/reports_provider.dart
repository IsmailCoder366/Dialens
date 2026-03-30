import 'package:flutter/material.dart';

class ReportsProvider extends ChangeNotifier {
  String _selectedPeriod = "Day";
  String _selectedTemplate = "Quick Summary";

  String get selectedPeriod => _selectedPeriod;
  String get selectedTemplate => _selectedTemplate;
  bool get isDay => _selectedPeriod == "Day";

  String get previewBadge => _selectedPeriod == "Day" ? "Daily" :
  _selectedPeriod == "Week" ? "Weekly" :
  _selectedPeriod == "Month" ? "Monthly" : "Quarterly";

  void setPeriod(String period) {
    _selectedPeriod = period;
    notifyListeners();
  }

  void setTemplate(String template) {
    _selectedTemplate = template;
    notifyListeners();
  }
}