import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sweet_escape_apps/OnBoarding_Screen.dart';
import 'package:sweet_escape_apps/firebase_options.dart';
import 'package:sweet_escape_apps/input_page.dart';
import 'signIn.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //untuk datanya bisa masuk dalam firebasenya
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
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF66A2AD),
        ),
        useMaterial3: true,
      ),
      // home: StreamBuilder<User?>(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      //       return const Reservasi();
      //     } else {
      //       return const Login();
      //     }
      //   },
      // ),
      home: Reservasi(),
    );
  }
}
