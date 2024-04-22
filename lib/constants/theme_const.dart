import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrlingz_app/constants/color_const.dart';

class ThemeConst {

  ThemeConst._();

  static getApplicationTheme(){

    return ThemeData(
      fontFamily: GoogleFonts.lato().fontFamily,

      appBarTheme: AppBarTheme(
        centerTitle: true,
        titleTextStyle: GoogleFonts.lato(
          color: ColorConst.primary,
          fontSize: 22,
          fontWeight: FontWeight.w600),
      ),

      colorScheme: ThemeData().colorScheme.copyWith(
        primary: ColorConst.primary,
        secondary: Colors.white,
      ),

      textTheme: TextTheme(
        titleSmall: GoogleFonts.lato(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        labelSmall: GoogleFonts.lato(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        )
      ),

      listTileTheme: ListTileThemeData(
        iconColor: ColorConst.primary,
        titleTextStyle: GoogleFonts.lato(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black
        )
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 7,
          textStyle: GoogleFonts.lato(
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

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorConst.primary,
        unselectedItemColor: Colors.grey[400],
        selectedLabelStyle: GoogleFonts.lato(
          fontSize: 10,
          fontWeight: FontWeight.w600
        ),
        unselectedLabelStyle: GoogleFonts.lato(
          fontSize: 10,
          fontWeight: FontWeight.w600
        ),
        selectedIconTheme: const IconThemeData(size: 22),
        unselectedIconTheme: const IconThemeData(size: 22),
      ),

      
    );
  }

}