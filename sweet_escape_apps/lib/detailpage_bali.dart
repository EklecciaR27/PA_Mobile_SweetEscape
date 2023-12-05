import 'package:flutter/material.dart';
import 'package:sweet_escape_apps/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sweet_escape_apps/input_page.dart';
import 'theme.dart';

class DetailPageBali extends StatelessWidget {
  const DetailPageBali({super.key});

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
                          image: AssetImage("images/bali.jpg"))),
                ),

                // back
                Positioned(
                    top: 16,
                    left: 16,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorMode.onSurface,
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
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Bali",
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
                      Text("4.9", style: GoogleFonts.montserrat(fontSize: 12)),
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
                      Text("Morning - Evening",
                          style: GoogleFonts.montserrat(fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),

            // //card promo
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: colorMode.inversePrimary,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
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
                      ElevatedButton(onPressed: () {
                         Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                  Reservasi(),
                            )
                         );
                      }, child: const Text("BOOK NOW"))
                    ],
                  ),
                ),
              ),
            ),

            //Tempat Terkenal
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
                  Text("Ubud | Kintamani | Nusa Penida Island",
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
                    "Ubud, terletak di tengah-tengah pulau Bali, memancarkan keindahan budaya dan alam yang menakjubkan. Di tengah sawah yang hijau terhampar, Ubud memelukmu dengan pesona riangnya, sementara kuil-kuil kuno dan seni rupa yang berlimpah memberikan sentuhan magis pada setiap sudutnya. Cahaya matahari yang lembut meresapi pohon-pohon hijau di sekitar, menciptakan bayangan yang menawan. Jembatan-jembatan cantik yang melintasi sungai-sungai kecil memberikan latar belakang yang memesona untuk sesi foto yang tak terlupakan. Sentuhan tradisional dan modern bersatu harmonis, menciptakan atmosfer yang mengundang, seolah memberikan ruang bagi kreativitas untuk berkembang. Tak jauh dari Ubud, Kintamani mempersembahkan pemandangan luar biasa dari ketinggian. Gunung Batur dan danau berapi yang anggun menjadi fokus utama, menciptakan pemandangan yang menakjubkan. Cahaya matahari terbit dan terbenam melukis langit dan danau dengan warna-warna magis, menciptakan palet yang sempurna untuk foto yang menakjubkan. Bukit-bukit hijau yang berjejer memeluk danau dan gunung, menciptakan lanskap yang dramatis. Hijaunya hamparan sawah terasering dan keindahan alam yang asri memberikan kontras menakjubkan. Setiap langkahmu di Kintamani akan menghadirkan momen-momen indah yang sayang untuk dilewatkan, dan kamera akan menjadi sahabat setia untuk merangkai kisah visual yang tak terlupakan.",
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
                  Text("Zoro Xander"),
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

