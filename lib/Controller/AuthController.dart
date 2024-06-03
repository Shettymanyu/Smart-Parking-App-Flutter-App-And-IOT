import 'package:car_parking_system/Pages/Auth/LoginPage.dart';
import 'package:car_parking_system/Pages/GoogleMap/GoogleMap.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLogin = false.obs;
  final auth = FirebaseAuth.instance;
  TextEditingController loginEmail = TextEditingController();
  TextEditingController loginPwd = TextEditingController();
  TextEditingController signupEmail = TextEditingController();
  TextEditingController signupName = TextEditingController();
  TextEditingController signupPwd = TextEditingController();
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> loginWithEmailPassword() async {
    isLoading.value = true;
    try {
      await auth.signInWithEmailAndPassword(
        email: loginEmail.text,
        password: loginPwd.text,
      );
      Get.offAll(
        const GoogleMapPage(), // Change the page to the MapPage
        transition: Transition.fadeIn,
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    isLoading.value = false;
  }

  Future<void> signUpWithEmailPassword() async {
    isLoading.value = true;
    try {
      await auth.createUserWithEmailAndPassword(
        email: signupEmail.text,
        password: signupPwd.text,
      );
      Get.offAll(
        const GoogleMapPage(), // Change the page to the MapPage
        transition: Transition.fadeIn,
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    isLoading.value = false;
  }

  // Future<void> signInWithGoogle() async {
  //   isLoading.value = true;
  //   try {
  //     final GoogleSignInAccount googleSignInAccount =
  //         await _googleSignIn.signIn();
  //     final GoogleSignInAuthentication googleSignInAuthentication =
  //         await googleSignInAccount.authentication;
  //     final AuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleSignInAuthentication.accessToken,
  //       idToken: googleSignInAuthentication.idToken,
  //     );
  //     await auth.signInWithCredential(credential);
  //     Get.offAll(
  //       GoogleMapPage(), // Change the page to the MapPage
  //       transition: Transition.fadeIn,
  //     );
  //   } catch (e) {
  //     Get.snackbar(
  //       "Error",
  //       e.toString(),
  //       snackPosition: SnackPosition.BOTTOM,
  //     );
  //   }
  //   isLoading.value = false;
  // }

  Future<void> signOut() async {
    auth.signOut();
    Get.offAll(const LoginPage());
  }
}
