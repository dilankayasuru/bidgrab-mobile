import 'package:bidgrab/models/category.dart';
import 'package:bidgrab/screens/home/components/CategoryTab.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

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
            "Browse Categories",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 32,
          ),
          SizedBox(
            height: 164,
            child: Swiper(
              outer: false,
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                return CategoryTab(category: categories[index]);
              },
              autoplay: true,
              fade: 0.25,
              autoplayDisableOnInteraction: true,
              control: null,
              viewportFraction: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
