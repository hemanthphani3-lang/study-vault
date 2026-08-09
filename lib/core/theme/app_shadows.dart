import 'package:flutter/material.dart';

/// Centralized elevation and soft celestial glow shadows for StudyVault.
abstract final class AppShadows {
  // Subtle surface elevation
  static const List<BoxShadow> subtle = <BoxShadow>[
    BoxShadow(
      color: Color(0x33000000),
      offset: Offset(0, 4),
      blurRadius: 12,
      spreadRadius: 0,
    ),
  ];

  // Elevated card shadow
  static const List<BoxShadow> card = <BoxShadow>[
    BoxShadow(
      color: Color(0x4D000000),
      offset: Offset(0, 8),
      blurRadius: 24,
      spreadRadius: -2,
    ),
  ];

  // Floating card shadow (Linear / Arc Browser style depth)
  static const List<BoxShadow> floating = <BoxShadow>[
    BoxShadow(
      color: Color(0x66000000),
      offset: Offset(0, 16),
      blurRadius: 36,
      spreadRadius: -4,
    ),
    BoxShadow(
      color: Color(0x1A8B7DFF),
      offset: Offset(0, 4),
      blurRadius: 20,
      spreadRadius: 0,
    ),
  ];

  // Brand primary glowing aura
  static const List<BoxShadow> primaryGlow = <BoxShadow>[
    BoxShadow(
      color: Color(0x4D8B7DFF),
      offset: Offset(0, 4),
      blurRadius: 16,
      spreadRadius: 0,
    ),
  ];

  // Secondary neon cyan aura
  static const List<BoxShadow> secondaryGlow = <BoxShadow>[
    BoxShadow(
      color: Color(0x4D63F2E8),
      offset: Offset(0, 4),
      blurRadius: 16,
      spreadRadius: 0,
    ),
  ];

  // Active verified badge / node glow
  static const List<BoxShadow> successGlow = <BoxShadow>[
    BoxShadow(
      color: Color(0x4D62FFB5),
      offset: Offset(0, 2),
      blurRadius: 8,
      spreadRadius: 0,
    ),
  ];
}
