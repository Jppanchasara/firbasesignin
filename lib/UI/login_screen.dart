// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously, unrelated_type_equality_checks

import 'dart:developer';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firbasesignin/Services/LoginServices.dart';
import 'package:firbasesignin/UI/HomeScreen.dart';
import 'package:firbasesignin/UI/forgot_password.dart';
import 'package:firbasesignin/UI/login_with_phone.dart';
import 'package:firbasesignin/UI/register_screen.dart';
import 'package:firbasesignin/UI/utills/ReuseButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Map<String, dynamic>? _userData;
  String welcome = "Facebook";

  bool changeButton = false;
  bool passwordSeen = true;
  bool check = false;

  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();
  loginServices LoginService = loginServices();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                'Hello again!👋',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.red[700],
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Welcome back you've been missed!",
                style: TextStyle(fontSize: 15, color: Colors.grey[500]),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: email,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Email cannot be empty";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    hintText: "Email",
                    fillColor: const Color.fromARGB(255, 241, 247, 252),
                    filled: true,
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          email.clear();
                        });
                      },
                      child: Icon(
                        Icons.close,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          style: BorderStyle.solid,
                          color: Colors.red.shade700,
                          width: 2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.grey.shade200))),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: password,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password canot be empty";
                  } else if (value.length < 6) {
                    return "password length should atleast 6";
                  }
                  return null;
                },
                obscureText: passwordSeen,
                obscuringCharacter: '*',
                // inputFormatters: [
                //   FilteringTextInputFormatter.digitsOnly
                // ],
                decoration: InputDecoration(
                    hintText: "Password",
                    fillColor: const Color.fromARGB(255, 241, 247, 252),
                    filled: true,
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          passwordSeen = !passwordSeen;
                        });
                      },
                      child: passwordSeen
                          ? Icon(
                              Icons.visibility_off,
                              color: Colors.grey.shade400,
                            )
                          : Icon(
                              Icons.visibility,
                              color: Colors.grey.shade400,
                            ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          style: BorderStyle.solid,
                          color: Colors.red.shade700,
                          width: 2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.grey.shade200))),
              ),
              const SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPasswordScreen()));
                  },
                  child: Text(
                    "Forgot Password ?",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.red[700],
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.disabled)) {
                          return Colors.red.withOpacity(.32);
                        }
                        return Colors.grey;
                      }),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      visualDensity: VisualDensity.adaptivePlatformDensity,
                      value: check,
                      onChanged: (value) {
                        setState(() {
                          check = !check;
                        });
                      }),
                  const Text(
                    "I agree to the ",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text("Panama Tearms ",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.red[700],
                            fontWeight: FontWeight.bold)),
                  )
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Align(
                alignment: Alignment.center,
                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                  child: InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        LoginService.Login(
                            email.text.toString(), password.text.toString());
                      }
                    },
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      height: 50,
                      width: double.infinity,
                      child: const Center(
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 160,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey.shade500),
                      ),
                    ),
                  ),
                  Text("  OR  ",
                      style: TextStyle(fontSize: 15, color: Colors.grey[900])),
                  Container(
                    width: 160,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey.shade900),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Don't have an account?",
                        style:
                            TextStyle(fontSize: 15, color: Colors.grey[500])),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterScreen()));
                        },
                        child: Text("REGISTER",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.red[700],
                                fontWeight: FontWeight.bold)))
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginWithPhoneNumber()));
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        width: 2,
                        color: Colors.red,
                      )),
                  child: const Center(
                      child: Text(
                    'Login with Phone Number',
                    style: TextStyle(fontSize: 15),
                  )),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ReuseButton(
                  url: '',
                  title: "Google",
                  ontap: () {
                    SignInGoogle();
                  }),
              const SizedBox(
                height: 15,
              ),
              ReuseButton(
                  url: '',
                  title: "FaceBook",
                  ontap: () {
                    signInWithFacebook();
                  })
            ],
          ),
        ),
      ),
    ));
  }

  // facebookLogin() async {
  //   print("FaceBook");
  //   try {
  //     final result =
  //         await FacebookAuth.i.login(permissions: ['public_profile', 'email']);
  //     if (result.status == LoginStatus.success) {
  //       final userData = await FacebookAuth.i.getUserData();
  //        Get.snackbar('Hello', 'login scussefully');
  //       Navigator.push(
  //           context, MaterialPageRoute(builder: (context) => HomeScreen(value: userData['email'].toString())));
  //       print(userData);
  //     }
  //   } catch (error) {
  //     Get.snackbar('Error', error.toString());
  //   }
  // }

 Future<UserCredential> signInWithFacebook() async {

    final LoginResult result = await FacebookAuth.instance.login(permissions:['email']);


    if (result.status == LoginStatus.success) {

      final userData = await FacebookAuth.instance.getUserData();
         Get.snackbar('Hello', 'login scussefully');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen(value: userData['email'].toString())));
        print(userData);
      _userData = userData;
    } else {
      print(result.message);
    }

    setState(() {
      welcome = _userData?['email'];
    });


    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(result.accessToken!.token);

    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }



  SignInGoogle() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    print(userCredential.user?.email);
    print(userCredential.user?.phoneNumber);
    if (userCredential.user != Null) {
       Get.snackbar('Hello', 'login scussefully');
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen(value: userCredential.user?.email.toString())));
    }
  }
}
