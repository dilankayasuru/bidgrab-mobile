import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {

  bool _darkModeEnabled = false;

  bool get darkModeEnabled => _darkModeEnabled;

  void toggleTheme () {
    _darkModeEnabled = !_darkModeEnabled;
    notifyListeners();
  }

}