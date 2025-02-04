import 'package:bidgrab/components/itemCard.dart';
import 'package:flutter/material.dart';
import '../../../models/item.dart';

// Display list of recent auctions.
class TrendingAuctions extends StatelessWidget {
  const TrendingAuctions({super.key, required this.items, required this.child});

  // List of items to be displayed.
  final List<Item> items;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    // List of ItemCard widgets.
    List<ItemCard> itemsWidgets = [];
    // Create ItemCard widgets for each item.
    for (var item in items) {
      itemsWidgets.add(ItemCard(item: item));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        child,
        const SizedBox(
          height: 16,
        ),
        // Scrollable row to display the ItemCard widgets.
        SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 0, 0, 16),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: itemsWidgets,
          ),
        )
      ],
    );
  }
}
