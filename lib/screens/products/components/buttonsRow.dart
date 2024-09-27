import 'package:bidgrab/models/category.dart';
import 'package:bidgrab/models/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonsRow extends StatelessWidget {
  const ButtonsRow({super.key, required this.categories});

  // List of categories to be displayed
  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    // List to hold the button widgets.
    List<Widget> items = [];

    // Loop category and create an OutlinedButton
    for (var category in categories) {
      items.add(OutlinedButton(
        onPressed: () {},
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.only(right: 8),
              child: Image(
                image: AssetImage("images/categories/${category.image}"),
                width: 32,
                height: 32,
                fit: BoxFit.cover,
              ),
            ),
            // Consumer to get the current theme and set the text color accordingly.
            Consumer<ThemeProvider>(
              builder: (context, value, child) => Text(
                category.name,
                style: TextStyle(
                    color: value.darkModeEnabled ? Colors.white : Colors.black),
              ),
            )
          ],
        ),
      ));
      // Add a SizedBox for spacing between buttons.
      items.add(const SizedBox(
        width: 8,
      ));
    }

    // Return a horizontally scrollable row of buttons.
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: items,
      ),
    );
  }
}
