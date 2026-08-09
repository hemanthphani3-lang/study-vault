import 'package:flutter/material.dart';

/// Centralized border radius design tokens for StudyVault.
///
/// Rule: All corner smoothing, cards, and buttons must use [AppRadius].
abstract final class AppRadius {
  // --- Raw Radius Values ---
  static const double none = 0.0;
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 20.0;
  static const double xxl = 24.0;
  static const double xxxl = 32.0;
  static const double full = 999.0;

  // --- Radius Objects ---
  static const Radius radXs = Radius.circular(xs);
  static const Radius radSm = Radius.circular(sm);
  static const Radius radMd = Radius.circular(md);
  static const Radius radLg = Radius.circular(lg);
  static const Radius radXl = Radius.circular(xl);
  static const Radius radXxl = Radius.circular(xxl);
  static const Radius radFull = Radius.circular(full);

  // --- BorderRadius Tokens ---
  static const BorderRadius rNone = BorderRadius.zero;
  static const BorderRadius rXs = BorderRadius.all(radXs);
  static const BorderRadius rSm = BorderRadius.all(radSm);
  static const BorderRadius rMd = BorderRadius.all(radMd);
  static const BorderRadius rLg = BorderRadius.all(radLg);
  static const BorderRadius rXl = BorderRadius.all(radXl);
  static const BorderRadius rXxl = BorderRadius.all(radXxl);
  static const BorderRadius rFull = BorderRadius.all(radFull);

  // --- Top/Bottom Specific ---
  static const BorderRadius rTopXl = BorderRadius.vertical(top: radXl);
  static const BorderRadius rTopXxl = BorderRadius.vertical(top: radXxl);
  static const BorderRadius rBottomXl = BorderRadius.vertical(bottom: radXl);

  // --- Standard Shape Borders ---
  static const RoundedRectangleBorder shapeXs = RoundedRectangleBorder(borderRadius: rXs);
  static const RoundedRectangleBorder shapeSm = RoundedRectangleBorder(borderRadius: rSm);
  static const RoundedRectangleBorder shapeMd = RoundedRectangleBorder(borderRadius: rMd);
  static const RoundedRectangleBorder shapeLg = RoundedRectangleBorder(borderRadius: rLg);
  static const RoundedRectangleBorder shapeXl = RoundedRectangleBorder(borderRadius: rXl);
  static const RoundedRectangleBorder shapeXxl = RoundedRectangleBorder(borderRadius: rXxl);
  static const StadiumBorder shapeFull = StadiumBorder();
}
