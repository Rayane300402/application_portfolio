import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme{
  static const Color primaryGreen = Color(0xFF334B35);
  static const Color accentOrange = Color(0xFFb76939);
  static const Color primaryGreen72 = Color(0xB8334B35); // 72% opacity
  static const Color accentOrange74 = Color(0xBD60351A);   // 74% opacity
  static const Color textWhite = Color(0xFFFFFFFF);
  static const Color primaryGreen2 = Color(0xFF2C3C2D); // 72% opacity
  static const Color accentOrange2 = Color(0xFFA46139);

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: primaryGreen,
    primaryColor: primaryGreen,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryGreen,
      primary: primaryGreen,
      secondary: accentOrange,
      background: primaryGreen,
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.montserratAlternates(
          fontWeight: FontWeight.w600, color: textWhite),
      displayMedium: GoogleFonts.montserratAlternates(
          fontWeight: FontWeight.w500, color: textWhite),
      bodyLarge: GoogleFonts.montserrat(fontWeight: FontWeight.w500, color: textWhite),
      bodyMedium: GoogleFonts.montserrat(fontWeight: FontWeight.w400, color: textWhite),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: primaryGreen,
      titleTextStyle: GoogleFonts.montserratAlternates(
        fontWeight: FontWeight.w600,
        fontSize: 20,
        color: textWhite,
      ),
      iconTheme: const IconThemeData(color: textWhite),
    ),
  );

}