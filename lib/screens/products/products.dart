import 'package:bidgrab/models/category.dart';
import 'package:bidgrab/models/data.dart';
import 'package:bidgrab/screens/products/components/buttonsRow.dart';
import 'package:bidgrab/screens/products/components/itemCard.dart';
import 'package:bidgrab/models/item.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  // List of items to be displayed
  final List<Item> items = DataModel().items;

  //  track if the search bar is opened
  bool searchOpened = false;

  @override
  Widget build(BuildContext context) {
    // List of ItemCard widgets
    List<ItemCard> itemsWidgets = [];
    // List of categories to be displayed in the ButtonsRow
    List<Category> categories = DataModel().categories;

    // Loop items and create ItemCard widgets
    for (var item in items) {
      itemsWidgets.add(ItemCard(item: item));
    }

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
        //navigate back to the home screen
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
            // Display ButtonsRow only in portrait orientation
            MediaQuery.of(context).orientation == Orientation.portrait
                ? ButtonsRow(categories: categories)
                : Container(),
            // Expanded widget to hold the GridView of items
            Expanded(
              child: GridView.count(
                // Number of columns in the grid based on screen width
                crossAxisCount: MediaQuery.of(context).size.width < 700
                    ? 2
                    : (MediaQuery.of(context).size.width < 1400 ? 4 : 6),
                // Aspect ratio of the grid items based on orientation
                childAspectRatio:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? 0.68
                        : 0.85,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                shrinkWrap: true,
                // List of ItemCard widgets to be displayed in the grid
                children: itemsWidgets,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
