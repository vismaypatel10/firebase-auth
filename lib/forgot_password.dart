import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/custom_widgets/custom_button.dart';
import 'package:firebase_authentication/custom_widgets/custom_textfield_widget.dart';
import 'package:firebase_authentication/sign_in.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 186, 17, 188),
          Color.fromARGB(255, 57, 24, 146)
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 200, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Forgot Password',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 40,
                ),
                custom_textfield(
                    textInputType: TextInputType.emailAddress,
                    textcontroller: emailcontroller,
                    hintText: 'Enter your EmailId'),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 50,
                  child: custom_Button(
                      OnTap: () {
                        FirebaseAuth.instance
                            .sendPasswordResetEmail(email: emailcontroller.text)
                            .then((value) {
                          Navigator.pop(context);
                        }).onError((error, stackTrace) {
                          print('Error ${error.toString()}');
                        });
                      },
                      buttonText: 'Send'),
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
