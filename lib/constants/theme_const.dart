import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeConst {

  ThemeConst._();

  static getApplicationTheme(){

    return ThemeData(
      fontFamily: GoogleFonts.montserrat().fontFamily,
      colorScheme: ThemeData().colorScheme.copyWith(
        primary: const Color(0xFF201A3F),
        secondary: Colors.white
      )
    );
  }

}