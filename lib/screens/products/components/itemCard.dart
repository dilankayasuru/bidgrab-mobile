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
          Stack(
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
              Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 25,
                    )
                  ],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16)),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Text(
                  "${auction.bidCount} Bids",
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
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
