import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class IconAndTextFiled extends StatelessWidget {
  final VoidCallback ontap;
  var controller, icon, validator;
  var hinttext;
  IconAndTextFiled(
      {required this.hinttext,
      required this.controller,
      required this.icon,
      required this.ontap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
        TextFormField(
          validator: validator,
          controller: controller,
          decoration: InputDecoration(
              hintText: hinttext,
              fillColor: const Color.fromARGB(255, 241, 247, 252),
              filled: true,
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
        )
      ],
    );
  }
}
