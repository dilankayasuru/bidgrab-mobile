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
  final List<Item> items = DataModel().items;
  bool searchOpened = false;

  @override
  Widget build(BuildContext context) {
    List<ItemCard> itemsWidgets = [];
    List<Category> categories = DataModel().categories;
    for (var item in items) {
      itemsWidgets.add(ItemCard(item: item));
    }
    return Scaffold(
      appBar: AppBar(
        // title: searchOpened ? const SearchBar() : const Text("Products"),
        title: Container(
          child: searchOpened ? const SizedBox(
            height: 44,
            width: 240,
            child: SearchBar(
              hintText: "Search items...",
            ),
          ) : const Text("Products"),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
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
            ButtonsRow(categories: categories),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.68,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                shrinkWrap: true,
                children: itemsWidgets,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
