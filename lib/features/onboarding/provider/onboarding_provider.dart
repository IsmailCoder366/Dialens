import 'package:flutter/material.dart';

class OnboardingProvider extends ChangeNotifier {
  int _currentStep = 1;
  final int _totalSteps = 4;
  String glucoseUnit = 'mg/dL';
  String carbUnit = 'Grams';
  String? selectedDevice;
  int lowTarget = 70;
  int highTarget = 180;
  String? primaryGoal;
  bool notificationsEnabled = false;
  bool bluetoothEnabled = false;
  bool healthDataEnabled = false;

  int get currentStep => _currentStep;
  int get totalSteps => _totalSteps;
  double get progress => _currentStep / _totalSteps;

  // Data storage for the profile
  String? selectedDiabetesType;
  String? selectedManagementMethod;

  void nextStep(BuildContext context) {
    if (_currentStep < _totalSteps) {
      _currentStep++;
      notifyListeners();
    } else {
      // Now 'context' is available to be passed here
      _finishOnboarding(context);
    }
  }

  void _finishOnboarding(BuildContext context) {
    // Navigate and remove all previous onboarding screens from the stack
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/main-wrapper',
          (route) => false,
    );
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

  void setLowTarget(int value) {
    lowTarget = value;
    notifyListeners();
  }

  void setHighTarget(int value) {
    highTarget = value;
    notifyListeners();
  }

  void selectPrimaryGoal(String goal) {
    primaryGoal = goal;
    notifyListeners();
  }

  void toggleNotifications(bool value) {
    notificationsEnabled = value;
    notifyListeners();
  }

  void toggleBluetooth(bool value) {
    bluetoothEnabled = value;
    notifyListeners();
  }

  void toggleHealthData(bool value) {
    healthDataEnabled = value;
    notifyListeners();
  }

  void completeOnboarding(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
  }
}