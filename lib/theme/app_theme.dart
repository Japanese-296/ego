// THEME LOCK: light (primary) + dark (selectable) — source: domain signal (consumer gamified) + user prompt
// Scaffold.backgroundColor = AppTheme.backgroundLight / backgroundDark — ALL screens

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Primary palette — anime-inspired violet/purple
  static const Color primary = Color(0xFF7C3AED);
  static const Color primaryLight = Color(0xFFA855F7);
  static const Color primaryContainer = Color(0xFFEDE9FE);
  static const Color secondary = Color(0xFFEAB308);
  static const Color secondaryContainer = Color(0xFFFEF9C3);
  static const Color accent = Color(0xFF06B6D4);

  // Semantic colors
  static const Color success = Color(0xFF059669);
  static const Color warning = Color(0xFFD97706);
  static const Color error = Color(0xFFDC2626);
  static const Color info = Color(0xFF2563EB);

  // Neon glow colors
  static const Color neonPurple = Color(0xFFA855F7);
  static const Color neonCyan = Color(0xFF22D3EE);
  static const Color neonYellow = Color(0xFFFBBF24);
  static const Color neonGreen = Color(0xFF34D399);

  // Light theme surfaces
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceVariantLight = Color(0xFFF5F3FF);
  static const Color backgroundLight = Color(0xFFF8F7FF);
  static const Color cardLight = Color(0xFFFFFFFF);

  // Dark theme surfaces
  static const Color surfaceDark = Color(0xFF1A1025);
  static const Color surfaceVariantDark = Color(0xFF2D1B4E);
  static const Color backgroundDark = Color(0xFF0D0A1A);
  static const Color cardDark = Color(0xFF1E1535);

  // Glass effect colors
  static const Color glassLight = Color(0x99FFFFFF);
  static const Color glassDark = Color(0x331A1025);
  static const Color glassBorderLight = Color(0x66FFFFFF);
  static const Color glassBorderDark = Color(0x33A855F7);

  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
      primary: primary,
      onPrimary: Colors.white,
      primaryContainer: primaryContainer,
      onPrimaryContainer: Color(0xFF3B0764),
      secondary: secondary,
      onSecondary: Colors.white,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: Color(0xFF713F12),
      surface: surfaceLight,
      onSurface: Color(0xFF1A1A2E),
      surfaceContainerHighest: surfaceVariantLight,
      onSurfaceVariant: Color(0xFF4C4469),
      error: error,
      onError: Colors.white,
      outline: Color(0xFFCBBEF0),
      outlineVariant: Color(0xFFEDE9FE),
      shadow: Color(0x1A7C3AED),
      scrim: Color(0x807C3AED),
      inverseSurface: Color(0xFF1A1025),
      onInverseSurface: Color(0xFFF5F3FF),
    ),
    scaffoldBackgroundColor: backgroundLight,
    textTheme: GoogleFonts.outfitTextTheme(
      const TextTheme(
        displayLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w800,
          letterSpacing: -0.5,
        ),
        displayMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.3,
        ),
        displaySmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        headlineLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
        headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        headlineSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        titleLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        titleMedium: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          height: 1.5,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          height: 1.5,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          height: 1.4,
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.2,
        ),
        labelMedium: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.3,
        ),
        labelSmall: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.4,
        ),
      ),
    ),
    appBarTheme: const AppBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      iconTheme: IconThemeData(color: Color(0xFF1A1A2E)),
    ),
    cardTheme: CardThemeData(
      color: surfaceLight,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.zero,
    ),
    inputDecorationTheme: InputDecorationThemeData(
      filled: true,
      fillColor: const Color(0x0F7C3AED),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Color(0x337C3AED)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Color(0x337C3AED)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: primary, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: error),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: surfaceVariantLight,
      selectedColor: primaryContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      labelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
    ),
  );

  static ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(
      primary: primaryLight,
      onPrimary: Colors.white,
      primaryContainer: Color(0xFF3B0764),
      onPrimaryContainer: Color(0xFFEDE9FE),
      secondary: secondary,
      onSecondary: Color(0xFF1A1025),
      secondaryContainer: Color(0xFF713F12),
      onSecondaryContainer: Color(0xFFFEF9C3),
      surface: surfaceDark,
      onSurface: Color(0xFFE8E0FF),
      surfaceContainerHighest: surfaceVariantDark,
      onSurfaceVariant: Color(0xFFCBBEF0),
      error: Color(0xFFFF6B6B),
      onError: Color(0xFF1A1025),
      outline: Color(0xFF4C3D6B),
      outlineVariant: Color(0xFF2D1B4E),
      shadow: Color(0x4D000000),
      scrim: Color(0xCC0D0A1A),
      inverseSurface: Color(0xFFF5F3FF),
      onInverseSurface: Color(0xFF1A1025),
    ),
    scaffoldBackgroundColor: backgroundDark,
    textTheme: GoogleFonts.outfitTextTheme(
      const TextTheme(
        displayLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w800,
          letterSpacing: -0.5,
          color: Color(0xFFE8E0FF),
        ),
        displayMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.3,
          color: Color(0xFFE8E0FF),
        ),
        displaySmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: Color(0xFFE8E0FF),
        ),
        headlineLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: Color(0xFFE8E0FF),
        ),
        headlineMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Color(0xFFE8E0FF),
        ),
        headlineSmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Color(0xFFE8E0FF),
        ),
        titleLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color(0xFFE8E0FF),
        ),
        titleMedium: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Color(0xFFE8E0FF),
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color(0xFFCBBEF0),
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          height: 1.5,
          color: Color(0xFFCBBEF0),
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          height: 1.5,
          color: Color(0xFFCBBEF0),
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          height: 1.4,
          color: Color(0xFF9D8EC4),
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.2,
          color: Color(0xFFE8E0FF),
        ),
        labelMedium: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.3,
          color: Color(0xFFCBBEF0),
        ),
        labelSmall: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.4,
          color: Color(0xFF9D8EC4),
        ),
      ),
    ),
    appBarTheme: const AppBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      iconTheme: IconThemeData(color: Color(0xFFE8E0FF)),
    ),
    cardTheme: CardThemeData(
      color: surfaceDark,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.zero,
    ),
    inputDecorationTheme: InputDecorationThemeData(
      filled: true,
      fillColor: const Color(0x1AA855F7),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Color(0x4DA855F7)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Color(0x4DA855F7)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: primaryLight, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Color(0xFFFF6B6B)),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      labelStyle: const TextStyle(color: Color(0xFF9D8EC4)),
      hintStyle: const TextStyle(color: Color(0xFF6B5B8E)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryLight,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: surfaceVariantDark,
      selectedColor: const Color(0xFF3B0764),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      labelStyle: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: Color(0xFFCBBEF0),
      ),
    ),
  );
}
