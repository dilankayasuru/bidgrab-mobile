import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        TextButton(
          onPressed: () {},
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
          onPressed: () {},
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
          onPressed: () {},
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
          onPressed: () {},
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
