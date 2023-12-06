import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sweet_escape_apps/signIn.dart';
import 'ProfileMenuWidget.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'authentication.dart';
import 'home_page.dart';
import 'theme.dart';
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
      appBar: AppBar(
        backgroundColor: colorMode.secondary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
      ),
      body: Container(
          decoration: BoxDecoration(
            color: colorMode.secondary,
            // Warna latar belakang untuk mode terang
            //borderRadius: BorderRadius.circular(10.0),
          ),
          child: ListView(children: [
            //BAGIAN UNTUK FOTO PROFIL
            const SizedBox(height: 40),
            Center(
                child: ClipOval(
              child: Container(
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://i0.wp.com/studiolorier.com/wp-content/uploads/2018/10/Profile-Round-Sander-Lorier.jpg"),
                  ),
                ),
              ),
            )),
            const SizedBox(height: 40),

            // INFORMASI
            Stack(children: [
              // Container 1 (yang di belakang)
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, tinggi * 0.09, 0, 0),
                  padding: EdgeInsets.fromLTRB(40, tinggi * 0.1, 22, 200),
                  decoration: BoxDecoration(
                    color: colorMode.onPrimary,
                    // Warna latar belakang untuk mode terang
                    borderRadius: BorderRadius.circular(10.0),

                    border: Border.all(
                      color: Colors.white, // Warna border
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
                    color: colorMode
                        .onSecondary, // Warna latar belakang untuk mode terang
                    borderRadius: BorderRadius.circular(40.0),
                    // border: Border.all(
                    //   color: Colors.white, // Warna border
                    //   width: 2.0, // Lebar border
                    // ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        "$username",
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'AutofillHints.creditCardFamilyName',
                          color: Color.fromRGBO(19, 32, 67, 1),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "${user?.email}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'AutofillHints.creditCardFamilyName',
                          color: Color.fromRGBO(19, 32, 67, 1),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              //informasi dataa pribadi lainnya
              Positioned(
                top: 120,
                left: 0,
                right: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// -- MENU
                    ProfileMenuWidget(
                        title: "Information",
                        icon: LineAwesomeIcons.info,
                        onPress: () {}),
                    const Divider(
                      indent: 15,
                      endIndent: 15,
                    ),
                    ProfileMenuWidget(
                        title: "Help",
                        icon: LineAwesomeIcons.helping_hands,
                        onPress: () {}),
                    const Divider(
                      indent: 15,
                      endIndent: 15,
                    ),
                    const SizedBox(height: 10),
                    ProfileMenuWidget(
                        title: "Logout",
                        icon: LineAwesomeIcons.alternate_sign_out,
                        endIcon: false,
                        onPress: () async {
                          // Call the logout method
                          await Auth().logout();

                          // Navigate to the login or home page after logout
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()),
                          );
                        }),
                    const Divider(
                      indent: 15,
                      endIndent: 15,
                    ),
                  ],
                ),
              )
            ]),
          ])),
      bottomNavigationBar: BottomNavScreen(
        currentIndex: 2,
      ),
    );
  }
}
