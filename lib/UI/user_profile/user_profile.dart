import 'package:firbasesignin/Services/session_manage.dart';
import 'package:firbasesignin/UI/login_screen.dart';
import 'package:firbasesignin/UI/user_profile/change_profile.dart';
import 'package:firbasesignin/UI/utills/containershdow.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserProfileScreen extends StatefulWidget {
  var valu;
  String phone;
  UserProfileScreen({this.phone = 'Phone ', this.valu = 'Email', super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final ref = FirebaseDatabase.instance.ref('User');
  final auth = FirebaseAuth.instance;
  Future<void> Logout() async {
    await GoogleSignIn().disconnect();
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text('User Profile'),
          backgroundColor: Colors.redAccent,
        ),
        body: StreamBuilder(
            stream: ref.child(SessionContoller().userId.toString()).onValue,
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                
                Map<dynamic, dynamic> map = snapshot.data.snapshot.value;
                return Column(
                
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.valu.toString(),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  map['username'].toString(),
                                  style: const TextStyle(
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
                        top: 60,
                        right: 50,
                        child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.grey.shade100,
                              border:
                                  Border.all(color: Colors.redAccent, width: 3),
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
                            child: const CircleAvatar(
                              radius: 45,
                            )),
                      ),
                    ]),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ContainerShadowButton(
                            icon: Icons.phone,
                            title: map['phoneNumber'].toString(),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          ContainerShadowButton(
                            icon: Icons.email,
                            title: map['email'].toString(),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          ContainerShadowButton(
                            icon: Icons.person,
                            title: map['username'].toString(),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          ContainerShadowButton(
                            icon: Icons.more_time,
                            title: map['about'].toString(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Logout();
                              Get.snackbar(
                                  'LogOut Completed', 'Please, login!');

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            },
                            child: Container(
                                width: 160,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.green.shade100,
                                  // border: Border.all(
                                  //   width: 7,
                                  //   color: Colors.green.shade300
                                  // ),
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
                                child: const Center(
                                    child: Text(
                                  'Log Out',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ))),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context1) => ChangeProfile()));
                            },
                            child: Container(
                                width: 160,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.red.shade100,
                                  // border: Border.all(
                                  //   width: 7,
                                  //   color: Colors.red.shade200
                                  // ),
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
                                child: const Center(
                                    child: Text(
                                  'Change Profile',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ))),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              } else {
                return Center(
                    child: Text(
                  'SomeThing went wrong time',
                  style: Theme.of(context).textTheme.subtitle1,
                ));
                
              }
            }));
  }
}
