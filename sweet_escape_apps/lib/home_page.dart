import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sweet_escape_apps/detailpage_bali.dart';
import 'package:sweet_escape_apps/detailpage_jogja.dart';
import 'package:sweet_escape_apps/detailpage_malang.dart';
import 'package:sweet_escape_apps/widgets/bottomNav.dart';
import 'theme.dart';
import 'authentication.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  String? username;

  @override
  void initState() {
    super.initState();
    loadProfileInfo();
  }

  Future<void> loadProfileInfo() async {
    final user = await Auth().getCurrentUser();
    setState(() {
      username = user?.displayName;
    });
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

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
                      height: 140,
                      width: double.infinity,
                      color: colorMode.secondary),
                  Column(
                    children: [
                      const SizedBox(
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
                                    image: const DecorationImage(
                                      image: NetworkImage(
                                          "https://i0.wp.com/studiolorier.com/wp-content/uploads/2018/10/Profile-Round-Sander-Lorier.jpg"),
                                    ),
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(
                                        color: colorMode.onPrimary,
                                        style: BorderStyle.solid,
                                        width: 2),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Hi, $username. Welcome!",
                                  style: GoogleFonts.montserrat(
                                      color: colorMode.onPrimary, fontSize: 20),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: colorMode.onPrimary,
                              borderRadius: BorderRadius.circular(30)),
                          child: TextField(
                              cursorHeight: 20,
                              autofocus: false,
                              decoration: InputDecoration(
                                  hintText: "Cari destinasi kota!!",
                                  prefixIcon: const Icon(Icons.search),
                                  border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.grey, width: 2),
                                      borderRadius:
                                          BorderRadius.circular(30)))),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                child: const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Category(
                          imagePath: "images/photograph.png", title: "Capture"),
                      Category(imagePath: "images/camera.png", title: "Studio"),
                      Category(
                          imagePath: "images/location.png", title: "Near U"),
                      Category(imagePath: "images/booked.png", title: "Booked"),
                    ],
                  ),
                ),
              ),

              Text(
                "Favorite Spot Photos",
                style: GoogleFonts.montserrat(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),

              //3 pilihan
              // BALI
              SizedBox(
                width: double.infinity,
                height: tinggi * 0.3,
                child: Stack(children: [
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 10,
                    child: Container(
                      color: colorMode.secondary,
                      child: Column(children: [
                        SizedBox(
                          width: double.infinity,
                          height: tinggi * 0.2,
                          child: Image.asset(
                            "images/bali.jpg",
                            fit: BoxFit.cover,
                          ),
                        )
                      ]),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 10,
                    child: SizedBox(
                      height: 70,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            Text(
                              "Bali",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            const SizedBox(width: 5),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: colorMode.tertiary,
                                ),
                                Text(
                                  "4.9",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                const SizedBox(width: 20),
                                Icon(
                                  Icons.place,
                                  color: colorMode.onSecondary,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  "Ubud | Kintamani",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  //button details
                  Positioned(
                    top: 20,
                    right: 10,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DetailPageBali(),
                          ),
                        );
                      },
                      child: const Text("Details"),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: colorMode.onTertiary,
                        padding: const EdgeInsets.fromLTRB(
                            20, 10, 20, 10), // Padding tombol
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(20), // Bentuk tepi tombol
                        ),
                      ),
                    ),
                  ),
                ]),
              ),

              // MALANG
              SizedBox(
                width: double.infinity,
                height: tinggi * 0.3,
                child: Stack(children: [
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 10,
                    child: Container(
                      color: colorMode.secondary,
                      child: Column(children: [
                        SizedBox(
                          width: double.infinity,
                          height: tinggi * 0.2,
                          child: Image.asset(
                            "images/malang.jpg",
                            fit: BoxFit.cover,
                          ),
                        )
                      ]),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 10,
                    child: SizedBox(
                      height: 70,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            Text(
                              "Malang",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            const SizedBox(width: 5),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: colorMode.tertiary,
                                ),
                                Text(
                                  "4.5",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                const SizedBox(width: 20),
                                Icon(
                                  Icons.place,
                                  color: colorMode.onSecondary,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  "Mount Bromo",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 10,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DetailPageMalang(),
                          ),
                        );
                      },
                      child: const Text("Details"),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: colorMode.onTertiary,
                        padding: const EdgeInsets.fromLTRB(
                            20, 10, 20, 10), // Padding tombol
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(20), // Bentuk tepi tombol
                        ),
                      ),
                    ),
                  )
                ]),
              ),

              // JOGJAA
              SizedBox(
                width: double.infinity,
                height: tinggi * 0.3,
                child: Stack(children: [
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 10,
                    child: Container(
                      color: colorMode.secondary,
                      child: Column(children: [
                        SizedBox(
                          width: double.infinity,
                          height: tinggi * 0.2,
                          child: Image.asset(
                            "images/jogja.jpg",
                            fit: BoxFit.cover,
                          ),
                        )
                      ]),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 10,
                    child: SizedBox(
                      height: 70,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            Text(
                              "Yogyakarta",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            const SizedBox(width: 5),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: colorMode.tertiary,
                                ),
                                Text(
                                  "4.7",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                const SizedBox(width: 20),
                                Icon(
                                  Icons.place,
                                  color: colorMode.onSecondary,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  "Candi Prambanan",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 10,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DetailPageJogja(),
                          ),
                        );
                      },
                      child: const Text("Details"),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: colorMode.onTertiary,
                        padding: const EdgeInsets.fromLTRB(
                            20, 10, 20, 10), // Padding tombol
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(20), // Bentuk tepi tombol
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavScreen(
        currentIndex: currentIndex, // Ganti dengan judul sesuai kebutuhan
      ),
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
      color: colorMode.onTertiary,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.12,
          height: 60,
          child: Column(
            children: [
              Image.asset(
                imagePath,
                width: 30,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: const TextStyle(fontSize: 10),
              )
            ],
          ),
        ),
      ),
    );
  }
}
