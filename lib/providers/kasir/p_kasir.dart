import 'package:flutter/material.dart';

class ProviderKasir extends ChangeNotifier {
  bool _isDrawerSettings = false;

  bool get isDrawerSettings => _isDrawerSettings;

  set isDrawerSettings(bool value) {
    _isDrawerSettings = value;
    notifyListeners();
  }
}
