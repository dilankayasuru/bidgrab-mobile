import 'package:flutter/material.dart';

class Userprovider with ChangeNotifier {
  // Private fields to store user information.
  final String _fistName = "Dilanka";
  final String _lastName = "Yasuru";
  bool _loggedIn = false;

  // Getters
  bool get loggedIn => _loggedIn;
  String get fistName => _fistName;
  String get lastName => _lastName;

  // Setter for the logged-in status.
  set loggedIn (bool loggedIn) {
    _loggedIn = loggedIn;
    // Notify listeners about the change.
    notifyListeners();
  }

  // Method to handle user login.
  // Returns true if login is successful, otherwise false.
  bool login(String email, String password) {
    if (email == "dilanka@gmail.com" && password == '123456') {
      _loggedIn = true;
      notifyListeners();
      return true;
    }
    _loggedIn = false;
    notifyListeners();
    return false;
  }
}