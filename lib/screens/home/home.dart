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
            child: Consumer<ThemeProvider>(
              builder: (context, value, child) => IconButton(
                onPressed: () {
                  value.toggleTheme();
                },
                icon: value.darkModeEnabled
                    ? const Icon(color: Colors.white, Icons.sunny)
                    : const Icon(color: Colors.black, Icons.nightlight),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeHero(),
              HomeCategories(
                categories: DataModel().categories,
              ),
              RecentAuctions(
                items: DataModel().items,
              )
            ],
          ),
        ),
      ),
    );
  }
}
