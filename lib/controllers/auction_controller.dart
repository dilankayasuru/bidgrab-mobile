import 'dart:async';
import 'dart:convert';
import 'package:bidgrab/config.dart';
import 'package:http/http.dart' as http;
import '../models/auction.dart';

class AuctionController {
  final StreamController<List<Auction>> _auctionController =
      StreamController<List<Auction>>();

  Stream<List<Auction>> get auctions => _auctionController.stream;

  Future<void> fetchAuctions(String url) async {
    final response = await http.get(Uri.parse('${Config.APP_URL}/api/$url'));

    if (response.statusCode == 200) {
      var data =  jsonDecode(response.body);
      List<Auction> auctions = (data as List)
          .map<Auction>((auction) => Auction(
                title: auction['title'] ?? '',
                description: auction['description'] ?? '',
                images: List<String>.from(auction['images'] ?? []),
                category_id: auction['category_id'] ?? '',
                condition: auction['condition'] ?? '',
                duration:
                    int.tryParse(auction['duration']?.toString() ?? '') ?? 0,
                starting_date: DateTime.parse(auction['starting_date']),
                starting_price:
                    (auction['starting_price'] as num?)?.toDouble() ?? 0.0,
                current_price:
                    (auction['current_price'] as num?)?.toDouble() ?? 0.0,
                bid_count: auction['bid_count'] as int? ?? 0,
                specs: auction['specs'] is Map<String, dynamic>
                    ? (auction['specs'] as Map<String, dynamic>)
                    : <String, dynamic>{},
                end_date: DateTime.parse(auction['end_date']),
                status: auction['status'] ?? '',
                updated_at: auction['updated_at'] != null
                    ? DateTime.parse(auction['updated_at'])
                    : null,
                created_at: auction['created_at'] != null
                    ? DateTime.parse(auction['created_at'])
                    : null,
                user_id: auction['user_id'],
                highest_bid: auction['highest_bid'],
                id: auction['id'],
                categoryName: auction['categoryName'],
              ))
          .toList();
      _auctionController.add(auctions);
    } else {
      throw ('Failed to load auctions');
    }
  }

  static Future<Auction> fetchAuctionById(String id) async {
    final response =
        await http.get(Uri.parse('${Config.APP_URL}/api/auctions/$id'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return Auction(
        title: data['title'] ?? '',
        description: data['description'] ?? '',
        images: List<String>.from(data['images'] ?? []),
        category_id: data['category_id'] ?? '',
        condition: data['condition'] ?? '',
        duration: int.tryParse(data['duration']?.toString() ?? '') ?? 0,
        starting_date: DateTime.parse(data['starting_date']),
        starting_price: (data['starting_price'] as num?)?.toDouble() ?? 0.0,
        current_price: (data['current_price'] as num?)?.toDouble() ?? 0.0,
        bid_count: data['bid_count'] as int? ?? 0,
        specs: data['specs'] is Map<String, dynamic>
            ? (data['specs'] as Map<String, dynamic>)
            : <String, dynamic>{},
        end_date: DateTime.parse(data['end_date']),
        status: data['status'] ?? '',
        updated_at: data['updated_at'] != null
            ? DateTime.parse(data['updated_at'])
            : null,
        created_at: data['created_at'] != null
            ? DateTime.parse(data['created_at'])
            : null,
        user_id: data['user_id'],
        highest_bid: data['highest_bid'],
        id: data['id'],
        categoryName: data['categoryName'],
      );
    } else {
      throw ('Failed to load auction');
    }
  }

  void dispose() {
    _auctionController.close();
  }
}
