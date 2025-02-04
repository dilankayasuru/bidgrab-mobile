import 'package:bidgrab/controllers/category_controller.dart';
import 'package:bidgrab/models/category.dart';
import 'package:bidgrab/screens/home/components/CategoryTab.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:http/http.dart' as http;

class HomeCategories extends StatefulWidget {
  const HomeCategories({super.key});

  @override
  State<HomeCategories> createState() => _HomeCategoriesState();
}

class _HomeCategoriesState extends State<HomeCategories> {
  late Future<List<Category>> futureCategories;

  @override
  void initState() {
    super.initState();
    futureCategories =
        CategoryController.fetchCategories(http.Client(), 'categories');
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
              child: FutureBuilder<List<Category>>(
                future: futureCategories,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('An error has occurred!'),
                    );
                  } else if (snapshot.hasData) {
                    List<Category> categories = snapshot.data!;
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
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              )),
        ],
      ),
    );
  }
}
