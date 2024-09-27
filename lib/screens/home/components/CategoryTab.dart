import 'package:bidgrab/models/category.dart';
import 'package:bidgrab/models/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, value, child) => ElevatedButton(
        onPressed: () {},
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(0, 4, 4, 4),
              child: Image(
                image: AssetImage("images/categories/${category.image}"),
                height: 44,
              ),
            ),
            Flexible(
              child: Text(
                category.name,
                style: TextStyle(fontSize: 16, color: value.darkModeEnabled ? Colors.white : Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
