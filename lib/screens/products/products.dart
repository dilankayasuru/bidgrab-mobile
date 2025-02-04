import 'package:bidgrab/controllers/auction_controller.dart';
import 'package:bidgrab/models/auction.dart';
import 'package:bidgrab/models/category.dart';
import 'package:bidgrab/models/data.dart';
import 'package:bidgrab/screens/products/components/buttonsRow.dart';
import 'package:bidgrab/screens/products/components/itemCard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Products extends StatefulWidget {
  const Products({super.key});

  static String id = "";

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  late Future<List<Auction>> futureAuctions;
  bool searchOpened = false;

  @override
  void initState() {
    super.initState();
    futureAuctions = AuctionController.fetchAuctions(http.Client(), 'auctions');
    print(futureAuctions);
  }

  @override
  Widget build(BuildContext context) {
    List<Category> categories = DataModel().categories;

    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: searchOpened
              ? const SizedBox(
                  height: 44,
                  width: 240,
                  child: SearchBar(
                    hintText: "Search items...",
                  ),
                )
              : const Text("Auctions"),
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
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.sort),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            MediaQuery.of(context).orientation == Orientation.portrait
                ? ButtonsRow(categories: categories)
                : Container(),
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
