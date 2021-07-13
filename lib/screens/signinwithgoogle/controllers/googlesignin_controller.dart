import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter623calculator/screens/signinwithgoogle/googlesignin_home_screen.dart';
import 'package:flutter623calculator/screens/signinwithgoogle/signinwithgoogle_screen.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInController extends GetxController {
  var isLogin = false.obs;
  late GoogleSignIn googleSignIn;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void onInit() {
    // TODO: implement onInit
    googleSignIn = GoogleSignIn();
    ever(isLogin, handleAuth);
    isLogin.value = firebaseAuth.currentUser != null;
    firebaseAuth.authStateChanges().listen((event) {
      isLogin(event != null);
    });
    super.onInit();
  }

  void handleAuth(isLogin) async {
    if (isLogin) {
      Get.offAll(() => GoogleSignInHomeScreen());
    } else {
      Get.offAll(() => GoogleSigninScreen());
    }
  }

  void logout() async {
    await googleSignIn.disconnect();
    await firebaseAuth.signOut();
  }

  void login() async {
    Get.defaultDialog(
        title: "Logging please wait...",
        content: Container(child: CircularProgressIndicator()));
    GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    if (googleSignIn == null) {
      Get.back();
    } else {
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      OAuthCredential oAuthCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await firebaseAuth.signInWithCredential(oAuthCredential);
      Get.back();
    }
  }
}
