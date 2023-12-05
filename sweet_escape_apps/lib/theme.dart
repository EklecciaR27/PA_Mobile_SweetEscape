import 'package:flutter/material.dart';

// tema color
ColorScheme colorMode = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 138, 183, 186),
  primary: Color(0xFF66A2AD),
  secondary: Color.fromARGB(255, 138, 183, 186),
  onSecondary: Color.fromARGB(255, 241, 213, 189),
  onPrimary: Colors.white,
  onPrimaryContainer: Colors.grey,
  tertiary: Colors.amber,
  inversePrimary: Colors.amber[100],
  surface: Color(0xFF35656F),
  inverseSurface: Color(0xFF66A2AD),
  onSurface: Color.fromRGBO(127, 127, 127, 1),
  onTertiary: Color.fromARGB(255, 102, 162, 173),
  primaryContainer: Colors.transparent,
);

// tema teks style: Theme.of(context).textTheme.displayLarge,
TextTheme teksMode = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: 'AutofillHints.creditCardFamilyName',
      color: colorMode.primaryContainer, // warna hitam
    ),
    headlineMedium: TextStyle(
        color: colorMode.primaryContainer,
        fontSize: 30,
        fontWeight: FontWeight.bold // warna hitam
        ),
    headlineSmall: TextStyle(
      color: colorMode.primaryContainer,
      fontSize: 20, // warna putih
    ),
    bodyMedium: TextStyle(
      color: colorMode.surface,
      fontSize: 25,
      fontWeight: FontWeight.bold,
    ));

IconThemeData iconMode = IconThemeData(
  color: colorMode.onPrimary,
);

// tema elevated button
// ElevatedButtonThemeData btnMode = ElevatedButtonThemeData(
//   style: ElevatedButton.styleFrom(
//     elevation: 0.7,
//     backgroundColor: Color(0xFFA8E25C),
//     foregroundColor: Colors.white,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(6),
//     ),
//     textStyle: TextStyle(
//       fontSize: 26,
//       fontFamily: "dity",
//       color: colorMode.onPrimaryContainer,
//     ),
//   ),
// );
