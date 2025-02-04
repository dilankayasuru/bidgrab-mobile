import 'package:bidgrab/models/auction.dart';
import 'package:bidgrab/providers/theme.dart';
import 'package:bidgrab/screens/products/productView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuctionCard extends StatelessWidget {
  const AuctionCard({super.key, required this.auction});

  final Auction auction;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, value, child) => Container(
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          boxShadow: const [
            BoxShadow(
              blurRadius: 15,
              offset: Offset(4, 9),
              color: Colors.black12,
              blurStyle: BlurStyle.normal,
              spreadRadius: 3,
            )
          ],
          // color: Colors.white,
          color: value.darkModeEnabled ? Colors.white10 : Colors.white,
        ),
        width: 280,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image(
                  image: NetworkImage(auction.images?[0] ?? ''),
                  fit: BoxFit.contain,
                  height: 145,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            auction.title!.length > 30
                                ? '${auction.title?.substring(0, 30)}...'
                                : auction.title ?? "No title",
                            style: const TextStyle(
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            auction.categoryName ?? "No category",
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 16),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        "Last bid",
                        style: TextStyle(fontSize: 18),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                        decoration: BoxDecoration(
                            color: value.darkModeEnabled
                                ? Colors.white10
                                : Colors.blue.shade50,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(32)),
                            border: Border.all(
                                color: value.darkModeEnabled
                                    ? Colors.white10
                                    : Colors.blue.shade100)),
                        child: Center(
                          child: Text(
                            "Rs. ${auction.currentPrice ?? ""}",
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        spacing: 8,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                ProductView.id,
                                arguments: auction.id,
                              );
                            },
                            child: const Text(
                              "View Auction",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Expanded(
                            child: FilledButton(
                              onPressed: () {},
                              child: const Text(
                                "Bid",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
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
      ),
    );
  }
}
