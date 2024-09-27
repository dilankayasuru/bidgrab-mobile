import 'package:bidgrab/models/category.dart';
import 'package:bidgrab/models/data.dart';
import 'package:bidgrab/models/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    // List to hold category widgets
    List<Widget> categories = [];

    // Loop through each category in the data model and create a widget for it
    for (Category category in DataModel().categories) {
      categories.add(
        // Consumer widget to listen to changes in ThemeProvider
        Consumer<ThemeProvider>(
          builder: (context, value, child) => InkWell(
            // Rounded corners for the InkWell widget
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            splashColor:
                value.darkModeEnabled ? Colors.white10 : Colors.blue.shade50,
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Display category image
                Image(
                  image: AssetImage("images/categories/${category.image}"),
                  width: 64,
                  height: 64,
                ),
                const SizedBox(
                  height: 8,
                ),
                // Display category name
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
        ),
      );
    }

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
        // GridView to display categories in a grid format
        child: GridView.count(
          // Number of columns based on screen width
          crossAxisCount: MediaQuery.of(context).size.width < 700
              ? 2
              : (MediaQuery.of(context).size.width < 1400 ? 4 : 6),
          padding: const EdgeInsets.all(16),
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          shrinkWrap: true,
          // Add category widgets to the grid
          children: categories,
        ),
      ),
    );
  }
}
