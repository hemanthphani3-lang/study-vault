import 'package:flutter/material.dart';

/// Centralized animation durations and motion curves for StudyVault.
///
/// Rule: All animated transitions, hero cards, and pulse indicators must
/// reference [AppDurations].
abstract final class AppDurations {
  // --- Duration Scale ---
  static const Duration instant = Duration.zero;
  static const Duration fast = Duration(milliseconds: 150);
  static const Duration normal = Duration(milliseconds: 250);
  static const Duration medium = Duration(milliseconds: 350);
  static const Duration slow = Duration(milliseconds: 500);
  static const Duration extraSlow = Duration(milliseconds: 800);
  static const Duration pulseCycle = Duration(milliseconds: 1800);
  static const Duration splashDuration = Duration(milliseconds: 2200);

  // --- Standard Easing Curves ---
  static const Curve standardEasing = Curves.easeInOutCubicEmphasized;
  static const Curve sharpEasing = Curves.easeInOutQuad;
  static const Curve bounceEasing = Curves.easeOutBack;
  static const Curve smooth = Curves.easeInOut;
  static const Curve entranceCurve = Curves.easeOutCubic;
}
