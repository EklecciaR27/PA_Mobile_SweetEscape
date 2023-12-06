import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Intro2 extends StatelessWidget {
  const Intro2({Key? key}) : super(key: key);

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
              'images/studio.png',
              width: 300.0,
              height: 280.0,
            ),
            // ignore: avoid_unnecessary_containers
            const SizedBox(height: 60),
            Column(
              children: [
                Text(
                  "\t \t  Discover the best photographer \n to make your memories unforgettable",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
