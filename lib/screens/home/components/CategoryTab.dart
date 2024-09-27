import 'package:bidgrab/models/category.dart';
import 'package:flutter/material.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
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
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
