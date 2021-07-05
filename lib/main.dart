import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'screens/bottom_navigation/bottom_navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        accentColor: Colors.deepPurpleAccent,
        fontFamily: GoogleFonts.roboto().fontFamily,
      ),
      home: DisplayBottomNavigationBar(),
    );
  }
}
