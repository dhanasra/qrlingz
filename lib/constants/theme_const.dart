import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrlingz_app/constants/color_const.dart';

class ThemeConst {

  ThemeConst._();

  static getApplicationTheme(bool isDark){

    return ThemeData(
      scaffoldBackgroundColor: isDark ? const Color(0xFF383838) : Colors.white,
      fontFamily: GoogleFonts.lato().fontFamily,
      
      primaryColorDark: isDark ? ColorConst.primary: Colors.white,
      primaryColor: isDark ? ColorConst.primaryLight: ColorConst.primary,
      primaryColorLight: ColorConst.primaryLight,

      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: isDark ? const Color(0xFF383838) : Colors.white,
        iconTheme: IconThemeData(
          color: isDark ? Colors.white :const Color(0xFF383838)
        ),
        titleTextStyle: GoogleFonts.lato(
          color: isDark ? ColorConst.primaryLight :ColorConst.primary,
          fontSize: 22,
          fontWeight: FontWeight.w600),
      ),

      colorScheme: ThemeData().colorScheme.copyWith(
        primary: ColorConst.primary,
        secondary: Colors.white,
        tertiary: ColorConst.primaryLight.withOpacity(0.4)
      ),

      iconTheme: IconThemeData(
        color: !isDark ? ColorConst.primary : ColorConst.primaryLight,
      ),

      cardColor: isDark ? Colors.black : Colors.white,
      shadowColor: isDark ? const Color(0xFF444444) : const Color(0x88DFDFDF),

      textTheme: TextTheme(
        titleSmall: GoogleFonts.lato(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: !isDark ? const Color(0xFF383838) : Colors.white,
        ),
        titleMedium: GoogleFonts.lato(
          fontSize: 18,
          height: 1,
          fontWeight: FontWeight.w500,
          color: !isDark ? const Color(0xFF383838) : Colors.white,
        ),
        titleLarge: GoogleFonts.lato(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: !isDark ? const Color(0xFF383838) : Colors.white,
        ),
        headlineMedium: GoogleFonts.lato(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: !isDark ? const Color(0xFF383838) : Colors.white,
        ),
        headlineSmall: GoogleFonts.lato(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: !isDark ? const Color(0xFF383838) : Colors.white,
        ),
        bodySmall: GoogleFonts.lato(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: !isDark ? const Color(0xFF383838) : Colors.white,
        ), 
        bodyMedium: GoogleFonts.lato(
          color: !isDark ? const Color(0xFF383838) : Colors.white,
        ),
        bodyLarge: GoogleFonts.lato(
          color: !isDark ? const Color(0xFF383838) : Colors.white,
        ),
        labelLarge: GoogleFonts.lato(
          color: !isDark ? const Color(0xFF383838) : Colors.white,
        ),
        labelSmall: GoogleFonts.lato(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: !isDark ? const Color(0xFF383838) : Colors.white,
        )
      ),

      listTileTheme: ListTileThemeData(
        iconColor:  !isDark ? ColorConst.primary : ColorConst.primaryLight,
        titleTextStyle: GoogleFonts.lato(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: !isDark ? Colors.black : Colors.white,
        )
      ),

      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStatePropertyAll(!isDark ? ColorConst.primary : ColorConst.primaryLight),
        checkColor: MaterialStatePropertyAll(!isDark ? Colors.white : ColorConst.primary),
      ),

      radioTheme: RadioThemeData(
        fillColor: MaterialStatePropertyAll(!isDark ? ColorConst.primary : ColorConst.primaryLight),
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
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        fillColor: Colors.white,
        filled: true,
        helperMaxLines: 2,
        hintStyle: GoogleFonts.lato(
          fontWeight: FontWeight.w400,
          fontSize: 15,
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