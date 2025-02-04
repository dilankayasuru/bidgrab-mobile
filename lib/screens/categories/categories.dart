import 'package:bidgrab/models/category.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bidgrab/controllers/category_controller.dart';
import 'category_card.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  late Future<List<Category>> futureCategories;

  @override
  void initState() {
    super.initState();
    futureCategories =
        CategoryController.fetchCategories(http.Client(), 'categories');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
        leading: IconButton(
          onPressed: () {
            // navigate to the home page
            Navigator.pushNamed(context, '/');
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: FutureBuilder<List<Category>>(
            future: futureCategories,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text('An error has occurred!'),
                );
              } else if (snapshot.hasData) {
                List<Category> categories = snapshot.data!;
                return Column(
                  spacing: 16,
                  children: categories
                      .map((category) => CategoryCard(category: category))
                      .toList(),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
