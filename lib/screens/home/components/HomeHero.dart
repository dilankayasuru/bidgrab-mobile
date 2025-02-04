import 'package:bidgrab/screens/products/products.dart';
import 'package:flutter/material.dart';
import '../../../components/CurvedBottomContainer.dart';

class HomeHero extends StatefulWidget {
  const HomeHero({super.key});

  @override
  State<HomeHero> createState() => _HomeHeroState();
}

class _HomeHeroState extends State<HomeHero> {
  final _keywordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CurvedBottomContainer(
      // Container with curved bottom of hero content.
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 64),
        color: Colors.blue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("BidGrab",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: Colors.white)),
            const Text("Bid, Win, and Save Big on Unique Items!",
                style: TextStyle(fontSize: 20, color: Colors.white)),
            const SizedBox(height: 16),
            // Search bar for the app.
            SizedBox(
              width: 480,
              child: SearchBar(
                controller: _keywordTextController,
                leading: const Icon(Icons.search),
                hintText: "Search",
                padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(
                  horizontal: 16,
                )),
                onSubmitted: (String value) {
                  Navigator.pushNamed(
                    context,
                    Products.id,
                    arguments: 'search/?keyword=$value',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
