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
  primaryContainer: Color.fromARGB(255, 0, 0, 0),
);


IconThemeData iconMode = IconThemeData(
  color: colorMode.onPrimary,
);
