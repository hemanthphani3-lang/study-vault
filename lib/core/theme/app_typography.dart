import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// Centralized typography definitions for StudyVault.
///
/// Hierarchy Rules:
/// - Space Grotesk: Display, Headline, and Title styles (academic authority & futuristic aesthetic).
/// - Inter: Body, Label, and Caption styles (maximum readability for dense academic texts).
abstract final class AppTypography {
  // --- Space Grotesk: Display Styles ---
  static TextStyle get displayLarge => GoogleFonts.spaceGrotesk(
        fontSize: 34.0,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.8,
        color: AppColors.textPrimary,
        height: 1.2,
      );

  static TextStyle get displayMedium => GoogleFonts.spaceGrotesk(
        fontSize: 28.0,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.6,
        color: AppColors.textPrimary,
        height: 1.25,
      );

  static TextStyle get displaySmall => GoogleFonts.spaceGrotesk(
        fontSize: 24.0,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.4,
        color: AppColors.textPrimary,
        height: 1.3,
      );

  // --- Space Grotesk: Headline Styles ---
  static TextStyle get headlineLarge => GoogleFonts.spaceGrotesk(
        fontSize: 22.0,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.3,
        color: AppColors.textPrimary,
        height: 1.3,
      );

  static TextStyle get headlineMedium => GoogleFonts.spaceGrotesk(
        fontSize: 19.0,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.2,
        color: AppColors.textPrimary,
        height: 1.35,
      );

  static TextStyle get headlineSmall => GoogleFonts.spaceGrotesk(
        fontSize: 17.0,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.1,
        color: AppColors.textPrimary,
        height: 1.4,
      );

  // --- Space Grotesk: Title Styles ---
  static TextStyle get titleLarge => GoogleFonts.spaceGrotesk(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.0,
        color: AppColors.textPrimary,
        height: 1.4,
      );

  static TextStyle get titleMedium => GoogleFonts.spaceGrotesk(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
        color: AppColors.textPrimary,
        height: 1.45,
      );

  static TextStyle get titleSmall => GoogleFonts.spaceGrotesk(
        fontSize: 13.0,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        color: AppColors.textSecondary,
        height: 1.45,
      );

  // --- Inter: Body Styles ---
  static TextStyle get bodyLarge => GoogleFonts.inter(
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        color: AppColors.textPrimary,
        height: 1.5,
      );

  static TextStyle get bodyMedium => GoogleFonts.inter(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.2,
        color: AppColors.textSecondary,
        height: 1.5,
      );

  static TextStyle get bodySmall => GoogleFonts.inter(
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: AppColors.textSecondary,
        height: 1.5,
      );

  // --- Inter: Label Styles ---
  static TextStyle get labelLarge => GoogleFonts.inter(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.3,
        color: AppColors.textPrimary,
        height: 1.4,
      );

  static TextStyle get labelMedium => GoogleFonts.inter(
        fontSize: 12.0,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.4,
        color: AppColors.textSecondary,
        height: 1.4,
      );

  static TextStyle get labelSmall => GoogleFonts.inter(
        fontSize: 10.0,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
        color: AppColors.hint,
        height: 1.3,
      );

  // --- Inter: Caption & Specialized ---
  static TextStyle get caption => GoogleFonts.inter(
        fontSize: 11.0,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.3,
        color: AppColors.hint,
        height: 1.35,
      );

  static TextStyle get codeSnippet => GoogleFonts.jetBrainsMono(
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
        color: AppColors.secondary,
        height: 1.4,
      );

  /// Builds a complete Material 3 [TextTheme] mapped to StudyVault tokens.
  static TextTheme get textTheme => TextTheme(
        displayLarge: displayLarge,
        displayMedium: displayMedium,
        displaySmall: displaySmall,
        headlineLarge: headlineLarge,
        headlineMedium: headlineMedium,
        headlineSmall: headlineSmall,
        titleLarge: titleLarge,
        titleMedium: titleMedium,
        titleSmall: titleSmall,
        bodyLarge: bodyLarge,
        bodyMedium: bodyMedium,
        bodySmall: bodySmall,
        labelLarge: labelLarge,
        labelMedium: labelMedium,
        labelSmall: labelSmall,
      );
}
