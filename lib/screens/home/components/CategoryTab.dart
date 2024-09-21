import 'package:flutter/material.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key, required this.image, required this.name});

  final AssetImage image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {},
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(0, 4, 4, 4),
              child: Image(
                image: image,
                height: 44,
              ),
            ),
            Flexible(
              child: Text(
                name,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
