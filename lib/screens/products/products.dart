import 'package:bidgrab/controllers/auction_controller.dart';
import 'package:bidgrab/models/auction.dart';
import 'package:bidgrab/models/category.dart';
import 'package:bidgrab/models/data.dart';
import 'package:bidgrab/screens/products/components/buttonsRow.dart';
import 'package:bidgrab/screens/products/components/itemCard.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  final AuctionController _auctionController = AuctionController();
  bool searchOpened = false;

  @override
  void initState() {
    super.initState();
    _auctionController.fetchAuctions('auctions');
  }

  @override
  void dispose() {
    _auctionController.dispose();
    super.dispose();
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
              : const Text("Products"),
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
              child: StreamBuilder<List<Auction>>(
                stream: _auctionController.auctions,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                        child: const Text('No auctions available'));
                  } else {
                    final auctions = snapshot.data!;
                    return GridView.count(
                      crossAxisCount: MediaQuery.of(context).size.width < 700
                          ? 2
                          : (MediaQuery.of(context).size.width < 1400 ? 4 : 6),
                      childAspectRatio: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? 0.68
                          : 0.85,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 32,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 0),
                      shrinkWrap: true,
                      children: auctions.map((auction) {
                        return ItemCard(
                          item: auction,
                        );
                      }).toList(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
