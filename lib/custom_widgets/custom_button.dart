import 'package:flutter/material.dart';

class custom_Button extends StatelessWidget {
  custom_Button({
    required this.OnTap,
    required this.buttonText,
    Key? key,
  }) : super(key: key);

  VoidCallback OnTap;
  String buttonText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: OnTap
      //
      ,
      child: Text(buttonText),
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
          primary: Colors.purple),
    );
  }
}
