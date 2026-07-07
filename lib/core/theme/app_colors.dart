import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color background = Color(0xFF051424);
  static const Color surface = Color(0xFF051424);
  static const Color surfaceDim = Color(0xFF051424);
  static const Color surfaceBright = Color(0xFF2C3A4C);
  static const Color surfaceContainerLowest = Color(0xFF010F1F);
  static const Color surfaceContainerLow = Color(0xFF0D1C2D);
  static const Color surfaceContainer = Color(0xFF122131);
  static const Color surfaceContainerHigh = Color(0xFF1C2B3C);
  static const Color surfaceContainerHighest = Color(0xFF273647);
  
  static const Color onSurface = Color(0xFFD4E4FA);
  static const Color onSurfaceVariant = Color(0xFFC2C6D7);
  static const Color inverseSurface = Color(0xFFD4E4FA);
  static const Color inverseOnSurface = Color(0xFF233143);
  
  static const Color outline = Color(0xFF8C90A0);
  static const Color outlineVariant = Color(0xFF424754);
  
  static const Color primary = Color(0xFFAFC6FF);
  static const Color onPrimary = Color(0xFF002D6D);
  static const Color primaryContainer = Color(0xFF528DFF);
  static const Color onPrimaryContainer = Color(0xFF00275F);
  static const Color inversePrimary = Color(0xFF0059C7);
  
  static const Color secondary = Color(0xFFDDB7FF);
  static const Color onSecondary = Color(0xFF490080);
  static const Color secondaryContainer = Color(0xFF6F00BE);
  static const Color onSecondaryContainer = Color(0xFFD6A9FF);
  
  static const Color tertiary = Color(0xFFFFB68F);
  static const Color onTertiary = Color(0xFF542100);
  static const Color tertiaryContainer = Color(0xFFE96C16);
  static const Color onTertiaryContainer = Color(0xFF4A1C00);

  static const Color error = Color(0xFFFFB4AB);
  static const Color onError = Color(0xFF690005);
  static const Color errorContainer = Color(0xFF93000A);
  static const Color onErrorContainer = Color(0xFFFFDAD6);

  static const Color success = Color(0xFF34D399); // Emerald Success reference
  static const Color warning = Color(0xFFFBBF24); // Amber Warning reference

  // Gradient Colors
  static const Color primaryGradientStart = Color(0xFF2E7DFF);
  static const Color primaryGradientEnd = Color(0xFFA855F7);
}
