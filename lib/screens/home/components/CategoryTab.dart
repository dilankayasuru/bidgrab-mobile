import 'package:bidgrab/models/category.dart';
import 'package:bidgrab/models/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    // Use Consumer to listen to changes in ThemeProvider.
    return Consumer<ThemeProvider>(
      builder: (context, value, child) => ElevatedButton(
        onPressed: () {},
        // Create a row to display the category image and name.
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(0, 4, 4, 4),
              child: Image(
                // Load the category image from assets.
                image: AssetImage("images/categories/${category.image}"),
                height: 44,
              ),
            ),
            // display the category name.
            Flexible(
              child: Text(
                category.name,
                // Style the text based on the current theme.
                style: TextStyle(
                    fontSize: 16,
                    color: value.darkModeEnabled ? Colors.white : Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
