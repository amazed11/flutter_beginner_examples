import 'package:flutter/material.dart';
import 'package:flutter623calculator/screens/home/home_screen.dart';
import 'package:flutter623calculator/screens/splash/splash_screen.dart';
import 'package:flutter623calculator/screens/todo/todo_screen.dart';

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
      ),
      home: TodoScreen(),
    );
  }
}
