import 'package:firbasesignin/UI/HomeScreen.dart';
import 'package:firbasesignin/UI/utills/round_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class VerifyCodeScreen extends StatefulWidget {
  final String VerificationId,phoneno;
  const VerifyCodeScreen({super.key, 
  required this.phoneno,
  required this.VerificationId});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final phonenumberControllerr = TextEditingController();
  final auth = FirebaseAuth.instance;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify'),
        backgroundColor: Colors.red,
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 10,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: phonenumberControllerr,
              decoration: const InputDecoration(hintText: "6 Digits Number"),
            ),
            const Text('Code is 1 Miniutes avelaible'),
            const SizedBox(
              height: 30,
            ),
            RoundButton(
                title: 'verify',
                loading: loading,
                onPress: () async {
                  final credential = PhoneAuthProvider.credential(
                      verificationId: widget.VerificationId,
                      smsCode: phonenumberControllerr.text.toString());

                  try {
                    await auth.signInWithCredential(credential);
                    // ignore: use_build_context_synchronously
                     Get.snackbar('Hello', 'login scussefully');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeScreen(phoneno: widget.phoneno.toString(),)));
                  } catch (e) {
                    Get.snackbar('Error', e.toString());
                  }
                })
          ],
        ),
      ),
    );
  }
}
