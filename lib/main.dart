import 'package:bidgrab/screens/mainLayout.dart';
import 'package:bidgrab/screens/products/productView.dart';
import 'package:bidgrab/screens/signin/SignIn.dart';
import 'package:bidgrab/screens/signup/SignUp.dart';
import 'package:flutter/material.dart';

import 'models/item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BidGarb",
      initialRoute: '/',
      routes: {
        '/': (context) => const MainLayOut(),
        Signup.id: (context) => const Signup(),
        Signin.id: (context) => const Signin(),
        Productview.id: (context) => const Productview(),
      },
      themeMode: ThemeMode.light,
      theme: ThemeData(
        fontFamily: "Inter",
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
    );
  }
}
