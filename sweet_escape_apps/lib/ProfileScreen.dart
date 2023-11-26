import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'ProfileMenuWidget.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'widgets/bottomNav.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(),
        body: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? const Color.fromARGB(
                      255, 21, 21, 21) // Warna latar belakang untuk mode gelap
                  : const Color.fromARGB(255, 255, 255, 255),
              // Warna latar belakang untuk mode terang
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ListView(children: [
              //BAGIAN UNTUK FOTO PROFIL
              Center(
                  child: ClipOval(
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('images/bali.jpg'),
                    ),
                  ),
                ),
              )),

              // INFORMASI BERISI NAMA,NIM DAN KELAS.
              Stack(children: [
                // Container 1 (yang di belakang)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, tinggi * 0.10, 0, 0),
                    padding: EdgeInsets.fromLTRB(22, tinggi * 0.1, 22, 300),
                    decoration: BoxDecoration(
                      color: const Color(0xFF66A2AD),
                      // Warna latar belakang untuk mode terang
                      borderRadius: BorderRadius.circular(10.0),

                      border: Border.all(
                        color: Colors.black, // Warna border
                        width: 2.0, // Lebar border
                      ),
                    ),
                  ),
                ),

                // Container 2 (yang ditumpuk di atas Container 1)
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    margin: EdgeInsets.all(lebar * 0.05),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(241, 180, 187,
                          1), // Warna latar belakang untuk mode terang
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Colors.black, // Warna border
                        width: 2.0, // Lebar border
                      ),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          "Agditha Evalyn Lolongan",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'AutofillHints.creditCardFamilyName',
                            color: Color.fromRGBO(19, 32, 67, 1),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "${user?.email}",
                          style: const TextStyle(
                            fontSize: 15,
                            fontFamily: 'AutofillHints.countryCode',
                            color: Color.fromRGBO(19, 32, 67, 1),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Informatika A'2021",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'AutofillHints.countryCode',
                            color: Color.fromRGBO(19, 32, 67, 1),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                //informasi dataa pribadi lainnya
                Positioned(
                  top: 130,
                  left: 0,
                  right: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(lebar * 0.1, 0, 0, 0),
                          child: const Icon(
                            Icons.favorite,
                            color: Color.fromRGBO(19, 32, 67, 1),
                          ),
                        ),
                        SizedBox(width: lebar * 0.05),
                        Text(
                          "CARIIN",
                          style: TextStyle(
                            fontSize: lebar * 0.05,
                            color: const Color.fromRGBO(19, 32, 67, 1),
                          ),
                        ),
                      ]),
                      const SizedBox(height: 20),
                      Row(children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(lebar * 0.1, 0, 0, 0),
                          child: const Icon(
                            Icons.email,
                            color: Color.fromRGBO(19, 32, 67, 1),
                          ),
                        ),
                        SizedBox(width: lebar * 0.05),
                        Text(
                          "ditaevalin28@gmail.com",
                          style: TextStyle(
                            fontSize: lebar * 0.05,
                            color: const Color.fromRGBO(19, 32, 67, 1),
                          ),
                        ),
                      ]),
                      const SizedBox(height: 20),
                      Row(children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(lebar * 0.1, 0, 0, 0),
                          child: const Icon(
                            Icons.school,
                            color: Color.fromRGBO(19, 32, 67, 1),
                          ),
                        ),
                        SizedBox(width: lebar * 0.05),
                        Text(
                          "UNIVERSITAS MULAWARMAN",
                          style: TextStyle(
                            fontSize: lebar * 0.05,
                            color: const Color.fromRGBO(19, 32, 67, 1),
                          ),
                        ),
                      ]),
                      const SizedBox(height: 20),
                      Row(children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(lebar * 0.1, 0, 0, 0),
                          child: const Icon(
                            Icons.work,
                            color: Color.fromRGBO(19, 32, 67, 1),
                          ),
                        ),
                        SizedBox(width: lebar * 0.05),
                        Text(
                          "CALON PENGODING HANDAL",
                          style: TextStyle(
                            fontSize: lebar * 0.05,
                            color: const Color.fromRGBO(19, 32, 67, 1),
                          ),
                        ),
                      ]),
                    ],
                  ),
                )
              ]),
            ])),
        bottomNavigationBar: BottomNavScreen(
          currentIndex: 2,
        ));
  }
}

// //UNTUK ATUR ANIMASI FOTO
// class fotoku extends StatelessWidget {
//   double _size = 230;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         _size = _size == 100 ? 80 : 130;
//       },
//       child: TweenAnimationBuilder<double>(
//         tween: Tween<double>(begin: _size == 80 ? 180 : 130, end: _size),
//         duration: const Duration(seconds: 1),
//         curve: Curves.easeInOut,
//         builder: (context, value, child) {
//           return ClipOval(
//             child: Container(
//               width: value,
//               height: value,
//               decoration: const BoxDecoration(
//                 image: DecorationImage(
//                   fit: BoxFit.cover,
//                   image: AssetImage('images/bali.jpg'),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
