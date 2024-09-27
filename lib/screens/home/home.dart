import 'package:bidgrab/models/data.dart';
import 'package:bidgrab/models/theme.dart';
import 'package:bidgrab/screens/home/components/HomeCategories.dart';
import 'package:bidgrab/screens/home/components/HomeHero.dart';
import 'package:bidgrab/screens/home/components/RecentAuctions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("BidGrab",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Inter",
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
                fontSize: 24)),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            // Consumer widget to listen to changes in
            // ThemeProvider (Custom provider).
            child: Consumer<ThemeProvider>(
              builder: (context, value, child) => IconButton(
                // Toggle the theme when the button is pressed.
                onPressed: () {
                  value.toggleTheme();
                },
                // Change the icon based on the current theme.
                icon: value.darkModeEnabled
                    ? const Icon(
                        color: Colors.white, Icons.sunny) // Icon for dark mode.
                    : const Icon(
                        color: Colors.white70,
                        Icons.nightlight), // Icon for light mode.
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeHero(),
            SafeArea(
              child: Column(
                children: [
                  HomeCategories(
                    categories: DataModel().categories,
                  ),
                  RecentAuctions(
                    items: DataModel().items,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
