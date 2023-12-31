import 'package:flutter/material.dart';
import 'package:sweet_escape_apps/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sweet_escape_apps/input_page.dart';
import 'package:sweet_escape_apps/theme.dart';

class DetailPageMalang extends StatelessWidget {
  const DetailPageMalang({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // tumpukan foto dan container nama toko
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: height * 0.4,
                  width: width,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("images/malang.jpg"))),
                ),

                // back
                Positioned(
                    top: 16,
                    left: 16,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(127, 127, 127, 1),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      },
                      child: Container(
                        child: Icon(
                          Icons.arrow_back,
                          color: colorMode.onPrimary,
                        ),
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                    )),

                Container(
                  height: height * 0.1,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: colorMode.onPrimary,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Malang",
                      style: GoogleFonts.montserrat(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),

            // row rating dan jam buka
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: colorMode.tertiary,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text("4.5", style: GoogleFonts.montserrat(fontSize: 12)),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: colorMode.onPrimaryContainer,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text("07.00 - 14.00",
                          style: GoogleFonts.montserrat(fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),

            // //card book
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: colorMode.inversePrimary,
                child: Padding(
                  padding: const EdgeInsets.only(
                      bottom: 16.0, top: 16.0, left: 8.0, right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Reservasi Sekarang Juga!!",
                            style: GoogleFonts.montserrat(fontSize: 12),
                          ),
                          Text(
                            "Dapatkan Discount up to 50%",
                            style: GoogleFonts.montserrat(fontSize: 12),
                          ),
                        ],
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Reservasi(),
                                ));
                          },
                          child: const Text("BOOK NOW"))
                    ],
                  ),
                ),
              ),
            ),

            //Best Places
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Best Places",
                    style: GoogleFonts.montserrat(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text("Mount Bromo",
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                      ))
                ],
              ),
            ),

            // deskripsi
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Deskripsi",
                    style: GoogleFonts.montserrat(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                      "Gunung Bromo, sejauh mata memandang di Jawa Timur, adalah perpaduan indah antara keajaiban alam dan keteguhan spiritual. Panorama gunung berapi yang megah, kawah yang berkabut, dan lautan pasir yang luas menciptakan lanskap yang luar biasa. Cahaya matahari terbit di balik gunung-gunung menjadikan langit sebagai kanvas yang memukau, menawarkan pengalaman fotografi yang tak tertandingi. \n Suasana mistis dan keagungan alam berkumpul, menciptakan atmosfer yang memikat hati. Ketika kabut tipis merayap di sekitar gunung, Bromo memancarkan pesona magis yang menantang untuk diabadikan. Momennya yang dramatis, dengan kuda-kuda perkasa dan penduduk lokal yang berbusana warna-warni, menjadi latar sempurna untuk mengabadikan momen tak terlupakan. \n Jadi, hadirlah di Gunung Bromo dengan kamera di tanganmu. Biarkan dirimu terperangkap dalam keindahan yang memukau, dan biarkan kamera menjadi saksi bisu setiap detik keajaiban di destinasi ini. ",
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                      ))
                ],
              ),
            ),

            // ulasan
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Ulasan",
                style: GoogleFonts.montserrat(
                    fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            const Comment(),
            const Comment(),
            const Comment(),
            const Comment(),
          ],
        )),
      ),
    );
  }
}

class Comment extends StatelessWidget {
  const Comment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Image.network(
                "https://i0.wp.com/studiolorier.com/wp-content/uploads/2018/10/Profile-Round-Sander-Lorier.jpg",
                width: 30,
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Zoro Xander"),
                  Row(
                    children: [
                      Icon(Icons.star, color: colorMode.tertiary),
                      Icon(Icons.star, color: colorMode.tertiary),
                      Icon(Icons.star, color: colorMode.tertiary),
                      Icon(Icons.star, color: colorMode.tertiary),
                    ],
                  )
                ],
              ),
            ],
          ),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            style: GoogleFonts.montserrat(fontSize: 12),
          )
        ],
      ),
    );
  }
}
