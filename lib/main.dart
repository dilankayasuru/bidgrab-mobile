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
      themeMode: ThemeMode.light,
      theme: ThemeData(
          fontFamily: "Inter",
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
            onPrimary: Colors.white,
            primary: Colors.black,
          )),
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: const MainLayOut(),
    );
  }
}
