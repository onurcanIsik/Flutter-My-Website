// ignore_for_file: file_names, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget appBarCircle(String title) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(70),
        boxShadow: const [
          BoxShadow(
            offset: Offset(1, 2),
            blurRadius: 1,
            spreadRadius: 2,
            color: Colors.yellow,
          ),
        ],
      ),
      child: CircleAvatar(
        child: Text(
          title,
          style: GoogleFonts.comfortaa(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.yellow,
      ),
    ),
  );
}

Widget appBarMail() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: 100,
      decoration: BoxDecoration(
        color: Colors.green[700],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          "MailGo",
          style: GoogleFonts.comfortaa(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}

Widget appBarAll(Widget icon) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(70),
        boxShadow: const [
          BoxShadow(
              offset: Offset(1, 2),
              blurRadius: 1,
              spreadRadius: 2,
              color: Colors.yellow),
        ],
      ),
      child: CircleAvatar(
        child: icon,
        backgroundColor: Colors.yellow,
      ),
    ),
  );
}
