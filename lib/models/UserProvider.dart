import 'package:bidgrab/screens/profile/profile.dart';
import 'package:flutter/material.dart';

class Userprovider with ChangeNotifier {
  String _fistName = "Dilanka";
  String _lastName = "Yasuru";
  bool _loggedIn = false;

  bool get loggedIn => _loggedIn;

  String get fistName => _fistName;

  String get lastName => _lastName;

  set loggedIn (bool loggedIn) {
    _loggedIn = loggedIn;
  }

  bool login(String email, String password) {
    if (email == "dilanka@gmail.com" && password == '123456') {
      _loggedIn = true;
      return true;
    }
    _loggedIn = false;
    return false;
  }

  void register(String firstName, String lastName) {
    _fistName = firstName;
    _lastName = lastName;
    _loggedIn = true;
  }
}
