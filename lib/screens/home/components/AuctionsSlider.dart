import 'package:bidgrab/components/auctionCard.dart';
import 'package:bidgrab/controllers/auction_controller.dart';
import 'package:bidgrab/models/auction.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuctionsSlider extends StatefulWidget {
  const AuctionsSlider({super.key, required this.url, required this.child});

  final String url;
  final Widget child;

  @override
  State<AuctionsSlider> createState() => _AuctionsSliderState();
}

class _AuctionsSliderState extends State<AuctionsSlider> {
  late Future<List<Auction>> futureAuctions;

  @override
  void initState() {
    super.initState();
    futureAuctions = AuctionController.fetchAuctions(http.Client(), widget.url);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.child,
        const SizedBox(
          height: 16,
        ),
        SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 0, 0, 16),
          scrollDirection: Axis.horizontal,
          child: FutureBuilder<List<Auction>>(
            future: futureAuctions,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text('An error has occurred!'),
                );
              } else if (snapshot.hasData) {
                List<Auction> auctions = snapshot.data!;
                return Row(
                    children: auctions.map((auction) {
                  return AuctionCard(auction: auction);
                }).toList());
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
