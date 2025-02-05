import 'package:bidgrab/models/auction.dart';

class Address {
  final String? city;
  final String? country;
  final String? line1;
  final String? line2;
  final String? postalCode;
  final String? phone;

  const Address({
    this.city,
    this.country,
    this.line1,
    this.line2,
    this.postalCode,
    this.phone,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      city: json['city'] as String?,
      country: json['country'] as String?,
      line1: json['line1'] as String?,
      line2: json['line2'] as String?,
      postalCode: json['postal_code'] as String?,
      phone: json['phone'] as String?,
    );
  }
}

class Order {
  final String? payment;
  final String? status;
  final String? auctionId;
  final String? updatedAt;
  final String? createdAt;
  final String? userId;
  final Address? address;
  final String? id;
  final Auction? auction;

  const Order({
    this.payment,
    this.status,
    this.auctionId,
    this.updatedAt,
    this.createdAt,
    this.userId,
    this.address,
    this.id,
    this.auction,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      payment: json['payment'] as String?,
      status: json['status'] as String?,
      auctionId: json['auction_id'] as String?,
      updatedAt: json['updated_at'] as String?,
      createdAt: json['created_at'] as String?,
      userId: json['user_id'] as String?,
      address: json['address'] != null
          ? Address.fromJson(json['address'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      auction: json['auction'] != null
          ? Auction.fromJson(json['auction'] as Map<String, dynamic>)
          : null,
    );
  }
}
