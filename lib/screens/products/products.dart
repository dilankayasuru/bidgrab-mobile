import 'package:bidgrab/controllers/auction_controller.dart';
import 'package:bidgrab/models/auction.dart';
import 'package:bidgrab/screens/products/components/itemCard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class Products extends StatefulWidget {
  final String url;

  const Products({super.key, this.url = "auctions"});

  static String id = "/products";

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  late Future<List<Auction>> futureAuctions;
  bool searchOpened = false;
  String heading = "Auctions";

  @override
  void initState() {
    super.initState();
    futureAuctions = AuctionController.fetchAuctions(http.Client(), widget.url);
    if (widget.url.contains('categories')) {
      heading = "Browse categories";
    } else if (widget.url == "auctions") {
      heading = "Auctions";
    } else {
      heading = "Search results";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: searchOpened
              ? SizedBox(
                  height: 44,
                  child: SearchBar(
                    hintText: "Search items...",
                    onSubmitted: (String value) {
                      Navigator.pushNamed(
                        context,
                        Products.id,
                        arguments: 'search/?keyword=$value',
                      );
                    },
                  ),
                )
              : Text(heading),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                searchOpened = !searchOpened;
              });
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder<List<Auction>>(
                future: futureAuctions,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('An error has occurred!'),
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasData) {
                    final auctions = snapshot.data!;
                    if (auctions.isEmpty) {
                      return Center(
                        child: Column(
                          children: [
                            Lottie.asset("images/lottie/empty.json"),
                            const Text("No auction found!"),
                          ],
                        ),
                      );
                    } else {
                      return GridView.builder(
                        padding: const EdgeInsets.all(16),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 0.65,
                        ),
                        itemCount: auctions.length,
                        itemBuilder: (context, index) {
                          return ItemCard(auction: auctions[index]);
                        },
                      );
                    }
                  } else {
                    return const Center(
                      child: Text('No data available'),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
