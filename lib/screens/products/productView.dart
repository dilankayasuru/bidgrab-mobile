import 'package:bidgrab/models/item.dart';
import 'package:flutter/material.dart';

class Productview extends StatelessWidget {
  const Productview({super.key});

  // Static variable to hold the route name
  static String id = '/product';

  @override
  Widget build(BuildContext context) {
    // Retrieve the item passed as an argument
    final args = ModalRoute.of(context)!.settings.arguments as Item;

    return Scaffold(
      appBar: AppBar(
        // Button to navigate back to the previous screen
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        // Display the item title in the app bar
        title: Text(args.title),
      ),
      body: SingleChildScrollView(
        // Display content based on the device orientation
        child: MediaQuery.of(context).orientation == Orientation.portrait
            ? Column(
                children: [
                  // Display the item image
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 3,
                    child: Image(
                      image: AssetImage('images/items/${args.image}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Display the item category
                        Text(
                          args.category,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                        // Display the item title
                        Text(
                          args.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        // Display the last bid amount and the time remaining
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Last bid:\nRs. ${args.lastBid}',
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'Ending in\n${args.endingIn}',
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        // Display the item description
                        const Text(
                          "Description",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          args.description,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 72,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Display the item image
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height,
                    child: Image(
                      image: AssetImage('images/items/${args.image}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Display the item category
                        Text(
                          args.category,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                        // Display the item title
                        Text(
                          args.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        // Display the last bid amount and the time remaining
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Last bid:\nRs. ${args.lastBid}',
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Text(
                              'Ending in\n${args.endingIn}',
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        // Display the item description
                        const Text(
                          "Description",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          constraints: BoxConstraints(maxWidth: 320),
                          child: Text(
                            args.description,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 72,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
      // Bottom sheet to display the last bid amount and a bid button
      bottomSheet: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Rs. ${args.lastBid}',
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            FilledButton(
              onPressed: () {},
              child: const Text(
                "Bid",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}