import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// tema color
ColorScheme colorMode = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 138, 183, 186),
  primary: const Color(0xFF66A2AD),
  secondary: const Color.fromARGB(255, 138, 183, 186),
  onSecondary: const Color.fromARGB(255, 241, 213, 189),
  onPrimary: Colors.white,
  onPrimaryContainer: Colors.grey,
  tertiary: Colors.amber,
  inversePrimary: Colors.amber[100],
  surface: const Color.fromARGB(255, 255, 255, 255),
  inverseSurface: const Color(0xFF66A2AD),
  onSurface: const Color.fromRGBO(0, 0, 0, 1),
  onTertiary: const Color.fromARGB(255, 102, 162, 173),
  primaryContainer: const Color.fromARGB(255, 0, 0, 0),
);

IconThemeData iconMode = IconThemeData(
  color: colorMode.onPrimary,
);

TextTheme teksMode = TextTheme(
  headlineLarge: GoogleFonts.montserrat(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: const Color.fromARGB(255, 241, 213, 189),
  ),
  headlineMedium: GoogleFonts.montserrat(
      color: const Color.fromARGB(255, 0, 0, 0),
      fontSize: 20,
      fontWeight: FontWeight.bold // warna hitam
      ),
  headlineSmall: const TextStyle(
    color: Color(0xFF35656F),
    fontSize: 25,
    fontWeight: FontWeight.bold,
  ),
  bodyMedium: GoogleFonts.montserrat(
    color: const Color.fromARGB(255, 0, 0, 0),
    fontSize: 15,
  ),
);
