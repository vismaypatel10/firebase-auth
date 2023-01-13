import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/custom_widgets/custom_button.dart';
import 'package:firebase_authentication/forgot_password.dart';
import 'package:firebase_authentication/homescreen.dart';
import 'package:firebase_authentication/mobile_verification.dart';
import 'package:firebase_authentication/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'custom_widgets/custom_textfield_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
                      'Sign In',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 45,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ), //: AssetImage('assets/images/logo.png'),
                SizedBox(
                  height: 15,
                ),
                custom_textfield(
                  textInputType: TextInputType.emailAddress,
                  textcontroller: emailcontroller,
                  hintText: 'Emailid',
                ),
                SizedBox(
                  height: 15,
                ),
                custom_textfield(
                    textInputType: TextInputType.name,
                    textcontroller: pswordcontroller,
                    hintText: 'Password'),
                SizedBox(
                  height: 15,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return ForgotPassword();
                        },
                      ));
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.white),
                    )),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 50,
                  child: custom_Button(
                      OnTap: () {
                        FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: emailcontroller.text,
                                password: pswordcontroller.text)
                            .then((value) {
                          print("Successful");
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return HomeScreen();
                            },
                          ));
                        }).onError((error, stackTrace) {
                          print("Error:${error.toString()}");
                        });
                      },
                      buttonText: 'SignIn'),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 50,
                  child: custom_Button(
                      OnTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return MobileVerification();
                          },
                        ));
                      },
                      buttonText: 'Login with PhoneNumber'),
                ),
                SizedBox(
                  height: 40,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () async {
                        try {
                          final GoogleSignInAccount? googleSignInAccount =
                              await GoogleSignIn().signIn();
                          if (googleSignInAccount != null) {
                            final GoogleSignInAuthentication
                                googleSignInAuthentication =
                                await googleSignInAccount.authentication;
                            final AuthCredential authCredential =
                                GoogleAuthProvider.credential(
                                    accessToken:
                                        googleSignInAuthentication.accessToken,
                                    idToken:
                                        googleSignInAuthentication.idToken);
                            await FirebaseAuth.instance
                                .signInWithCredential(authCredential);
                          }
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ));
                        } on FirebaseAuthException catch (e) {
                          print('Error ${e.message}');
                        }
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Image.asset('assets/googlelogo.png'),
                      ),
                    ),
                    CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Image.asset('assets/facebook.png')),
                    CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Image.asset('assets/applelogo.png')),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return SignUp();
                            },
                          ));
                        },
                        child: Text(
                          'SignUp',
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
