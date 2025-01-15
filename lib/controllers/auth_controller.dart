import 'dart:convert';
import 'dart:io';

import 'package:bidgrab/config.dart';
import 'package:bidgrab/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Auth {
  static const String app_url = Config.APP_URL;

  static Future<User> login(String email, String password) async {
    if (email.isEmpty) {
      throw ("Please enter your email!");
    }
    if (password.isEmpty) {
      throw ("Please enter your password!");
    }
    final deviceInfoPlugin = DeviceInfoPlugin();
    final deviceInfo = await deviceInfoPlugin.androidInfo;
    var response = await http.post(
      Uri.parse('$app_url/api/login'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email,
        "password": password,
        "device_name": deviceInfo.model,
      }),
    );
    var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      const storage = FlutterSecureStorage();
      var user = jsonResponse["user"];
      await storage.write(key: "name", value: user["name"]);
      await storage.write(key: "email", value: user["email"]);
      await storage.write(key: "profilePic", value: user["profile_photo_url"]);
      await storage.write(key: "auth_token", value: jsonResponse["token"]);
      return User(
        user["name"],
        user["email"],
        user["profile_photo_url"],
        jsonResponse["token"],
      );
    }
    throw (jsonResponse["message"]);
  }

  static Future<void> logout() async {
    const storage = FlutterSecureStorage();
    String? token = await storage.read(key: "auth_token");
    var response = await http.post(
      Uri.parse('$app_url/api/logout'),
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      await storage.delete(key: "name");
      await storage.delete(key: "email");
      await storage.delete(key: "auth_token");
      await storage.delete(key: "profilePic");
    } else {
      throw Exception("Invalid token!");
    }
  }

  static Future<User> register(
      String name, String email, String password) async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    final deviceInfo = await deviceInfoPlugin.androidInfo;
    var response = await http.post(
      Uri.parse('$app_url/api/register'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "name": name,
        "email": email,
        "password": password,
        "device_name": deviceInfo.model,
      }),
    );
    var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 201) {
      const storage = FlutterSecureStorage();
      var user = jsonResponse["user"];
      await storage.write(key: "name", value: user["name"]);
      await storage.write(key: "email", value: user["email"]);
      await storage.write(key: "profilePic", value: user["profile_photo_url"]);
      await storage.write(key: "auth_token", value: jsonResponse["token"]);
      return User(user["name"], user["email"], user["profile_photo_url"], jsonResponse["token"]);
    }
    String error;
    if (jsonResponse["errors"] != null &&
        jsonResponse["errors"]["email"] != null) {
      error = jsonResponse["errors"]["email"][0];
    } else if (jsonResponse["message"] != null) {
      error = jsonResponse["message"];
    } else {
      error = "Unknown error!";
    }
    throw (error);
  }
}
