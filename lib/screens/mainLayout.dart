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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentIndex = index;
          });
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
      // Defining a list of widgets to show depending on the selected index
      body: <Widget>[
        const Home(),
        const Products(),
        const Categories(),
        const Profile(),
      ][currentIndex],
    );
  }
}
