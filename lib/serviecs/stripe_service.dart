import 'dart:convert';
import 'dart:io';

import 'package:bidgrab/config.dart';
import 'package:bidgrab/models/order.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class StripeService {
  StripeService._();

  static final StripeService instance = StripeService._();

  Future<bool> makePayment(Order order) async {
    var amount = order.auction?.currentPrice;
    try {
      String? paymentIntentClientSecret =
          await _createPaymentIntent(amount, order);
      if (paymentIntentClientSecret == null) {
        return false;
      }
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentClientSecret,
          merchantDisplayName: "BidGrab",
          billingDetailsCollectionConfiguration:
              const BillingDetailsCollectionConfiguration(
            phone: CollectionMode.always,
            name: CollectionMode.always,
            address: AddressCollectionMode.full,
            email: CollectionMode.always,
          ),
        ),
      );
      await _processPayment();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> _processPayment() async {
    try {
      await Stripe.instance.presentPaymentSheet();
    } catch (e) {
      print(e);
    }
  }

  Future<String?> _createPaymentIntent(amount, Order order) async {
    try {
      int amount = (order.auction!.currentPrice! * 100).toInt();
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer ${Config.STRIPE_SECRET_KEY}',
          HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded",
        },
        body: {
          "amount": amount.toString(),
          "currency": "LKR",
          "metadata[auction_id]": order.id.toString(),
          "metadata[order_id]": order.id.toString(),
        },
      );
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse != null) {
        print(jsonResponse);
        return jsonResponse["client_secret"];
      }
      return null;
    } catch (e) {
      print(e);
    }
  }
}
