import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Intro1 extends StatelessWidget {
  const Intro1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Center(
            child: ListView(
              children: [
                Text(
                  'WELCOME TO',
                  style: GoogleFonts.montserrat(
                      color: Colors.lightBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Image.asset(
                  'images/intro2.png',
                  width: 450.0,
                  height: 450.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
