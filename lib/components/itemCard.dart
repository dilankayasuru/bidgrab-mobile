import 'package:bidgrab/models/item.dart';
import 'package:bidgrab/providers/theme.dart';
import 'package:bidgrab/screens/products/productView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.item});

  final Item item;

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image(
              image: AssetImage("images/items/${item.image}"),
              fit: BoxFit.fitWidth,
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
                        item.title,
                        style: const TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        item.category,
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 16),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Last bid",
                            style: TextStyle(fontSize: 20),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                            decoration: BoxDecoration(
                                color: value.darkModeEnabled
                                    ? Colors.white10
                                    : Colors.blueGrey.shade50,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8)),
                                border: Border.all(
                                    color: value.darkModeEnabled
                                        ? Colors.white10
                                        : Colors.blue.shade100)),
                            child: Text(
                              "Rs. ${item.lastBid}",
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Ending in",
                            style: TextStyle(fontSize: 20),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                            decoration: BoxDecoration(
                                color: value.darkModeEnabled
                                    ? Colors.white10
                                    : Colors.blueGrey.shade50,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8)),
                                border: Border.all(
                                    color: value.darkModeEnabled
                                        ? Colors.white10
                                        : Colors.blue.shade100)),
                            child: Text(
                              "${item.endingIn} left",
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    Productview.id,
                                    arguments: item,
                                  );
                                },
                                child: const Text(
                                  "View Auction",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              FilledButton(
                                onPressed: () {},
                                child: const Text(
                                  "Bid",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                      )
                      : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
