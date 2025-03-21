import 'package:bidgrab/controllers/order_controller.dart';
import 'package:bidgrab/screens/dashboard/auctions.dart';
import 'package:bidgrab/screens/dashboard/create_new_auction.dart';
import 'package:bidgrab/screens/dashboard/orders.dart';
import 'package:bidgrab/screens/dashboard/purchases.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, Auctions.id);
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                spacing: 8,
                children: [
                  Icon(
                    Icons.gavel,
                    size: 24,
                  ),
                  Text(
                    "My Auctions",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Icon(Icons.arrow_forward_ios_rounded)
            ],
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, Orders.id);
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                spacing: 8,
                children: [
                  Icon(
                    Icons.local_shipping_rounded,
                    size: 24,
                  ),
                  Text(
                    "My Orders",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Icon(Icons.arrow_forward_ios_rounded)
            ],
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, Purchases.id);
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                spacing: 8,
                children: [
                  Icon(
                    Icons.shopping_bag,
                    size: 24,
                  ),
                  Text(
                    "My Purchases",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Icon(Icons.arrow_forward_ios_rounded)
            ],
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, CreateNewAuction.id);
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                spacing: 8,
                children: [
                  Icon(
                    Icons.add,
                    size: 24,
                  ),
                  Text(
                    "Create new auction",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Icon(Icons.arrow_forward_ios_rounded)
            ],
          ),
        ),
      ],
    );
  }
}
