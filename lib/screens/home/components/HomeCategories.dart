import 'package:bidgrab/controllers/category_controller.dart';
import 'package:bidgrab/screens/home/components/CategoryTab.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class HomeCategories extends StatefulWidget {
  const HomeCategories({super.key});

  @override
  State<HomeCategories> createState() => _HomeCategoriesState();
}

class _HomeCategoriesState extends State<HomeCategories> {
  final CategoryController _categoryController = CategoryController();

  @override
  void initState() {
    super.initState();
    _categoryController.fetchCategories();
  }

  @override
  void dispose() {
    _categoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            child: StreamBuilder(
              stream: _categoryController.categories,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No category available'));
                } else {
                  final categories = snapshot.data!;
                  return Swiper(
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
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
