import 'package:bidgrab/models/item.dart';
import 'package:flutter/material.dart';

class Productview extends StatelessWidget {
  const Productview({super.key});
  static String id = '/product';

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as Item;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(args.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(args.category, style: const TextStyle(color: Colors.black, fontSize: 26)),
            const SizedBox(height: 240, child: Text("End"),),
            const SizedBox(height: 240, child: Text("End"),),
            const SizedBox(height: 240, child: Text("End"),),
            const SizedBox(height: 240, child: Text("End"),),
            const SizedBox(height: 240, child: Text("End"),),
            const SizedBox(height: 240, child: Text("End"),),
            const SizedBox(height: 240, child: Text("End"),),
            const SizedBox(height: 240, child: Text("End"),),

          ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.blue,
        width: double.infinity,
        padding: const EdgeInsets.all(32),
        child: Text(args.lastBid.toString()),
      ),
    );
  }
}
