import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'ProfileMenuWidget.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'authentication.dart';
import 'home_page.dart';
import 'widgets/bottomNav.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
              const SizedBox(height: 100),

              // INFORMASI BERISI NAMA,NIM DAN KELAS.
              Stack(children: [
                // Container 1 (yang di belakang)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, tinggi * 0.10, 0, 0),
                    padding: EdgeInsets.fromLTRB(22, tinggi * 0.1, 22, 300),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 138, 183, 186),
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
                      color: Color.fromARGB(255, 255, 255,
                          255), // Warna latar belakang untuk mode terang
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Colors.black, // Warna border
                        width: 2.0, // Lebar border
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "$username",
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
                      /// -- MENU
                      ProfileMenuWidget(
                          title: "Settings",
                          icon: LineAwesomeIcons.cog,
                          onPress: () {}),
                      const Divider(),
                      const SizedBox(height: 10),
                      ProfileMenuWidget(
                          title: "Information",
                          icon: LineAwesomeIcons.info,
                          onPress: () {}),
                      const Divider(),
                      const SizedBox(height: 10),
                      ProfileMenuWidget(
                          title: "Logout",
                          icon: LineAwesomeIcons.alternate_sign_out,
                          textColor: Colors.red,
                          endIcon: false,
                          onPress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                          }),
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
