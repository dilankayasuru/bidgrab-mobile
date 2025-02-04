import 'dart:async';
import 'dart:convert';
import 'package:bidgrab/config.dart';
import 'package:http/http.dart' as http;
import '../models/auction.dart';
import 'package:flutter/foundation.dart' as foundation;

class AuctionController {
  static Future<List<Auction>> fetchAuctions(http.Client client, url) async {
    final response = await client.get(Uri.parse('${Config.APP_URL}/api/$url'));
    return foundation.compute(_parseAuctions, response.body);
  }

  static List<Auction> _parseAuctions(String responseBody) {
    final parsedJson = jsonDecode(responseBody);

    List<dynamic> auctionsList;
    if (parsedJson is Map<String, dynamic>) {
      auctionsList = parsedJson['auctions'] ?? [];
    } else if (parsedJson is List) {
      auctionsList = parsedJson;
    } else {
      throw Exception('Unexpected response format');
    }

    return auctionsList
        .cast<Map<String, dynamic>>()
        .map<Auction>((json) => Auction.fromJson(json))
        .toList();
  }

  static Future<Auction> fetchAuction(http.Client client, id) async {
    final response =
        await client.get(Uri.parse('${Config.APP_URL}/api/auctions/$id'));
    final auctionDecode = jsonDecode(response.body) as Map<String, dynamic>;
    return Auction.fromJson(auctionDecode);
  }
}
