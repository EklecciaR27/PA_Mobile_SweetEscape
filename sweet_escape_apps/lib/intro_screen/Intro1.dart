import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Intro1 extends StatelessWidget {
  const Intro1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;

    return Container(
      color: const Color.fromARGB(255, 138, 183, 186),
      child: Center(
        child: ListView(children: [
          const SizedBox(
              height: 160), // Untuk memberikan jarak antara teks dan gambar
          Image.asset(
            'images/intro2.png',
            width: 300.0,
            height: 280.0,
          ),
          const SizedBox(height: 60),
          // ignore: avoid_unnecessary_containers
          // Container(
          //   padding: EdgeInsets.fromLTRB(lebar * 0.1, 60, lebar * 0.1, 20),
          Column(
            children: [
              Text(
                "WELCOME TO SWEET ESCAPE APP",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ],
          ),
        ]),
        //],
      ),
    );
  }
}
