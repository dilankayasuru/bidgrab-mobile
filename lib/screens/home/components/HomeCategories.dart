import 'package:bidgrab/models/category.dart';
import 'package:bidgrab/screens/home/components/CategoryTab.dart';
import 'package:flutter/material.dart';

class HomeCategories extends StatelessWidget {
  final List<Category> categories;
  final List<CategoryTab> items = [];

  HomeCategories({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < 6; i++) {
      items.add(CategoryTab(
        category: categories[i],
      ));
    }
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Popular Categories",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 16,
          ),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 16,
            crossAxisSpacing: 8,
            childAspectRatio: 3 / 1,
            children: items,
          ),
        ],
      ),
    );
  }
}
