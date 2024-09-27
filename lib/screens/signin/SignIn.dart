import 'package:bidgrab/components/CurvedBottomContainer.dart';
import 'package:bidgrab/screens/signup/SignUp.dart';
import 'package:flutter/material.dart';

class Signin extends StatelessWidget {
  const Signin({super.key});

  static String id = 'signin';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.white,),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CurvedBottomContainer(
              child: Container(
                width: double.infinity,
                color: Colors.blue,
                child: const Column(
                  children: [
                    Text(
                      "BidGrab",
                      style: TextStyle(
                        fontSize: 56,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                        textAlign: TextAlign.center,
                        "Bid, Win, and Save Big on Unique Items!",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 72,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 64,),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(64)),
                      ),
                      label: Text("Email"),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(64)),
                      ),
                      label: Text("Password"),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  FilledButton(
                    onPressed: () {},
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 8),
                      child: const Text(
                        textAlign: TextAlign.center,
                        "Sign in",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 64,),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, Signup.id);
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "Sign up",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
