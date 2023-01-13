import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/custom_widgets/custom_button.dart';
import 'package:firebase_authentication/custom_widgets/custom_textfield_widget.dart';
import 'package:firebase_authentication/verify.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class MobileVerification extends StatefulWidget {
  const MobileVerification({Key? key}) : super(key: key);

  @override
  State<MobileVerification> createState() => _MobileVerificationState();
}

class _MobileVerificationState extends State<MobileVerification> {
  final phonenocontroller = TextEditingController();
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
                  'Verification ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 40,
                ),
                custom_textfield(
                    textInputType: TextInputType.number,
                    textcontroller: phonenocontroller,
                    hintText: '+91' + ' Enter your Phone Number'),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 50,
                  child: custom_Button(
                      OnTap: () {
                        FirebaseAuth.instance.verifyPhoneNumber(
                            phoneNumber: "+91" + phonenocontroller.text,
                            verificationCompleted: (_) {},
                            verificationFailed: (e) {
                              print("Error:${e.toString()}");
                            },
                            codeSent: (String verificationID, int? token) {
                              Navigator.pushAndRemoveUntil<void>(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      Verify(verificationID: verificationID),
                                ),
                                (Route<dynamic> route) => false,
                              );
                            },
                            codeAutoRetrievalTimeout: (e) {
                              print("Error:${e.toString()}");
                            });
                      },
                      buttonText: 'Send OTP'),
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
