import 'package:flutter/material.dart';

class OnboardingProvider extends ChangeNotifier {
  int _currentStep = 1;
  final int _totalSteps = 4;
  String glucoseUnit = 'mg/dL';
  String carbUnit = 'Grams';
  String? selectedDevice;

  int get currentStep => _currentStep;
  int get totalSteps => _totalSteps;
  double get progress => _currentStep / _totalSteps;

  // Data storage for the profile
  String? selectedDiabetesType;
  String? selectedManagementMethod;

  void nextStep() {
    if (_currentStep < _totalSteps) {
      _currentStep++;
      notifyListeners();
    }
  }

  void previousStep() {
    if (_currentStep > 1) {
      _currentStep--;
      notifyListeners();
    }
  }

  void selectDiabetesType(String type) {
    selectedDiabetesType = type;
    notifyListeners();
  }

  void selectManagementMethod(String method) {
    selectedManagementMethod = method;
    notifyListeners();
  }

  void setGlucoseUnit(String unit) {
    glucoseUnit = unit;
    notifyListeners();
  }

  void setCarbUnit(String unit) {
    carbUnit = unit;
    notifyListeners();
  }

  void selectDevice(String device) {
    selectedDevice = device;
    notifyListeners();
  }
}