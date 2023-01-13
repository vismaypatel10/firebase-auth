import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/custom_widgets/custom_button.dart';
import 'package:firebase_authentication/custom_widgets/custom_textfield_widget.dart';
import 'package:firebase_authentication/homescreen.dart';
import 'package:firebase_authentication/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final namecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final pswordcontroller = TextEditingController();

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
                Row(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      child: Image.asset('assets/logos.png'),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 45,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                custom_textfield(
                    textInputType: TextInputType.name,
                    textcontroller: namecontroller,
                    hintText: 'Name'),
                SizedBox(
                  height: 15,
                ),
                custom_textfield(
                    textInputType: TextInputType.emailAddress,
                    textcontroller: emailcontroller,
                    hintText: 'EmailID'),
                SizedBox(
                  height: 15,
                ),
                custom_textfield(
                    textInputType: TextInputType.name,
                    textcontroller: pswordcontroller,
                    hintText: 'Password'),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 50,
                  child: custom_Button(
                      OnTap: () {
                        FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: emailcontroller.text,
                                password: pswordcontroller.text)
                            .then((value) {
                          print('Account Created');
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return SignIn();
                            },
                          ));
                        }).onError((error, stackTrace) {
                          print('Error ${error.toString()}');
                        });
                      },
                      buttonText: 'SignUp'),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return SignIn();
                            },
                          ));
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
