import 'package:bidgrab/components/CurvedBottomContainer.dart';
import 'package:bidgrab/models/UserProvider.dart';
import 'package:bidgrab/screens/signup/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../profile/profile.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  static String id = 'signin';

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  String error = "";

  void setError(String message) {
    error = message;
  }

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
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
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
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
                  TextField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: const InputDecoration(
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
                  Consumer<Userprovider>(
                    builder: (context, value, child) => FilledButton(
                      onPressed: () {
                        if (!value.login(
                          _emailController.text,
                          _passwordController.text,
                        )) {
                          setState(() {
                            setError("Invalid email or password!");
                          });
                        } else {
                          setState(() {
                            setError("");
                            Navigator.pushNamed(context, Profile.id);
                          });
                        }
                      },
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
                    ),
                  ),
                  Text(
                    error,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.redAccent,
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
