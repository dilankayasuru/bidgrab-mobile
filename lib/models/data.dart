import 'package:bidgrab/models/category.dart';
import 'package:bidgrab/models/item.dart';

class DataModel {
  List<Item> items = [
    Item(
      title: 'Sofa set',
      category: 'Furniture',
      lastBid: 150450.00,
      endingIn: '4d 1h',
      image: 'sofa.jpg',
      description:
          'A luxurious and modern sofa set featuring plush cushions and premium fabric upholstery. The set includes a three-seater, a loveseat, and a single chair, all designed for maximum comfort and style. Ideal for a contemporary living room, this sofa set offers a spacious seating area and a chic look that complements any home décor.',
    ),
    Item(
      title: 'IPhone 15',
      category: 'Mobile Phone',
      lastBid: 250000.00,
      endingIn: '6d 4h',
      image: 'iphone.jpg',
      description:
          'The latest model in Apples iPhone series, the iPhone 15 boasts cutting-edge technology with a sleek design. Featuring an advanced camera system, powerful A16 Bionic chip, and vibrant Super Retina XDR display, it provides a superior user experience. Equipped with 5G capability and extended battery life, the iPhone 15 is perfect for tech enthusiasts and professionals alike.',
    ),
    Item(
      title: 'Macbook Air',
      category: 'Computer',
      lastBid: 250000.00,
      endingIn: '3d 5h',
      image: 'laptop.jpg',
      description:
          "This ultra-lightweight MacBook Air is powered by the Apple M2 chip, offering a significant performance boost while maintaining exceptional power efficiency. With a stunning 13.6-inch Retina display and a fanless design for silent operation, it’s perfect for both creative professionals and casual users who value portability and power",
    ),
    Item(
      title: 'Sport shoes',
      category: 'Shoe',
      lastBid: 7500.00,
      endingIn: '1d 3h',
      image: 'shoe.jpg',
      description:
          "High-performance sport shoes designed for athletes and fitness enthusiasts. Made from breathable material, these shoes provide excellent support and traction, making them ideal for running, training, or casual wear. The ergonomic design ensures comfort, while the durable sole is built to withstand rigorous activity.",
    ),
    Item(
      title: 'Over size t-shirt',
      category: 'Clothing',
      lastBid: 1540.00,
      endingIn: '1h 2m',
      image: 'tshirt.jpg',
      description:
          "Trendy and comfortable oversized T-shirt crafted from soft, high-quality cotton. Perfect for a relaxed, casual look, it features a loose fit that pairs well with jeans, shorts, or leggings. Available in various colors, this T-shirt is a versatile wardrobe essential that blends style with comfort.",
    ),
  ];

  List<Category> categories = const [
    Category(
        image: "electronic.png",
        name: "Electronics",
        id: 'asdd',
        description: 'dummy'),
    Category(
        image: "jewellery.png",
        name: "Jewelry & Accessories",
        id: 'asdd',
        description: 'dummy'),
    Category(
        image: "mobile.png",
        name: "Mobile phones",
        id: 'asdd',
        description: 'dummy'),
    Category(
        image: "computer.png",
        name: "Computers",
        id: 'asdd',
        description: 'dummy'),
    Category(
        image: "home-appliances.png",
        name: "Home Appliances",
        id: 'asdd',
        description: 'dummy'),
    Category(
        image: "clothing.png",
        name: "Clothing",
        id: 'asdd',
        description: 'dummy'),
    Category(
        image: "furniture.png",
        name: "Furniture",
        id: 'asdd',
        description: 'dummy'),
    Category(
        image: "artwork.png",
        name: "Artworks",
        id: 'asdd',
        description: 'dummy'),
    Category(
        image: "shoe.png", name: "Shoes", id: 'asdd', description: 'dummy'),
    Category(
        image: "automotive.png",
        name: "Automotive",
        id: 'asdd',
        description: 'dummy'),
    Category(
        image: "grocery.png",
        name: "Grocery",
        id: 'asdd',
        description: 'dummy'),
    Category(
        image: "other.png", name: "Other", id: 'asdd', description: 'dummy'),
  ];
}
