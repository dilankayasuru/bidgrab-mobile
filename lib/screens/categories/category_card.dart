import 'package:bidgrab/models/category.dart';
import 'package:bidgrab/screens/products/products.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          Products.id,
          arguments: 'categories/${category.id}',
        );
      },
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 15,
              offset: Offset(4, 9),
              color: Colors.black12,
              blurStyle: BlurStyle.normal,
              spreadRadius: 3,
            )
          ],
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Stack(
          children: [
            Container(
              height: 164,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                image: DecorationImage(
                  image: NetworkImage(category.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 164,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.8), Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            SizedBox(
              height: 164,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      category.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      category.description,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
