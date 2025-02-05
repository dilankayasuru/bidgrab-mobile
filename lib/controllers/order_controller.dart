import 'dart:convert';
import 'dart:io';
import 'package:bidgrab/config.dart';
import 'package:http/http.dart' as http;
import 'package:bidgrab/models/order.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class OrderController {
  static Future<List<Order>> fetchOrders(http.Client client) async {
    const storage = FlutterSecureStorage();
    String? token = await storage.read(key: "auth_token");
    if (token == null) {
      throw ("You must login to get purchases!");
    }
    var response = await http.get(
      Uri.parse('${Config.APP_URL}/api/purchases'),
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((order) => Order.fromJson(order)).toList();
    } else {
      throw Exception('Failed to load orders');
    }
  }
}
