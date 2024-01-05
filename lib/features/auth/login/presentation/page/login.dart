import 'dart:developer';

import 'package:antbery/config/them/pro_black.dart';
import 'package:antbery/features/auth/sinup/presentaion/page/signup.dart';
import 'package:antbery/features/bottonavigation/page/bottom_navigation.dart';
import 'package:antbery/features/home/presentaion/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BlLogin extends StatelessWidget {
  const BlLogin({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailC = TextEditingController();
    TextEditingController passwordC = TextEditingController();
    return Scaffold(
      backgroundColor: ProBlackStyle().grayblackProblack,
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Username TextField
            ClipRRect(
              borderRadius: BorderRadius.circular(18.0),
              child: Container(
                height: ProBlackStyle().bappSize(context).height * 0.064,
                width: ProBlackStyle().bappSize(context).width * 0.6,
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                color: ProBlackStyle().blackCloProBlack,
                child: TextField(style: TextStyle(color: const Color.fromARGB(255, 193, 193, 193)),
                  controller: emailC,
                  decoration: InputDecoration(
                    fillColor: ProBlackStyle().blackCloProBlack,
                    filled: true,
                    hintText: 'Email',
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 176, 176, 176)),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            // Password TextField
            ClipRRect(
              borderRadius: BorderRadius.circular(18.0),
              child: Container(
                height: ProBlackStyle().bappSize(context).height * 0.064,
                width: ProBlackStyle().bappSize(context).width * 0.6,
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                color: ProBlackStyle().blackCloProBlack,
                child: TextField(style: TextStyle(color: const Color.fromARGB(255, 193, 193, 193)),
                  controller: passwordC,
                  obscureText: true,
                  decoration: InputDecoration(
                    fillColor: ProBlackStyle().blackCloProBlack,
                    filled: true,
                    hintText: 'Password',
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 177, 177, 177)),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            // Login Button
            ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            18.0), // Set your desired border radius
                      ),
                    ),
                    minimumSize: MaterialStatePropertyAll(Size(
                        ProBlackStyle().bappSize(context).width * 0.6,
                        ProBlackStyle().bappSize(context).height * 0.064)),
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(196, 136, 78, 2))),
                onPressed: () async {
                  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
                  try {
                    await firebaseAuth.signInWithEmailAndPassword(
                        email: emailC.text, password: passwordC.text);
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Bottomnavigation(),), (route) => false);
                  } on FirebaseAuthException catch (e) {
                    log(e.toString());
                  }
                },
                child: Center(
                  child: Text('Login'),
                )),
            TextButton(
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => BlSignUp())),
                child: Text('Sign Up'))
          ],
        ),
      ),
    );
  }
}
