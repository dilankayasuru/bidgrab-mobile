import 'package:flutter/material.dart';

/// A provider class to manage theme.
class ThemeProvider with ChangeNotifier {
  // Private field to store the dark mode status.
  bool _darkModeEnabled = false;
  // Getter
  bool get darkModeEnabled => _darkModeEnabled;
  // Constructor to initialize the system preferred dark mode status
  ThemeProvider({required bool darkModeEnabled}) : _darkModeEnabled = darkModeEnabled;
  /// Method to toggle the theme
  void toggleTheme() {
    _darkModeEnabled = !_darkModeEnabled;
    notifyListeners();
  }
}