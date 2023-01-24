import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HomePage')),
      bottomNavigationBar: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(16),
        child: ElevatedButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut().then((value) {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return SignIn();
                  },
                ));
              });
              await GoogleSignIn().signOut();
            },
            child: Text('logout')),
      ),
      // body: Container(
      //   width: double.maxFinite,
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 16.0),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: [
      //         SizedBox(
      //           height: 50,
      //           width: MediaQuery.of(context).size.width,
      //           child: ElevatedButton(
      //               onPressed: () async {
      //                 await FirebaseAuth.instance.signOut().then((value) {
      //                   Navigator.pushReplacement(context, MaterialPageRoute(
      //                     builder: (context) {
      //                       return SignIn();
      //                     },
      //                   ));
      //                 });
      //                 await GoogleSignIn().signOut();
      //               },
      //               child: Text('logout')),
      //         )
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
