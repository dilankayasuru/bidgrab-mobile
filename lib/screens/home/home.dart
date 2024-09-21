import 'package:bidgrab/models/data.dart';
import 'package:bidgrab/screens/home/components/HomeCategories.dart';
import 'package:bidgrab/screens/home/components/HomeHero.dart';
import 'package:bidgrab/screens/home/components/RecentAuctions.dart';
import 'package:flutter/material.dart';

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
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
            margin: const EdgeInsets.only(right: 16),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.person,
                  color: Colors.blue,
                )),
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
