import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {

  static Color primary = Colors.blueAccent;

  static ThemeData darkTheme = ThemeData(

    colorScheme: ColorScheme.fromSeed(
      seedColor: primary,
      brightness: Brightness.dark
    ),

    appBarTheme: AppBarThemeData(
      backgroundColor: primary,
      centerTitle: true,
    ),

    textTheme: GoogleFonts.montserratTextTheme()
  );

}