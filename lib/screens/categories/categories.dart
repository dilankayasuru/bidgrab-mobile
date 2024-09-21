import 'package:bidgrab/models/category.dart';
import 'package:bidgrab/models/data.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> categories = [];
    for (Category category in DataModel().categories) {
      categories.add(
        InkWell(
          onTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage("images/categories/${category.image}"),
                width: 64,
                height: 64,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                category.name,
                style: const TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        // title: searchOpened ? const SearchBar() : const Text("Products"),
        title: const Text("Categories"),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            padding: const EdgeInsets.all(16),
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            shrinkWrap: true,
            children: categories,
          ),
        ),
      ),
    );
  }
}
