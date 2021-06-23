import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter623calculator/screens/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
            (route) => false);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xffe3203d),
                Colors.redAccent,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.0,
              ),
              FlutterLogo(
                size: 100.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Flutter Journey",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
              Expanded(child: Container()),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(
                  Colors.white,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Powered by Google",
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Version: 1.0.0",
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
