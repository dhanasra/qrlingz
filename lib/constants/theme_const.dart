import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrlingz_app/constants/color_const.dart';

class ThemeConst {

  ThemeConst._();

  static getApplicationTheme(){

    return ThemeData(
      fontFamily: GoogleFonts.montserrat().fontFamily,
      colorScheme: ThemeData().colorScheme.copyWith(
        primary: ColorConst.primary,
        secondary: Colors.white
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 7,
          textStyle: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600),
          foregroundColor: Colors.white,
          backgroundColor: ColorConst.primary,
          minimumSize: const Size.fromHeight(45),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }

}