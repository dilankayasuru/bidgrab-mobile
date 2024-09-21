import 'package:bidgrab/screens/categories/categories.dart';
import 'package:bidgrab/screens/home/home.dart';
import 'package:bidgrab/screens/products/products.dart';
import 'package:bidgrab/screens/profile/profile.dart';
import 'package:flutter/material.dart';

class MainLayOut extends StatefulWidget {
  const MainLayOut({super.key});

  @override
  State<MainLayOut> createState() => _MainLayOutState();
}

class _MainLayOutState extends State<MainLayOut> {
  int currentIndex = 0;

  final _pageViewController = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: NavigationBar(
          selectedIndex: currentIndex,
          onDestinationSelected: (int index) {
            setState(() {
              currentIndex = index;
            });
            _pageViewController.animateToPage(
              index,
              duration: const Duration(microseconds: 600),
              curve: Curves.easeInOut,
            );
          },
          destinations: const [
            NavigationDestination(
                selectedIcon: Icon(Icons.home_filled),
                icon: Icon(Icons.home_outlined),
                label: 'Home'),
            NavigationDestination(
                selectedIcon: Icon(Icons.shopping_bag),
                icon: Icon(Icons.shopping_bag_outlined),
                label: 'Products'),
            NavigationDestination(
                selectedIcon: Icon(Icons.grid_view_rounded),
                icon: Icon(Icons.grid_view_outlined),
                label: 'Categories'),
            NavigationDestination(
                selectedIcon: Icon(Icons.person),
                icon: Icon(Icons.person_outline),
                label: 'Profile'),
          ],
        ),
        body: PageView(
          controller: _pageViewController,
          onPageChanged: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          children: const [
            Home(),
            Products(),
            Categories(),
            Profile(),
          ],
        ));
  }
}
