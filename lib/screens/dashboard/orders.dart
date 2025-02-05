import 'package:bidgrab/controllers/order_controller.dart';
import 'package:bidgrab/models/order.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  static String id = "/orders";

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
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
        title: const Text("My orders"),
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
                        const Text("No orders found!"),
                      ],
                    ),
                  );
                } else {
                  List<Order> purchases = snapshot.data!;
                  return Column(
                    children: purchases
                        .map((order) => Card(
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                              ),
                              elevation: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: ExpansionTile(
                                  title: order.auction != null
                                      ? Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Image.network(
                                              order.auction!.images![0],
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
                                                    order.auction!.title!
                                                                .length >
                                                            30
                                                        ? '${order.auction!.title!.substring(0, 30)}...'
                                                        : order.auction!
                                                                .title ??
                                                            "No title",
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                                Text(
                                                    'Rs. ${order.auction!.currentPrice!}'),
                                                Text(order.status!),
                                              ],
                                            )
                                          ],
                                        )
                                      : const Text("No data"),
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text("Delivery information"),
                                          Text(
                                              "Address line1: ${order.address?.line1 ?? 'N/A'}"),
                                          Text(
                                              "Address line2: ${order.address?.line2 ?? 'N/A'}"),
                                          Text(
                                              "City: ${order.address?.city ?? 'N/A'}"),
                                          Text(
                                              "Postal code: ${order.address?.postalCode ?? 'N/A'}"),
                                          Text(
                                              "Country: ${order.address?.country ?? 'N/A'}"),
                                          Text(
                                              "Phone: ${order.address?.phone ?? 'N/A'}"),
                                        ],
                                      ),
                                    ),
                                    order.status == "payed"
                                        ? ElevatedButton(
                                            onPressed: () async {
                                              await OrderController.deliver(
                                                  order);
                                              Navigator.pushNamed(context, '/');
                                            },
                                            child: const Text("Deliver now"),
                                          )
                                        : const SizedBox(),
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
