import 'dart:async';
import 'dart:convert';
import 'package:bidgrab/config.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:http/http.dart' as http;
import 'package:bidgrab/models/category.dart';

class CategoryController {
  static Future<List<Category>> fetchCategories(http.Client client, url) async {
    final response = await client.get(Uri.parse('${Config.APP_URL}/api/$url'));
    return foundation.compute(_parseCategories, response.body);
  }

  static List<Category> _parseCategories(String responseBody) {
    final parsed =
        (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();
    return parsed.map<Category>((json) => Category.fromJson(json)).toList();
  }
}
