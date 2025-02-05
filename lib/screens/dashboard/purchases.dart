import 'package:bidgrab/controllers/order_controller.dart';
import 'package:bidgrab/models/order.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class Purchases extends StatefulWidget {
  const Purchases({super.key});

  static String id = "/purchases";

  @override
  State<Purchases> createState() => _PurchasesState();
}

class _PurchasesState extends State<Purchases> {
  late Future<List<Order>> futureOrders;

  @override
  void initState() {
    futureOrders = OrderController.fetchOrders(http.Client());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My purchases"),
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
            future: futureOrders,
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
                        const Text("No purchases found!"),
                      ],
                    ),
                  );
                } else {
                  List<Order> purchases = snapshot.data!;
                  return Column(
                    children: purchases
                        .map((purchase) => Card(
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                              ),
                              elevation: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: ExpansionTile(
                                  title: purchase.auction != null
                                      ? Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Image.network(
                                              purchase.auction!.images![0],
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
                                                    purchase.auction!.title!
                                                                .length >
                                                            30
                                                        ? '${purchase.auction!.title!.substring(0, 30)}...'
                                                        : purchase.auction!
                                                                .title ??
                                                            "No title",
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                                Text(
                                                    'Rs. ${purchase.auction!.currentPrice!}'),
                                                Text(purchase.status!),
                                              ],
                                            )
                                          ],
                                        )
                                      : const Text("No data"),
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: purchase.status == "pending"
                                          ? ElevatedButton(
                                              onPressed: () {},
                                              child: const Text("Pay now"),
                                            )
                                          : Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                    "Delivery information"),
                                                Text(
                                                    "Address line1: ${purchase.address?.line1 ?? 'N/A'}"),
                                                Text(
                                                    "Address line2: ${purchase.address?.line2 ?? 'N/A'}"),
                                                Text(
                                                    "City: ${purchase.address?.city ?? 'N/A'}"),
                                                Text(
                                                    "Postal code: ${purchase.address?.postalCode ?? 'N/A'}"),
                                                Text(
                                                    "Country: ${purchase.address?.country ?? 'N/A'}"),
                                                Text(
                                                    "Phone: ${purchase.address?.phone ?? 'N/A'}"),
                                              ],
                                            ),
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
