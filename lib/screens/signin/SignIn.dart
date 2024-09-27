import 'package:bidgrab/components/CurvedBottomContainer.dart';
import 'package:bidgrab/models/UserProvider.dart';
import 'package:bidgrab/models/theme.dart';
import 'package:bidgrab/screens/signup/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        title: MediaQuery.of(context).orientation == Orientation.portrait
            ? null
            : const Text(
                "Sign in",
                style: TextStyle(color: Colors.white),
              ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MediaQuery.of(context).orientation == Orientation.portrait
                ? Column(
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
                    ],
                  )
                : Container(),
            Container(
              constraints: const BoxConstraints(maxWidth: 400),
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                  // Consumer widget to listen to changes in Userprovider.
                  Consumer<Userprovider>(
                    builder: (context, value, child) => FilledButton(
                      onPressed: () {
                        // Attempt to log in with the provided email and password.
                        if (!value.login(
                          _emailController.text,
                          _passwordController.text,
                        )) {
                          // If login fails, set the error message.
                          setState(() {
                            setError("Invalid email or password!");
                          });
                        } else {
                          // If login is successful, clear the error message
                          // and navigate to the home page.
                          setState(() {
                            setError("");
                            Navigator.pushNamed(context, '/');
                          });
                        }
                      },
                      // Button label.
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                        child: const Text(
                          textAlign: TextAlign.center,
                          "Sign in",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    error,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.redAccent,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? 64
                  : 0,
            ),
            Container(
              constraints: const BoxConstraints(maxWidth: 400),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, Signup.id);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Consumer<ThemeProvider>(
                      builder: (context, value, child) => Text(
                        "Sign up",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color:
                              value.darkModeEnabled ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
