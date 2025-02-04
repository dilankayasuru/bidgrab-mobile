import 'package:bidgrab/components/auctionCard.dart';
import 'package:bidgrab/controllers/auction_controller.dart';
import 'package:bidgrab/screens/products/components/itemCard.dart';
import 'package:flutter/material.dart';

class AuctionsSlider extends StatefulWidget {
  const AuctionsSlider({super.key, required this.url, required this.child});

  final String url;
  final Widget child;

  @override
  State<AuctionsSlider> createState() => _AuctionsSliderState();
}

class _AuctionsSliderState extends State<AuctionsSlider> {
  final AuctionController _auctionController = AuctionController();

  @override
  void initState() {
    super.initState();
    _auctionController.fetchAuctions(widget.url);
  }

  @override
  void dispose() {
    _auctionController.dispose();
    super.dispose();
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
          child: StreamBuilder(
            stream: _auctionController.auctions,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No auction available'));
              } else {
                final auctions = snapshot.data ?? [];
                return Row(
                    children: auctions.map((auction) {
                  return AuctionCard(auction: auction);
                }).toList());
              }
            },
          ),
        )
      ],
    );
  }
}
