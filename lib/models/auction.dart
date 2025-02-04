class Auction {
  final String? id;
  final String title;
  final List<String> images;
  final String category_id;
  final String description;
  final String condition;
  final int duration;
  final DateTime starting_date;
  final double starting_price;
  final double current_price;
  final int bid_count;
  final Map<String, dynamic>? specs;
  final DateTime end_date;
  final String status;
  final DateTime? updated_at;
  final DateTime? created_at;
  final String? user_id;
  final String? highest_bid;
  final String? categoryName;

  Auction({
    required this.id,
    required this.title,
    required this.description,
    required this.images,
    required this.category_id,
    required this.condition,
    required this.duration,
    required this.starting_date,
    required this.starting_price,
    required this.current_price,
    required this.bid_count,
    required this.specs,
    required this.end_date,
    required this.status,
    required this.updated_at,
    required this.created_at,
    required this.user_id,
    required this.highest_bid,
    required this.categoryName,
  });

  Auction.create({
    this.id,
    required this.title,
    required this.description,
    required this.images,
    required this.category_id,
    required this.condition,
    required this.duration,
    required this.starting_date,
    required this.starting_price,
    required this.current_price,
    required this.bid_count,
    required this.specs,
    required this.end_date,
    required this.status,
    this.updated_at,
    this.created_at,
    this.user_id,
    this.highest_bid,
    this.categoryName,
  });
}
