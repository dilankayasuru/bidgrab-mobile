import 'package:bidgrab/screens/home/components/HomeCategories.dart';
import 'package:bidgrab/screens/home/components/HomeHero.dart';
import 'package:bidgrab/screens/home/components/RecentAuctions.dart';
import 'package:flutter/material.dart';

import '../../item.dart';
import 'components/CategoryTab.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("BidGrab",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Inter",
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
                fontSize: 24)),
        actions: [
          Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
            margin: const EdgeInsets.only(right: 16),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.person,
                  color: Colors.blue,
                )),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeHero(),
              HomeCategories(
                categories: const [
                  CategoryTab(
                    image: AssetImage("images/categories/electronic.png"),
                    name: "Electronics",
                  ),
                  CategoryTab(
                    image: AssetImage("images/categories/jewellery.png"),
                    name: "Jewelry & Accessories",
                  ),
                  CategoryTab(
                    image: AssetImage("images/categories/mobile.png"),
                    name: "Mobile phones",
                  ),
                  CategoryTab(
                    image: AssetImage("images/categories/computer.png"),
                    name: "Computers",
                  ),
                  CategoryTab(
                    image: AssetImage("images/categories/home-appliances.png"),
                    name: "Home Appliances",
                  ),
                  CategoryTab(
                    image: AssetImage("images/categories/clothing.png"),
                    name: "Clothing",
                  ),
                  CategoryTab(
                    image: AssetImage("images/categories/furniture.png"),
                    name: "Furniture",
                  ),
                  CategoryTab(
                    image: AssetImage("images/categories/artwork.png"),
                    name: "Artworks",
                  ),
                  // CategoryTab(
                  //   image: AssetImage("images/categories/shoe.png"),
                  //   name: "Shoes",
                  // ),
                  // CategoryTab(
                  //   image: AssetImage("images/categories/automotive.png"),
                  //   name: "Automotive",
                  // ),
                  // CategoryTab(
                  //   image: AssetImage("images/categories/grocery.png"),
                  //   name: "Grocery",
                  // ),
                  // CategoryTab(
                  //   image: AssetImage("images/categories/other.png"),
                  //   name: "Other",
                  // ),
                ],
              ),
              RecentAuctions(
                items: [
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
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
