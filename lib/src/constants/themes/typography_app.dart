import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myflix/src/constants/themes/themes.dart';

class TypographyApp {
  
  static TextStyle headline1 = TextStyle(
    fontFamily: GoogleFonts.openSans().fontFamily,
    fontSize: 26,
    fontWeight: FontWeight.w700,
    color: ColorApp.black,
  );

  static TextStyle headline2 = TextStyle(
    fontFamily: GoogleFonts.openSans().fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: ColorApp.black,
  );

  static TextStyle headline3 = TextStyle(
    fontFamily: GoogleFonts.openSans().fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: ColorApp.black,
  );

  static TextStyle text1 = TextStyle(
    fontFamily: GoogleFonts.openSans().fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: ColorApp.black,
  );

  static TextStyle text2 = TextStyle(
    fontFamily: GoogleFonts.openSans().fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: ColorApp.black,
  );

  static TextStyle subText1 = TextStyle(
    fontFamily: GoogleFonts.openSans().fontFamily,
    fontSize: 10,
    fontWeight: FontWeight.w300,
    color: ColorApp.black,
  );
}