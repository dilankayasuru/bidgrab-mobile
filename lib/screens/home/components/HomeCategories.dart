import 'package:bidgrab/screens/home/components/CategoryTab.dart';
import 'package:flutter/material.dart';

class HomeCategories extends StatelessWidget {
  final List<CategoryTab> categories;
  final List<Widget> items = [];

  HomeCategories({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < categories.length; i += 2) {
      items.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          categories[i],
          const SizedBox(
            width: 8,
          ),
          categories[i + 1],
        ],
      ));
      items.add(const SizedBox(
        height: 16,
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
          Column(
            children: items,
          )
        ],
      ),
    );
  }
}
