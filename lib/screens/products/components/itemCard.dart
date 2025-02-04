import 'package:flutter/material.dart';
import '../../../models/auction.dart';
import '../productView.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.auction});

  final Auction auction;

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: () {
        Navigator.pushNamed(context, ProductView.id, arguments: auction.id);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 164,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: NetworkImage(auction.images![0]),
                )),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            '${auction.categoryName}',
            style: const TextStyle(color: Colors.grey, fontSize: 16),
          ),
          Text(
            auction.title!.length > 30
                ? '${auction.title?.substring(0, 30)}...'
                : auction.title ?? "No title",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          // Display the last bid amount for the item
          Text(
            "Rs. ${auction.currentPrice}",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
