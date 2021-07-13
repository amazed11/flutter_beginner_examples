import 'package:flutter/material.dart';
import 'package:flutter623calculator/screens/signinwithgoogle/controllers/googlesignin_controller.dart';
import 'package:get/get.dart';

class GoogleSigninScreen extends StatelessWidget {
  GoogleSigninScreen({Key? key}) : super(key: key);
  final GoogleSignInController googleSignInController =
      Get.put(GoogleSignInController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black87,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  onPressed: () {
                    googleSignInController.login();
                  },
                  icon: Icon(Icons.lock),
                  label: Text("Sign in with google"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
