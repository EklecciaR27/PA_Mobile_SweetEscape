import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
     var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
     
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            Stack(
              children: [
                Container(
                    height: 140, width: double.infinity, color: Color.fromARGB(255, 38, 135, 232)),
                Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "https://i0.wp.com/studiolorier.com/wp-content/uploads/2018/10/Profile-Round-Sander-Lorier.jpg"),
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                      color: Colors.white,
                                      style: BorderStyle.solid,
                                      width: 2),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Hi, Zoro Xander. Welcome!",
                                style: GoogleFonts.montserrat(
                                    color: Colors.white, fontSize: 20),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color(0xFFF5F5F7),
                            borderRadius: BorderRadius.circular(30)),
                        child: TextField(
                            cursorHeight: 20,
                            autofocus: false,
                            decoration: InputDecoration(
                                hintText: "Cari Cafe & Resto Favoritemu !!",
                                prefixIcon: Icon(Icons.search),
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey, width: 2),
                                    borderRadius: BorderRadius.circular(30)))),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Category(imagePath: "images/photograph.png", title: "Capture"),
                  Category(imagePath: "images/camera.png", title: "Studio"),
                  Category(imagePath: "images/location.png", title: "Near U"),
                  Category(imagePath: "images/booked.png", title: "Booked"),
                ],
              ),
            ),
            Text(
              "Favorite Spot Photos",
              style: GoogleFonts.montserrat(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
      
            FavPlace(imagePath: "images/bali.jpg", namaCR: "Bali", rating: "4.9", place: "Ubud | Kintamani", lebar: lebar, tinggi: tinggi),
            FavPlace(imagePath: "images/malang.jpg", namaCR: "Malang", rating: "4.5", place: "Mount Bromo", lebar: lebar, tinggi: tinggi),
           FavPlace(imagePath: "images/jogja.jpg", namaCR: "Yogyakarta", rating: "4.7", place: "Candi Prambanan", lebar: lebar, tinggi: tinggi),
          ],
        )),
      ),
    );
  }
}

class FavPlace extends StatelessWidget {
  final String imagePath;
  final String namaCR;
  final String rating;
  final String place;
  var lebar; 
  var tinggi; 
  FavPlace({
    super.key,
    required this.imagePath,
    required this.namaCR,
    required this.rating,
    required this.place,
    required this.lebar,
    required this.tinggi, 
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
     width: double.infinity,
      height: tinggi * 0.3, 
      child: Stack(children: [
        Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)),
          elevation: 10,
          child: Column(children: [
            SizedBox(
              width: double.infinity,
              height: tinggi * 0.2,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            )
          ]),
        ),
        Positioned(
          bottom: 0,
          left: 10,
          child: SizedBox(
            height: 70,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column (
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 7),
                  Text(
                    namaCR,
                    style: GoogleFonts.montserrat(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 5),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Text(rating),
            
                     SizedBox(width: 20),
            
                      Icon(
                        Icons.place, 
                        color: Colors.grey,),
                      SizedBox(width: 5),
                      Text(place, style: GoogleFonts.montserrat(fontSize: 12),)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
          // Positioned(
          //   top: 20,
          //   right: 10,
          //   child: ElevatedButton(
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => detailpage(
          //             imagePath: imagePath,
          //             namaCR: namaCR,
          //             rating: rating,
          //             jam: jam,
          //           ),
          //         ),
          //       );
          //     },
          //     child: Text("Details"),
          //   ),
          // ),
      ]),
    );
  }
}

class Category extends StatelessWidget {
  final String imagePath;
  final String title;
  const Category({super.key, required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.12,
          height: 60,
          child: Column(
            children: [
              Image.asset(
                imagePath,
                width: 30,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: TextStyle(fontSize: 10),
              )
            ],
          ),
        ),
      ),
    );
  }
}
