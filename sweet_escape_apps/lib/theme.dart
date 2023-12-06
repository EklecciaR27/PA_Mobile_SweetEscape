import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  surface: Color.fromARGB(255, 255, 255, 255),
  inverseSurface: Color(0xFF66A2AD),
  onSurface: Color.fromRGBO(0, 0, 0, 1),
  onTertiary: Color.fromARGB(255, 102, 162, 173),
  primaryContainer: Color.fromARGB(255, 0, 0, 0),
);

IconThemeData iconMode = IconThemeData(
  color: colorMode.onPrimary,
);

TextTheme teksMode = TextTheme(
  headlineLarge: TextStyle(
      fontSize: 5, fontWeight: FontWeight.bold, color: Color(0xFF35656F)),
  headlineMedium: GoogleFonts.montserrat(
      color: Color.fromARGB(255, 0, 0, 0),
      fontSize: 20,
      fontWeight: FontWeight.bold // warna hitam
      ),
  headlineSmall: TextStyle(
    color: Color(0xFF35656F),
    fontSize: 25,
    fontWeight: FontWeight.bold,
  ),
  bodyMedium: GoogleFonts.montserrat(
    color: Color.fromARGB(255, 0, 0, 0),
    fontSize: 15,
  ),
);
