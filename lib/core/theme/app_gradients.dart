import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Centralized gradients for the Celestial Knowledge design language.
abstract final class AppGradients {
  // --- Brand & Accent Gradients ---
  static const LinearGradient primary = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      AppColors.primary,
      AppColors.secondary,
    ],
  );

  static const LinearGradient secondary = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      AppColors.secondary,
      AppColors.success,
    ],
  );

  // --- Card & Surface Gradients ---
  static const LinearGradient card = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      Color(0xFF1B2340),
      Color(0xFF12182E),
    ],
  );

  static const LinearGradient surface = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[
      Color(0xFF161E38),
      Color(0xFF0F1528),
    ],
  );

  // --- Glow & Cosmic Aura Gradients ---
  static const LinearGradient glow = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[
      Color(0x338B7DFF),
      Color(0x00050816),
    ],
  );

  static const RadialGradient cosmicAura = RadialGradient(
    colors: <Color>[
      Color(0x288B7DFF),
      Color(0x1463F2E8),
      Colors.transparent,
    ],
    stops: <double>[0.0, 0.45, 1.0],
  );

  // --- Glassmorphism Border Gradients ---
  static const LinearGradient glassBorder = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      Color(0x528B7DFF),
      Color(0x1FAAB3D0),
      Color(0x3863F2E8),
    ],
    stops: <double>[0.0, 0.5, 1.0],
  );

  // --- Rating & Accent Gradients ---
  static const LinearGradient rating = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      Color(0xFFFFD98A),
      Color(0xFFFFB347),
    ],
  );
}
