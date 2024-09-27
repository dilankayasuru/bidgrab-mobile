import 'package:bidgrab/models/UserProvider.dart';
import 'package:bidgrab/models/theme.dart';
import 'package:bidgrab/screens/mainLayout.dart';
import 'package:bidgrab/screens/products/productView.dart';
import 'package:bidgrab/screens/profile/profile.dart';
import 'package:bidgrab/screens/signin/SignIn.dart';
import 'package:bidgrab/screens/signup/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/item.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Userprovider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, value, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "BidGarb",
        initialRoute: '/',
        routes: {
          '/': (context) => const MainLayOut(),
          Signup.id: (context) => const Signup(),
          Signin.id: (context) => const Signin(),
          Productview.id: (context) => const Productview(),
          Profile.id: (context) => const Profile(),
        },
        themeMode: value.darkModeEnabled ? ThemeMode.dark : ThemeMode.light,
        // themeMode: ThemeMode.dark,
        theme: ThemeData(
          fontFamily: "Inter",
          useMaterial3: true,
        ),
        darkTheme: ThemeData.dark(
          useMaterial3: true,
        ),
      ),
    );
  }
}
