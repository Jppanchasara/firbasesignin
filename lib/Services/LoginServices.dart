
import 'package:firbasesignin/Services/session_manage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../UI/HomeScreen.dart';

class loginServices {
  void Login(
      String emailcontorller, String passwordcontroller) async {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailcontorller, password: passwordcontroller)
        .then((value) {
          SessionContoller().userId=value.user!.uid.toString();
      
     
      Get.to(HomeScreen(value: emailcontorller.toString(),));
      Get.snackbar('Hello', 'login scussefully');
    }).onError((error, stackTrace) {
      
      Get.snackbar('Login failed', error.toString());
    });
  }
}
