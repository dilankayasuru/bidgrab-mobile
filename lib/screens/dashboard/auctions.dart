import 'package:bidgrab/controllers/auction_controller.dart';
import 'package:bidgrab/controllers/order_controller.dart';
import 'package:bidgrab/models/auction.dart';
import 'package:bidgrab/models/order.dart';
import 'package:bidgrab/screens/products/productView.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class Auctions extends StatefulWidget {
  const Auctions({super.key});

  static String id = "/auctions";

  @override
  State<Auctions> createState() => _AuctionsState();
}

class _AuctionsState extends State<Auctions> {
  late Future<List<Auction>> futureAuctions;

  @override
  void initState() {
    futureAuctions = AuctionController.fetchOwnAuctions(http.Client());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My auctions"),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: FutureBuilder(
            future: futureAuctions,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text('An error has occurred!'),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData) {
                final purchases = snapshot.data!;
                if (purchases.isEmpty) {
                  return Center(
                    child: Column(
                      children: [
                        Lottie.asset("images/lottie/empty.json"),
                        const Text("No auction found!"),
                      ],
                    ),
                  );
                } else {
                  List<Auction> auctions = snapshot.data!;
                  return Column(
                    children: auctions
                        .map((auction) => Card(
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                              ),
                              elevation: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Image.network(
                                          auction.images![0],
                                          width: 64,
                                          height: 64,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 128,
                                              child: Text(
                                                auction.title!.length > 30
                                                    ? '${auction.title!.substring(0, 30)}...'
                                                    : auction.title ??
                                                        "No title",
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                            Text(
                                                'Rs. ${auction.currentPrice!}'),
                                            Text(auction.status!),
                                          ],
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, ProductView.id,
                                                arguments: auction.id);
                                          },
                                          icon: const Icon(
                                              Icons.remove_red_eye_rounded),
                                        ),
                                        auction.status == "pending"
                                            ? IconButton(
                                                onPressed: () async {
                                                  await AuctionController
                                                      .delete(auction);
                                                  Navigator.pop(context);
                                                },
                                                icon: const Icon(Icons.delete),
                                                color: Colors.redAccent,
                                              )
                                            : const SizedBox(),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ))
                        .toList(),
                  );
                }
              } else {
                return const Center(
                  child: Text('No data available'),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
