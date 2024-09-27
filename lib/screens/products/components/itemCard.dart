import 'package:flutter/material.dart';
import '../../../models/item.dart';
import '../productView.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Productview.id, arguments: item);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: AssetImage("images/items/${item.image}"),
            fit: BoxFit.cover,
            height: 160,
            width: 240,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            item.category,
            style: const TextStyle(color: Colors.grey, fontSize: 18),
          ),
          Text(
            item.title.length > 30
                ? "${item.title.substring(0, 15)}..."
                : item.title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Text(
            "Rs. ${item.lastBid}",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
