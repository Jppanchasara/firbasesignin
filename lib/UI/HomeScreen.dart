import 'package:firbasesignin/UI/login_screen.dart';
import 'package:firbasesignin/UI/user_profile/user_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatefulWidget {
  var value;
  String phoneno;
  HomeScreen({this.value = "Email", this.phoneno = 'Phone', super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> Logout() async {
    await GoogleSignIn().disconnect();
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.red,
        centerTitle: true,
        actions: [
          const SizedBox(
            width: 18,
          ),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UserProfileScreen(
                              phone: widget.phoneno.toString(),
                              valu: widget.value.toString(),
                            )));
              },
              child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    color: Colors.red,
                  ))),
          const SizedBox(
            width: 18,
          ),
        ],
        title: const Text('Zenzzen'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'welcome',
            style: TextStyle(
                fontSize: 50,
                color: Colors.grey.shade400,
                fontWeight: FontWeight.bold),
          ),
        ],
      )),
    );
  }
}
