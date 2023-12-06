import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Intro3 extends StatelessWidget {
  const Intro3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 138, 183, 186),
      child: Center(
        child: ListView(
          children: [
            const SizedBox(
                height: 160), // Untuk memberikan jarak antara teks dan gambar
            Image.asset(
              'images/book.png',
              width: 300.0,
              height: 280.0,
            ),
            const SizedBox(height: 60),
            // ignore: avoid_unnecessary_containers
            Container(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                '\t \t \t  \t \t Quick and easy bookings. \n Start booking with SweetEscape now!',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
