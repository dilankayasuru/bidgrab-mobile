import 'package:bidgrab/components/CurvedBottomContainer.dart';
import 'package:bidgrab/screens/signin/SignIn.dart';
import 'package:bidgrab/screens/signup/SignUp.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CurvedBottomContainer(
                  child: SizedBox(
                width: double.infinity,
                child: Container(
                  color: Colors.blue,
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: const Column(
                      children: [
                        Image(
                          image: AssetImage("images/onboarding.png"),
                          height: 450,
                        )
                      ],
                    ),
                  ),
                ),
              )),
              Container(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                width: 400,
                child: const Text(
                  "Your Gateway to Exciting Online Auctions",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 26,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: 400,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Text(
                  "Simple, engaging auctions for all. Grab deals and treasures!",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FilledButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Signin.id);
                    },
                    child: const Text(
                      "Sign In",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  FilledButton.tonal(
                      onPressed: () {
                        Navigator.pushNamed(context, Signup.id);
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 18),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
