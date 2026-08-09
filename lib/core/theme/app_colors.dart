import 'package:flutter/material.dart';

/// Centralized color tokens for StudyVault design system.
///
/// Strictly adhere to the approved color palette:
/// - Background: `#050816`
/// - Surface: `#12182E`
/// - Card: `#1B2340`
/// - Primary: `#8B7DFF`
/// - Secondary: `#63F2E8`
/// - Success: `#62FFB5`
/// - Warning: `#FFD98A`
/// - Error: `#FF6B81`
/// - Text Primary: `#F8FAFC`
/// - Text Secondary: `#AAB3D0`
/// - Hint: `#6B7394`
abstract final class AppColors {
  // --- Core Palette ---
  static const Color background = Color(0xFF050816);
  static const Color surface = Color(0xFF12182E);
  static const Color card = Color(0xFF1B2340);

  // --- Brand Accents ---
  static const Color primary = Color(0xFF8B7DFF);
  static const Color secondary = Color(0xFF63F2E8);

  // --- Semantic Feedback ---
  static const Color success = Color(0xFF62FFB5);
  static const Color warning = Color(0xFFFFD98A);
  static const Color error = Color(0xFFFF6B81);

  // --- Typography & Content ---
  static const Color textPrimary = Color(0xFFF8FAFC);
  static const Color textSecondary = Color(0xFFAAB3D0);
  static const Color hint = Color(0xFF6B7394);

  // --- Glass & Border Tokens ---
  static const Color glassFill = Color(0x661B2340);
  static const Color glassBorder = Color(0x288B7DFF);
  static const Color glassBorderSubtle = Color(0x1FAAB3D0);
  static const Color divider = Color(0x1F6B7394);
  static const Color overlay = Color(0xB3050816);

  // --- Gradients ---
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      Color(0xFF8B7DFF),
      Color(0xFF63F2E8),
    ],
  );

  static const LinearGradient cardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      Color(0xFF1B2340),
      Color(0xFF12182E),
    ],
  );

  static const LinearGradient glowGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[
      Color(0x338B7DFF),
      Color(0x00050816),
    ],
  );
}
