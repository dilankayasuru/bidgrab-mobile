import 'package:bidgrab/models/auction.dart';
import 'package:bidgrab/screens/products/products.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../controllers/auction_controller.dart';
import '../home/components/AuctionsSlider.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  static String id = '/product';

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  late Future<Auction> futureAuction;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final auctionId = ModalRoute.of(context)!.settings.arguments as String;
    futureAuction = AuctionController.fetchAuction(http.Client(), auctionId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Auction>(
        future: futureAuction,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No data available'));
          }

          Auction auction = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, Products.id);
                },
                icon: const Icon(Icons.arrow_back),
              ),
              centerTitle: true,
              title: Text(auction.title ?? 'No Data'),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 3,
                    child: Swiper(
                      outer: false,
                      itemCount: auction.images!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Image(
                          image: NetworkImage(auction.images![index]),
                          fit: BoxFit.cover,
                        );
                      },
                      autoplay: true,
                      autoplayDisableOnInteraction: true,
                      control: null,
                      pagination: const SwiperPagination(
                        alignment: Alignment.bottomCenter,
                        builder: DotSwiperPaginationBuilder(
                          color: Colors.black12,
                          activeColor: Colors.white70,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          auction.title ?? "No data",
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          auction.categoryName ?? 'No data',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Rs. ${auction.currentPrice ?? "No data"}',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                            color: Colors.blue.withOpacity(0.10),
                          ),
                          child: Text(
                            '${auction.bidCount ?? 0} Bids',
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                            color: Colors.blue.withOpacity(0.10),
                          ),
                          child: Text(
                            auction.title!.length > 30
                                ? '${auction.title?.substring(0, 30)}...'
                                : auction.title ?? "No title",
                            style: const TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            border: const Border(
                              bottom: BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                          ),
                          child: const Text(
                            'Condition: New',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            border: const Border(
                              bottom: BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                          ),
                          child: Text(
                            'Duration: ${auction.duration ?? "No data"} days',
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            border: const Border(
                              bottom: BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                          ),
                          child: Text(
                            'Started date: ${auction.startingDate}',
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            border: const Border(
                              bottom: BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                          ),
                          child: const Text(
                            'Seller: Dilanka Yasuru',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          "Description",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          auction.description ?? "No data",
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        AuctionsSlider(
                          url: 'categories/${auction.categoryId}',
                          child: const Text(
                            'You might also like',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w600),
                          ),
                        ),
                        const SizedBox(
                          height: 64,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            bottomSheet: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              child: FilledButton(
                onPressed: () {},
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                  ),
                ),
                child: const Text(
                  "Place bid",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          );
        });
  }
}
