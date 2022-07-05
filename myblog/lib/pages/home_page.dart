// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myblog/Colors/my_colors.dart';
import 'package:myblog/Widget/appBarCircle.dart';
import 'package:myblog/pages/cv.dart';
import 'package:myblog/pages/gofyPage/login.dart';
import 'package:myblog/pages/image.dart';
import 'package:myblog/pages/mailgo.dart';
import 'package:myblog/pages/prize.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MailGo()));
              },
              child: appBarMail(),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const PrizePage()));
              },
              child: appBarAll(
                const Icon(
                  Icons.wallet_giftcard,
                  color: Colors.black,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const ImagePage())));
              },
              child: appBarAll(
                const Icon(
                  Icons.image,
                  color: Colors.black,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyCv(),
                  ),
                );
              },
              child: appBarCircle("Cv"),
            ),
          ],
          leadingWidth: 100,
          leading: Row(
            children: [
              Image.asset(
                "Assets/Images/gofy.png",
              ),
              Text(
                "Gofy",
                style: GoogleFonts.balooDa2(
                    fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
          backgroundColor: appBarColor,
        ),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("Assets/Images/bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: [
                const SizedBox(height: 100),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "Welcome To My Page",
                        style: GoogleFonts.comfortaa(
                          fontSize: 45,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 89,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    CircleAvatar(
                      radius: 130,
                      backgroundImage: AssetImage(
                        "Assets/Images/me.jpg",
                      ),
                    ),
                    SizedBox(
                      width: 120,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Onurcan Işık",
                        style: GoogleFonts.comfortaa(
                          color: Colors.black,
                          fontSize: 25,
                        ),
                      ),
                      const SizedBox(
                        width: 150,
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
