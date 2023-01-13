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
      body: Container(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Hello'),
            ElevatedButton(
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
                child: Text('logout'))
          ],
        ),
      ),
    );
  }
}
