class Category {
  final String id;
  final String name;
  final String description;
  final String image;

  const Category({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["id"] as String,
      name: json["name"] as String,
      description: json["description"] as String,
      image: json["image"] as String,
    );
  }
}
