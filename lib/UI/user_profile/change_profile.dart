import 'dart:math';

import 'package:custom_clippers/custom_clippers.dart';
import 'package:firbasesignin/Services/session_manage.dart';
import 'package:firbasesignin/UI/utills/IconandTextfiled.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ChangeProfile extends StatefulWidget {
  const ChangeProfile({super.key});

  @override
  State<ChangeProfile> createState() => _ChangeProfileState();
}

class _ChangeProfileState extends State<ChangeProfile> {
  TextEditingController _phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final ref = FirebaseDatabase.instance.ref('User');
    final auth = FirebaseAuth.instance;
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Profile'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: StreamBuilder(
              stream: ref.child(SessionContoller().userId.toString()).onValue,
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData) {
                  Map<dynamic, dynamic> map = snapshot.data.snapshot.value;
                  return Column(
                    children: [
                      Stack(children: [
                        ClipPath(
                          //clipper: DirectionalWaveClipper(verticalPosition: VerticalPosition.bottom,horizontalPosition: HorizontalPosition.left),
                          clipper: SinCosineWaveClipper(),
                          child: Container(
                            height: 160,
                            padding: EdgeInsets.all(20),
                            color: Colors.redAccent,
                            alignment: Alignment.center,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Upload Image',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 35,
                          right: 50,
                          child: Container(
                              width: 125,
                              height: 125,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(75),
                                color: Colors.grey.shade100,
                                border: Border.all(
                                    color: Colors.redAccent, width: 3),
                                boxShadow: [
                                  const BoxShadow(
                                    offset: Offset(-30, -30),
                                    blurRadius: 60,
                                    color: Colors.white,
                                  ),
                                  BoxShadow(
                                    offset: Offset(20, 20),
                                    blurRadius: 60,
                                    color: Colors.grey.shade700,
                                  ),
                                ],
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.red.shade100,
                                child: Text('Image'),
                                radius: 15,
                              )),
                        ),
                        Positioned(
                            top: 120,
                            right: 50,
                            child: InkWell(
                              onTap: () {
                                _showBottomSheet(context);
                              },
                              child: const CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.add_a_photo,
                                    color: Colors.redAccent,
                                  )),
                            ))
                      ]),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            TextFormField(
                              onSaved: (input) => map['email'] = input ?? '',
                              validator: null,
                             
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.email,
                                  color: Colors.red,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                hintText: "eg.Jay@gmail.com",
                                label: const Text(
                                  'Email',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              onSaved: null,
                              validator: null,
                              initialValue: map['username'].toString(),
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.person,
                                  color: Colors.red,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                hintText: "eg.Jayesh panchasara",
                                label: const Text(
                                  'User Name',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _phone,
                              onSaved: (input) => map['phoneNumber'] = input ?? '',
                              validator: null,
                              
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.phone,
                                  color: Colors.red,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                hintText: "eg.+91 8980659780",
                                label: const Text(
                                  'Phone Number',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              onSaved: (input) => map['about'] = input ?? '',
                              validator: null,
                              
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.more,
                                  color: Colors.red,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                hintText: "Hey! I am using social media app",
                                label: const Text(
                                  'About',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: InkWell(
                          onTap: () {
                            print('Save Changes');
                          },
                          child: Container(
                              width: double.infinity,
                              height: 60,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.red.shade200, width: 5),
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.grey.shade100,
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(-20, -20),
                                    blurRadius: 60,
                                    color: Colors.white,
                                  ),
                                  BoxShadow(
                                    offset: Offset(20, 20),
                                    blurRadius: 60,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.save),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      'Save Changes',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              )),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Center(
                    child: Text(
                  'SomeThing went wrong time',
                  style: Theme.of(context).textTheme.subtitle1,
                ));
                }
              })),
    );
  }
}

void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      builder: (_) {
        return ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(top: 10, bottom: 10),
          children: [
            const Text(
              'Pick Profile Picture',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Divider(
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 3,
                        backgroundColor: Colors.white,
                        shape: const CircleBorder(),
                        fixedSize: Size(100, 100)),
                    onPressed: () async {
                      print('camera');
                    },
                    child: Image.asset('icon/camera.png')),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 3,
                        backgroundColor: Colors.white,
                        shape: const CircleBorder(),
                        fixedSize: Size(100, 100)),
                    onPressed: () async {
                      print('picture');
                    },
                    child: Image.asset('icon/picture.png')),
              ],
            )
          ],
        );
      });
}
