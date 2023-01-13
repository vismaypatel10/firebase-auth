import 'package:flutter/material.dart';

class custom_textfield extends StatelessWidget {
  custom_textfield(
      {Key? key,
      required this.textcontroller,
      required this.hintText,
      required this.textInputType})
      : super(key: key);

  final TextEditingController textcontroller;
  String hintText;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInputType,
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white),
      controller: textcontroller,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 1.0),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 1.0),
        ),
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          //borderSide: BorderSide(width: 2, color: Colors.white)
        ),
      ),
    );
  }
}
