import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ContainerShadowButton extends StatelessWidget {
  var icon;
  String title;
  ContainerShadowButton({this.title = "", required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
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
          child: Icon(
            icon,
            color: Colors.red,
            size: 30,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Container(
            width: 260,
            height: 60,
            decoration: BoxDecoration(
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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text(title)),
            )),
      ],
    );
  }
}
