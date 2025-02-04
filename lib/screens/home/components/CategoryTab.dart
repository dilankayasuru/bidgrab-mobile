import 'package:bidgrab/models/category.dart';
import 'package:bidgrab/providers/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    // Use Consumer to listen to changes in ThemeProvider.
    return Consumer<ThemeProvider>(
      builder: (context, value, child) => Column(
        children: [
          InkWell(
            onTap: () {
              // TODO
              print("Taped");
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(category.image),
                  fit: BoxFit.cover,
                ),
              ),
              height: 128,
              width: 128,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            category.name,
            style: TextStyle(
              fontSize: 16,
              color: value.darkModeEnabled ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
