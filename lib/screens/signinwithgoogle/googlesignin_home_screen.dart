import 'package:flutter/material.dart';
import 'package:flutter623calculator/screens/signinwithgoogle/controllers/googlesignin_controller.dart';
import 'package:get/get.dart';

class GoogleSignInHomeScreen extends StatelessWidget {
  GoogleSignInHomeScreen({Key? key}) : super(key: key);
  final GoogleSignInController googleSignInController =
      Get.find<GoogleSignInController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Image.network(
                "${googleSignInController.firebaseAuth.currentUser?.photoURL}"),
            Text(
                "Email :${googleSignInController.firebaseAuth.currentUser?.email} "),
            Text(
                "Name: ${googleSignInController.firebaseAuth.currentUser?.displayName}"),
            ElevatedButton.icon(
                onPressed: () {
                  googleSignInController.logout();
                },
                icon: Icon(Icons.logout),
                label: Text("logout")),
          ],
        ),
      ),
    );
  }
}
