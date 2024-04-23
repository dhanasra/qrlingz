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
        tertiary: ColorConst.primaryLight.withOpacity(0.4)
      ),

      textTheme: TextTheme(
        titleSmall: GoogleFonts.lato(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: GoogleFonts.lato(
          fontSize: 18,
          height: 1,
          fontWeight: FontWeight.w500,
        ),
        titleLarge: GoogleFonts.lato(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        bodySmall: GoogleFonts.lato(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ), 
        labelSmall: GoogleFonts.lato(
          fontSize: 10,
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

      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        fillColor: Colors.white,
        filled: true,
        hintStyle: GoogleFonts.lato(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: Colors.black.withOpacity(0.32),
          letterSpacing: 0.15,
        ),
        errorStyle: GoogleFonts.lato(
          fontWeight: FontWeight.w600,
          fontSize: 12,
          color: Colors.red,
        ),
        floatingLabelStyle: // use the material state and asssign color accordingly
            GoogleFonts.lato(
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.redAccent,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black54,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black12,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black54,
            width: 1.4,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
      )

    );
  }

}