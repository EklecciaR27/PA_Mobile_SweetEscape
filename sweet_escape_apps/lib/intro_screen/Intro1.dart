import 'package:flutter/material.dart';

class Intro1 extends StatelessWidget {
  const Intro1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: ListView(
          children: [
            Text('halaman 1'),
            SizedBox(
                height: 16), // Untuk memberikan jarak antara teks dan gambar
            Image.asset(
              'image/logo.jpeg',
              width: 200.0,
              height: 200.0,
            ),
            // Pastikan nama gambar dan path yang benar
          ],
        ),
      ),
    );
  }
}
