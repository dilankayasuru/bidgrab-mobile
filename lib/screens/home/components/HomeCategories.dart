import 'package:bidgrab/models/category.dart';
import 'package:bidgrab/screens/home/components/CategoryTab.dart';
import 'package:flutter/material.dart';

class HomeCategories extends StatelessWidget {
  // List of categories to be displayed.
  final List<Category> categories;

  // List to hold CategoryTab widgets.
  final List<CategoryTab> items = [];

  // Constructor
  HomeCategories({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    // Loop to create CategoryTab widgets for the first 6 categories.
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
          // GridView to display the categories in a grid format.
          GridView.count(
            // Number of columns based on the device orientation.
            crossAxisCount:
                MediaQuery.of(context).orientation == Orientation.portrait
                    ? 2
                    : 4,
            // Shrink the grid to fit its content.
            shrinkWrap: true,
            // Disable scrolling
            physics: const NeverScrollableScrollPhysics(),
            // Spacing between grid items.
            mainAxisSpacing: 16,
            crossAxisSpacing: 8,
            // Aspect ratio for the grid items.
            childAspectRatio: 3 / 1,
            // Add the CategoryTab widgets to the grid.
            children: items,
          ),
        ],
      ),
    );
  }
}
