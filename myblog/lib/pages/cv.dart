import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCv extends StatefulWidget {
  const MyCv({Key? key}) : super(key: key);

  @override
  State<MyCv> createState() => _MyCvState();
}

class _MyCvState extends State<MyCv> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("Assets/Images/deneme.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      height: 1000,
                      width: 700,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("Assets/Images/Mycv.png"),
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(1, 2),
                              blurRadius: 2,
                              spreadRadius: 1,
                              color: Colors.grey),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Tüm Haklar Saklıdır. Made By Gofy",
                          style: GoogleFonts.comfortaa(color: Colors.white),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
