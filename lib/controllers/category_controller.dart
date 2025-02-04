import 'dart:async';
import 'dart:convert';
import 'package:bidgrab/config.dart';
import 'package:http/http.dart' as http;
import '../models/category.dart';

class CategoryController {
  final StreamController<List<Category>> _categoryController =
      StreamController<List<Category>>();

  Stream<List<Category>> get categories => _categoryController.stream;

  Future<void> fetchCategories() async {
    final response =
        await http.get(Uri.parse('${Config.APP_URL}/api/categories'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<Category> categories = (data as List)
          .map<Category>((category) => Category(
                id: category['id'] ?? '',
                name: category['name'] ?? '',
                description: category["description"],
                image: category['image'] ?? '',
              ))
          .toList();
      if (!_categoryController.isClosed) {
        _categoryController.add(categories);
      }
    } else {
      throw ('Failed to load categories');
    }
  }

  void dispose() {
    _categoryController.close();
  }
}