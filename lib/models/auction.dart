import 'package:bidgrab/models/specs.dart';

class Auction {
  final String? title;
  final String? description;
  final List<String>? images;
  final String? categoryId;
  final String? condition;
  final String? duration;
  final String? startingDate;
  final int? startingPrice;
  final int? currentPrice;
  final int? bidCount;
  final Specs? specs;
  final String? endDate;
  final String? status;
  final String? updatedAt;
  final String? createdAt;
  final String? userId;
  final String? highestBid;
  final String? id;
  final String? categoryName;

  const Auction({
    this.title,
    this.description,
    this.images,
    this.categoryId,
    this.condition,
    this.duration,
    this.startingDate,
    this.startingPrice,
    this.currentPrice,
    this.bidCount,
    this.specs,
    this.endDate,
    this.status,
    this.updatedAt,
    this.createdAt,
    this.userId,
    this.highestBid,
    this.id,
    this.categoryName,
  });

  factory Auction.fromJson(Map<String, dynamic> json) {
    return Auction(
      title: json['title'] as String?,
      description: json['description'] as String?,
      images: (json['images'] as List<dynamic>?)?.cast<String>(),
      categoryId: json['category_id'] as String?,
      condition: json['condition'] as String?,
      duration: json['duration'] as String?,
      startingDate: json['starting_date'] as String?,
      startingPrice: json['starting_price'] as int?,
      currentPrice: json['current_price'] as int?,
      bidCount: json['bid_count'] as int?,
      specs: json['specs'] is Map<String, dynamic>
          ? Specs.fromJson(json['specs'] as Map<String, dynamic>)
          : null,
      endDate: json['end_date'] as String?,
      status: json['status'] as String?,
      updatedAt: json['updated_at'] as String?,
      createdAt: json['created_at'] as String?,
      userId: json['user_id'] as String?,
      highestBid: json['highest_bid'] as String?,
      id: json['id'] as String?,
      categoryName: json['categoryName'] as String?,
    );
  }
}
