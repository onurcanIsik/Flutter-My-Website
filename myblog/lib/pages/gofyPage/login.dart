// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myblog/pages/gofyPage/gofy.dart';
import 'package:myblog/pages/gofyPage/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String email, password;
  final _globalKey = GlobalKey<FormState>();
  String erorrMessage = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Form(
          key: _globalKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: 480,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade50,
                        offset: const Offset(4.0, 4.0),
                        blurRadius: 15.0,
                        spreadRadius: 1.0,
                      ),
                      const BoxShadow(
                        color: Colors.grey,
                        offset: Offset(-4.0, -4.0),
                        blurRadius: 15.0,
                        spreadRadius: 1.0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "Welcome To Gofy",
                          style: GoogleFonts.balooDa2(
                            fontSize: 33,
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (checkEmail) {
                            return checkEmail!.contains(RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))
                                ? null
                                : "Geçerli bir e-posta girin";
                          },
                          onChanged: (emailHolder) {
                            email = emailHolder;
                          },
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            suffixIcon: const Icon(
                              Icons.alternate_email_rounded,
                              color: Colors.grey,
                            ),
                            label: Text(
                              "E-mail",
                              style: GoogleFonts.comfortaa(color: Colors.black),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.orange),
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (checkPass) {
                            return checkPass!.length >= 12
                                ? null
                                : "Daha uzun bir şifre giriniz";
                          },
                          obscureText: true,
                          onChanged: (passHolder) {
                            password = passHolder;
                          },
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            suffixIcon: const Icon(
                              Icons.key,
                              color: Colors.grey,
                            ),
                            label: Text(
                              "Password",
                              style: GoogleFonts.comfortaa(color: Colors.black),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.orange),
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Divider(
                              indent: 10,
                              endIndent: 10,
                              height: 10,
                              thickness: 5,
                              color: Colors.orange,
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: "Don't have an account? ",
                              style: GoogleFonts.comfortaa(),
                              children: <TextSpan>[
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => RegisterPage(),
                                        ),
                                      );
                                    },
                                  text: 'Register',
                                  style: GoogleFonts.comfortaa(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Expanded(
                            child: Divider(
                              indent: 10,
                              endIndent: 10,
                              height: 10,
                              thickness: 5,
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(22.0),
                        child: Container(
                          height: 40,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.orange,
                          ),
                          child: TextButton(
                            child: Text(
                              "Login",
                              style: GoogleFonts.comfortaa(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {
                              girisYap();
                            },
                          ),
                        ),
                      ),
                      Text(erorrMessage),
                      SignInButton(
                        Buttons.GoogleDark,
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void girisYap() {
    if (_globalKey.currentState!.validate()) {
      try {
        FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password)
            .then(
          (value) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const GofyPage()),
            );
          },
        );
        erorrMessage = "";
      } on FirebaseAuthException catch (error) {
        erorrMessage = error.message!;
      }
    }
  }
}
