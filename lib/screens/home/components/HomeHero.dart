import 'package:flutter/material.dart';
import '../../../components/CurvedBottomContainer.dart';

// hero section of the home screen.
class HomeHero extends StatelessWidget {
  const HomeHero({super.key});

  @override
  Widget build(BuildContext context) {
    return CurvedBottomContainer(
      // Container with curved bottom of hero content.
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 64),
        color: Colors.blue,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("BidGrab",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: Colors.white)),
            Text("Bid, Win, and Save Big on Unique Items!",
                style: TextStyle(fontSize: 20, color: Colors.white)),
            SizedBox(height: 16),
            // Search bar for the app.
            SizedBox(
              width: 480,
              child: SearchBar(
                leading: Icon(Icons.search),
                hintText: "Search",
                padding:
                    WidgetStatePropertyAll(EdgeInsets.fromLTRB(16, 0, 16, 0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
