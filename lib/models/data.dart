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
    ),
    Item(
      title: 'IPhone 15',
      category: 'Mobile Phone',
      lastBid: 250000.00,
      endingIn: '6d 4h',
      image: 'iphone.jpg',
    ),
    Item(
      title: 'Macbook Air',
      category: 'Computer',
      lastBid: 250000.00,
      endingIn: '3d 5h',
      image: 'laptop.jpg',
    ),
    Item(
      title: 'Sport shoes',
      category: 'Shoe',
      lastBid: 7500.00,
      endingIn: '1d 3h',
      image: 'shoe.jpg',
    ),
    Item(
      title: 'Over size t-shirt',
      category: 'Clothing',
      lastBid: 1540.00,
      endingIn: '1h 2m',
      image: 'tshirt.jpg',
    ),
  ];

  List<Category> categories = const [
    Category(
      image: "electronic.png",
      name: "Electronics",
    ),
    Category(
      image: "jewellery.png",
      name: "Jewelry & Accessories",
    ),
    Category(
      image: "mobile.png",
      name: "Mobile phones",
    ),
    Category(
      image: "computer.png",
      name: "Computers",
    ),
    Category(
      image: "home-appliances.png",
      name: "Home Appliances",
    ),
    Category(
      image: "clothing.png",
      name: "Clothing",
    ),
    Category(
      image: "furniture.png",
      name: "Furniture",
    ),
    Category(
      image: "artwork.png",
      name: "Artworks",
    ),
    Category(
      image: "shoe.png",
      name: "Shoes",
    ),
    Category(
      image: "automotive.png",
      name: "Automotive",
    ),
    Category(
      image: "grocery.png",
      name: "Grocery",
    ),
    Category(
      image: "other.png",
      name: "Other",
    ),
  ];
}