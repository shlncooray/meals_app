import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final kDarkTheme = ThemeData(
    textTheme: GoogleFonts.latoTextTheme(),
    colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: const Color.fromARGB(255, 18, 77, 124)));

final kLightTheme = ThemeData(
    textTheme: GoogleFonts.latoTextTheme(),
    colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.light,
        seedColor: const Color.fromARGB(255, 139, 183, 219)));
