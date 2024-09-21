import 'package:bidgrab/components/itemCard.dart';
import 'package:flutter/material.dart';
import '../../../models/item.dart';

class RecentAuctions extends StatelessWidget {
  const RecentAuctions({super.key, required this.items});
  final List<Item> items;

  @override
  Widget build(BuildContext context) {
    List<ItemCard> itemsWidgets = [];
    for (var item in items) {
      itemsWidgets.add(
        ItemCard(item: item)
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: const Text(
            "Recently added auctions",
            style: TextStyle(fontSize: 24),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
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
