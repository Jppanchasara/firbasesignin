import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ReuseButton extends StatelessWidget {
  final VoidCallback ontap;
  String title, url;
  ReuseButton(
      {required this.url, required this.title, required this.ontap, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: const StadiumBorder(),
              elevation: 5),
          onPressed: ontap,
          child: RichText(
              text: TextSpan(
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                  children: [
                const TextSpan(text: 'Sign In With '),
                TextSpan(
                    text: title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                    ))
              ]))),
    );
  }
}
