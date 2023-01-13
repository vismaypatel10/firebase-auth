import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/custom_widgets/custom_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'custom_widgets/custom_button.dart';
import 'homescreen.dart';

class Verify extends StatefulWidget {
  final String verificationID;

  const Verify({Key? key, required this.verificationID}) : super(key: key);

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  final verificationCodeController = TextEditingController();
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
                  'Enter OTP ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 40,
                ),
                PinCodeTextField(
                  keyboardType: TextInputType.number,
                  appContext: context,
                  controller: verificationCodeController,
                  length: 6,
                  onChanged: (value) {},
                ),
                // custom_textfield(
                //     textcontroller: verificationCodeController,
                //     hintText: '6 digit code'),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: custom_Button(
                    buttonText: 'Verify',
                    OnTap: () async {
                      final credential = PhoneAuthProvider.credential(
                          verificationId: widget.verificationID,
                          smsCode: verificationCodeController.text.toString());

                      try {
                        await FirebaseAuth.instance
                            .signInWithCredential(credential);

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ));
                      } catch (e) {
                        print('Error ${e.toString()}');
                      }
                    },
                  ),
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
