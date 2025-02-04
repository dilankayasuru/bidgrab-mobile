import 'package:flutter/material.dart';
import '../../../models/auction.dart';
import '../productView.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.item});

  final Auction item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ProductView.id, arguments: item.id);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            // Adjust the radius as needed
            child: Image(
              image: NetworkImage(item.images[0]),
              fit: BoxFit.cover,
              // Adjust the image height and width based on the device orientation
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? 160
                  : 120,
              width: MediaQuery.of(context).orientation == Orientation.portrait
                  ? 240
                  : 200,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            '${item.categoryName}',
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
            "Rs. ${item.current_price}",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
