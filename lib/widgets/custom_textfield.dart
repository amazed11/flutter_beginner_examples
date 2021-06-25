import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildCustomTextField({
  String? hinttext,
  IconData? icon,
  TextInputType? textInputType = TextInputType.emailAddress,
  bool obscuretext = false,
  TextEditingController? controller,
}) {
  return Container(
    decoration: BoxDecoration(
        color: Color(0xff932eff),
        borderRadius: BorderRadius.circular(
          20.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.white54,
            offset: Offset(0, 0),
            blurRadius: 7.0,
          ),
        ]),
    child: TextField(
      controller: controller,
      style: TextStyle(
        color: Colors.white,
        fontSize: 18.0,
      ),
      cursorColor: Colors.white,
      obscureText: obscuretext,
      keyboardType: textInputType,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.white,
        ),
        hintText: hinttext,
        hintStyle: TextStyle(
          color: Colors.white70,
        ),
        border: OutlineInputBorder(
          gapPadding: 20.0,
          borderRadius: BorderRadius.circular(
            20.0,
          ),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}
