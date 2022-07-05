// ignore_for_file: deprecated_member_use, avoid_single_cascade_in_expression_statements, prefer_const_constructors, unnecessary_new, curly_braces_in_flow_control_structures, prefer_const_declarations, avoid_print

import 'dart:convert';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myblog/Colors/my_colors.dart';
import 'package:http/http.dart' as http;

class MailGo extends StatefulWidget {
  const MailGo({Key? key}) : super(key: key);

  @override
  State<MailGo> createState() => _MailGoState();
}

class _MailGoState extends State<MailGo> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController bodyController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController subjectController = TextEditingController();
    TextEditingController nameController = TextEditingController();

    Future sendEmail({
      required String name,
      required String email,
      required String subject,
      required String message,
    }) async {
      final serviceId = "service_amu2rz2";
      final templateId = "template_j01rkkq";
      final userId = "pgD_UlHJl6CRt8Ewo";

      final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
      final response = await http.post(url,
          headers: {"Content-Type": 'application/json'},
          body: json.encode({
            'service_id': serviceId,
            'template_id': templateId,
            'user_id': userId,
            'template_params': {
              'user_name': name,
              'user_email': email,
              'user_subject': subject,
              'user_message': message,
            }
          }));
      print(response.body);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: mailGoColor,
        body: Form(
          key: formKey,
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("Assets/Images/mailgo.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Center(
                        child: Text(
                          "Send Mail To Me",
                          style: GoogleFonts.koHo(
                            fontSize: 60,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.blue[900]),
                          validator: (index) {
                            if (index!.isEmpty) {
                              return "Please write name";
                            }
                            return null;
                          },
                          controller: nameController,
                          decoration: InputDecoration(
                            fillColor: Colors.grey,
                            iconColor: Colors.white,
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            filled: true,
                            label: Text("Name"),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.blue[900]),
                          validator: (index) {
                            if (index!.isEmpty) {
                              return "Please Write right email";
                            } else if (!EmailValidator.validate(index)) {
                              return "Please Write right email";
                            }
                            return null;
                          },
                          controller: emailController,
                          decoration: InputDecoration(
                            fillColor: Colors.grey,
                            iconColor: Colors.white,
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            prefixIcon: Icon(
                              Icons.alternate_email_rounded,
                              color: Colors.white,
                            ),
                            filled: true,
                            label: Text("e-mail"),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.blue[900]),
                          validator: (index) {
                            if (index!.isEmpty) {
                              return "Please write Subject";
                            }
                            return null;
                          },
                          controller: subjectController,
                          decoration: InputDecoration(
                            fillColor: Colors.grey,
                            iconColor: Colors.white,
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            prefixIcon: Icon(
                              Icons.note_alt_rounded,
                              color: Colors.white,
                            ),
                            filled: true,
                            label: Text("Subject"),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.blue[900]),
                          validator: (index) {
                            if (index!.isEmpty) {
                              return "Please write Description";
                            }
                            return null;
                          },
                          controller: bodyController,
                          maxLines: null,
                          decoration: InputDecoration(
                            fillColor: Colors.grey,
                            iconColor: Colors.white,
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            prefixIcon: Icon(
                              Icons.line_weight_sharp,
                              color: Colors.white,
                            ),
                            filled: true,
                            label: Text("Description"),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            width: 120,
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(1, 2),
                                  spreadRadius: 2,
                                  blurRadius: 1,
                                  color: Colors.grey,
                                )
                              ],
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: TextButton(
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  sendEmail(
                                      name: nameController.text,
                                      email: emailController.text,
                                      subject: subjectController.text,
                                      message: bodyController.text);
                                  bodyController.clear();
                                  nameController.clear();
                                  emailController.clear();
                                  subjectController.clear();
                                }
                              },
                              child: Text(
                                "Send",
                                style: GoogleFonts.koHo(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
