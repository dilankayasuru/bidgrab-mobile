import 'package:bidgrab/screens/mainLayout.dart';
import 'package:flutter/material.dart';

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
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: "Inter"
      ),
      home: const MainLayOut(),
    );
  }
}
