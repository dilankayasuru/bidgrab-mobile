import 'package:flutter/material.dart';
import '../../../models/item.dart';
import '../productView.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.item});

  // The item to be displayed in the card
  final Item item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // Navigate to the product view screen when the card is tapped
      onTap: () {
        Navigator.pushNamed(context, Productview.id, arguments: item);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: AssetImage("images/items/${item.image}"),
            fit: BoxFit.cover,
            // Adjust the image height and width based on the device orientation
            height: MediaQuery.of(context).orientation == Orientation.portrait
                ? 160
                : 120,
            width: MediaQuery.of(context).orientation == Orientation.portrait
                ? 240
                : 200,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            item.category,
            style: const TextStyle(color: Colors.grey, fontSize: 18),
          ),
          // Display the item title, truncate if it's too long
          Text(
            item.title.length > 30
                ? "${item.title.substring(0, 15)}..."
                : item.title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          // Display the last bid amount for the item
          Text(
            "Rs. ${item.lastBid}",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}