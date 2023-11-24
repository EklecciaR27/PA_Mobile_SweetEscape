import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Intro1 extends StatelessWidget {
  const Intro1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 138, 183, 186),
      child: Center(
        child: ListView(
          children: [
            const SizedBox(
                height: 160), // Untuk memberikan jarak antara teks dan gambar
            Image.asset(
              'images/intro2.png',
              width: 300.0,
              height: 280.0,
            ),
            // ignore: avoid_unnecessary_containers
            Container(
              padding: const EdgeInsets.fromLTRB(50, 100, 0, 20),
              child: Text(
                "WELCOME TO SWEET ESCAPE APP",
                style: GoogleFonts.montserrat(
                    color: const Color.fromARGB(255, 241, 213, 189),
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
