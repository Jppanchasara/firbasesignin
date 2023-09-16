// ignore_for_file: prefer_const_constructors

import 'package:firbasesignin/Services/session_manage.dart';
import 'package:firbasesignin/UI/login_screen.dart';
import 'package:firebase_database/firebase_database.dart';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterServices {
  FirebaseAuth auth=FirebaseAuth.instance;
  DatabaseReference ref=FirebaseDatabase.instance.ref().child("User");
  void Register(String emailcontorller, String passwordcontroller,String username) async {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailcontorller, password: passwordcontroller)
           
        .then((value) {
           SessionContoller().userId=value.user!.uid.toString();
        
        ref.child(value.user!.uid.toString(),).set({
           'uid':value.user!.uid.toString(),
           'email':value.user!.email.toString(),
           'phoneNumber': '',
           'username':username,
           'password':passwordcontroller,
           'emailStats':'noOne',
           'about':'',});
      Get.to(LoginScreen());
      Get.snackbar('Hello', 'Register scussefully');
    }).onError((error, stackTrace) {
      Get.snackbar('Register failed', error.toString());
    });
  }
}
