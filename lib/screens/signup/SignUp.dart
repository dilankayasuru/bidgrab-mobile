import 'package:flutter/material.dart';
import '../../components/CurvedBottomContainer.dart';
import '../signin/SignIn.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  static String id = '/signup';

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
            const SizedBox(
              height: 64,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(64)),
                            ),
                            label: Text("First name"),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(64)),
                            ),
                            label: Text("Last name"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
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
                        "Sign up",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 64,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, Signin.id);
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "Sign in",
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
