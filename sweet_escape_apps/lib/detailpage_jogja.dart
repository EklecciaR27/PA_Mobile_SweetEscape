import 'package:flutter/material.dart';
import 'package:sweet_escape_apps/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sweet_escape_apps/input_page.dart';

class DetailPageJogja extends StatelessWidget {
  const DetailPageJogja({super.key});

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
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("images/jogja.jpg"))),
                ),

                // back
                Positioned(
                    top: 16,
                    left: 16,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(127, 127, 127, 1),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      },
                      child: Container(
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                    )),

                Container(
                  height: height * 0.1,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Yogyakarta",
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
                        color: Colors.amber,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("4.7", style: GoogleFonts.montserrat(fontSize: 12)),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("05.00 - 00.00",
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
                color: Colors.amber[100],
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
                                  Reservasi(imagePath: "images/jogja.jpg"),
                              ),
                            );
                      }, child: Text("BOOK NOW"))
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
                  SizedBox(
                    height: 10,
                  ),
                  Text("Candi Borobudur | Candi Prambanan | Taman Sari Water Castle",
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
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Jogja, kota yang memukau dengan pesona sejarah dan keasrian alamnya. Setiap jengkalnya berbicara tentang kekayaan budaya dan keramahan yang melekat dalam setiap senyuman warganya. Di dalam keberagaman kulturalnya, Jogja menawarkan panggung yang indah untuk setiap momen yang ingin diabadikan dalam sepotong kisah visual. \n Maka, datanglah dan biarkan dirimu terpesona oleh keajaiban Jogja. Sambut hangat matahari terbit atau rasakan kelembutan senja, dan abadikan setiap detik dalam kota yang tak hanya memikat hati, tetapi juga mengundang setiap pengunjung untuk menjadi bagian dari kisah keelokan Jogja. Setiap jalan setapak adalah peluang untuk menangkap keindahan yang autentik dan unik, menjadikan Jogja sebagai surga para wisatawan.",
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

            Comment(),
            Comment(),
            Comment(),
            Comment(),
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
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Zoro Xander"),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star, color: Colors.amber),
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

