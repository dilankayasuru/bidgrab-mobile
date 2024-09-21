import 'package:bidgrab/models/category.dart';
import 'package:flutter/material.dart';

class ButtonsRow extends StatelessWidget {
  const ButtonsRow({super.key, required this.categories});

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];

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
            Text(category.name)
          ],
        ),
      ));
      items.add(const SizedBox(
        width: 8,
      ));
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: items,
      ),
    );
  }
}
