import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sweet_escape_apps/OnBoarding_Screen.dart';
import 'package:sweet_escape_apps/firebase_options.dart';
import 'package:sweet_escape_apps/home_page.dart';
import 'package:sweet_escape_apps/input_page.dart';
import 'signIn.dart';

void main() async {
  //untuk datanya bisa masuk dalam firebasenya
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;//fungsi  buat akses atribut dari fungsi di firestore 
    CollectionReference dataReservasi = firestore.collection("data_reservasi"); //buat tabel
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF66A2AD),
        ),
        useMaterial3: true,
      ),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomePage();
          } else {
            return const Login();
          }
        },
      ),
      //Reservasi(),
    );
  }
}
