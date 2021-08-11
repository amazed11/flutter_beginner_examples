import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter623calculator/screens/online_data/online_user_data_screen.dart';
import 'package:flutter623calculator/screens/online_data/online_weather_data.dart';
import 'package:flutter623calculator/screens/webview/webview_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import 'screens/bottom_navigation/bottom_navigation.dart';
import 'screens/google maps/google_maps_screen.dart';
import 'screens/online_data/online_covid_news_screen.dart';
import 'screens/online_data/online_data_screen.dart';
import 'screens/push notification/push_notification_screen.dart';
import 'screens/signinwithgoogle/signinwithgoogle_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dotenv.load(fileName: ".env");

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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        accentColor: Colors.deepPurpleAccent,
        fontFamily: GoogleFonts.roboto().fontFamily,
      ),
      home: WebviewScreen(),
    );
  }
}
