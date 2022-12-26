import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get lightPalette {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xfff1f2f2),
      fontFamily: GoogleFonts.montserrat().fontFamily,
      colorScheme: ThemeData(brightness: Brightness.light).colorScheme.copyWith(
            background: Colors.white,
            primary: Colors.deepPurple,
          ),
    );
  }
}
