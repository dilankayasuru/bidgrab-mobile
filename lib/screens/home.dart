import 'package:bidgrab/components/CurvedBottomContainer.dart';
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
                fontWeight: FontWeight.w700,
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
          child: Container(
            child: Column(
              children: [
                CurvedBottomContainer(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 64),
                    color: Colors.blue,
                    child: const SearchBar(
                      leading: Icon(Icons.search),
                      hintText: "Search",
                      padding: WidgetStatePropertyAll(
                          EdgeInsets.fromLTRB(16, 0, 16, 0)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
