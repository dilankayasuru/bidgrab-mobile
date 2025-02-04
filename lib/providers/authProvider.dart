import 'package:bidgrab/controllers/auth_controller.dart';
import 'package:bidgrab/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthProvider with ChangeNotifier {
  User _user = User.empty();

  AuthProvider() {
    _refreshUser();
  }

  Future<void> _refreshUser() async {
    const storage = FlutterSecureStorage();
    String? token = await storage.read(key: "auth_token");
    if (token != null) {
      _user = await Auth.refresh(token);
    } else {
      _user = User.empty();
    }
    notifyListeners();
  }

  void setUser(User user) {
    _user = user;
  }

  void logOut() {
    _user = User.empty();
  }

  User getUser() {
    return _user;
  }

  bool authenticated() {
    return _user.token != null ? true : false;
  }
}
