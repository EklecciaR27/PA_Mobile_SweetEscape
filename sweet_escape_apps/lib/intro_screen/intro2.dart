import 'package:flutter/material.dart';

class Intro2 extends StatelessWidget {
  const Intro2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: ListView(
          children: [
            Text('halaman 2'),
            SizedBox(
                height: 16), // Untuk memberikan jarak antara teks dan gambar
            // Image.asset(
            //   'images/logo1.png',
            //   width: 200.0,
            //   height: 180.0,
            // ),
            // Pastikan nama gambar dan path yang benar
          ],
        ),
      ),
    );
  }
}
