import 'dart:convert';
import 'dart:ffi';

import 'package:bidgrab/controllers/auction_controller.dart';
import 'package:bidgrab/models/auction.dart';
import 'package:bidgrab/providers/theme.dart';
import 'package:bidgrab/screens/products/productView.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:bidgrab/providers/authProvider.dart';

class AuctionCard extends StatefulWidget {
  const AuctionCard({super.key, required this.auction});

  final Auction auction;

  @override
  State<AuctionCard> createState() => _AuctionCardState();
}

class _AuctionCardState extends State<AuctionCard> {
  String? error;

  final _bidAmountController = TextEditingController();

  void _placeBid() async {
    await AuctionController.placeBid(
            widget.auction.id ?? "", _bidAmountController.text)
        .then((response) {
      Navigator.pop(context);
      var decoded = jsonDecode(response.body);
      if (response.statusCode == 201) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(decoded["message"]),
            content: Lottie.asset("images/lottie/highfive.json"),
            actions: [
              FilledButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Done"),
              )
            ],
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(decoded["message"]),
            content: Lottie.asset("images/lottie/robot.json"),
            actions: [
              FilledButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Okay"),
              )
            ],
          ),
        );
      }
    });
  }

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
                  image: NetworkImage(widget.auction.images?[0] ?? ''),
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
                            widget.auction.title!.length > 30
                                ? '${widget.auction.title?.substring(0, 30)}...'
                                : widget.auction.title ?? "No title",
                            style: const TextStyle(
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            widget.auction.categoryName ?? "No category",
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
                            "Rs. ${widget.auction.currentPrice ?? ""}",
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
                                arguments: widget.auction.id,
                              );
                            },
                            child: const Text(
                              "View Auction",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Expanded(
                            child: FilledButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text("Place bid"),
                                    content: TextField(
                                      keyboardType:
                                          const TextInputType.numberWithOptions(
                                        decimal: true,
                                      ),
                                      controller: _bidAmountController,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.all(16),
                                        border: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16)),
                                        ),
                                        label: const Text("Amount"),
                                        errorText: error,
                                        helperText:
                                            "Must be grater than Rs. ${widget.auction.currentPrice}.",
                                      ),
                                    ),
                                    actions: [
                                      FilledButton(
                                        onPressed: () {
                                          _placeBid();
                                        },
                                        child: const Text("Place bid"),
                                      )
                                    ],
                                  ),
                                );
                              },
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
                "${widget.auction.bidCount} Bids",
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
