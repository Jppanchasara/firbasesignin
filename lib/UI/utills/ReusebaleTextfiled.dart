import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ReusebaleTextFiled extends StatelessWidget {
  final VoidCallback ontap;
  var controller, icons,validator;
  String hinttext;
  ReusebaleTextFiled({
    super.key,
    required this.validator,
    required this.ontap,
    required this.icons,
    required this.hinttext,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator:validator,
              
      controller: controller,
      
      decoration: InputDecoration(
         
          hintText: hinttext,
          fillColor: const Color.fromARGB(255, 241, 247, 252),
          filled: true,
          suffixIcon: InkWell(
            onTap: ontap,
            child: Icon(
              icons,
              color: Colors.grey.shade700,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                style: BorderStyle.solid, color: Colors.red.shade700, width: 2),
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.grey.shade200))),
    );
  }
}
