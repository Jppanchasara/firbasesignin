// ignore_for_file: prefer_const_constructors

import 'package:firbasesignin/Services/RegisterServices.dart';
import 'package:firbasesignin/UI/login_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool changeButton = false;
  bool passwordSeen = true;
  bool check = false;
  final _formKey = GlobalKey<FormState>();
  RegisterServices registerServices = RegisterServices();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
    TextEditingController username = TextEditingController();


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
              SizedBox(height: 15,),
              TextFormField(
                controller: username,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "UserName cannot be empty";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    hintText: "UserName",
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
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                        registerServices.Register(
                            email.text.toString(), password.text.toString(),username.text.toString());
                      }
                    },
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      height: 50,
                      width: 400,
                      child: const Center(
                        child: Text(
                          "REGISTER",
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
                      style: TextStyle(fontSize: 15, color: Colors.grey[500])),
                  Container(
                    width: 160,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey.shade500),
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
                    Text("Do have an account?",
                        style:
                            TextStyle(fontSize: 15, color: Colors.grey[500])),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: Text("LOGIN",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.red[700],
                                fontWeight: FontWeight.bold)))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
