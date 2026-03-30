import 'package:flutter/material.dart';

class ReportsProvider extends ChangeNotifier {
  String _selectedPeriod = "Day";
  String _selectedTemplate = "Quick Summary";

  String get selectedPeriod => _selectedPeriod;
  String get selectedTemplate => _selectedTemplate;

  void setPeriod(String period) {
    _selectedPeriod = period;
    notifyListeners();
  }

  void setTemplate(String template) {
    _selectedTemplate = template;
    notifyListeners();
  }
}