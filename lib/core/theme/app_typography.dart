import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTypography {
  static TextStyle displayLarge = GoogleFonts.hankenGrotesk(
    fontSize: 48,
    fontWeight: FontWeight.w800,
    height: 56 / 48,
    letterSpacing: -0.02 * 48,
  );

  static TextStyle headlineLarge = GoogleFonts.hankenGrotesk(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    height: 40 / 32,
  );

  static TextStyle headlineLargeMobile = GoogleFonts.hankenGrotesk(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 32 / 24,
  );

  static TextStyle bodyMedium = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 24 / 16,
  );

  static TextStyle bodyMediumMedium = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 24 / 16,
  );

  static TextStyle bodyMediumBold = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    height: 24 / 16,
  );

  static TextStyle labelMono = GoogleFonts.jetBrainsMono(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 20 / 14,
  );
}
