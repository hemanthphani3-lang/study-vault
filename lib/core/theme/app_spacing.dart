import 'package:flutter/material.dart';

/// Centralized spacing tokens for consistent padding, margins, and gaps.
///
/// Rule: Never hardcode numeric values in widgets; always reference [AppSpacing].
abstract final class AppSpacing {
  // --- Raw Metric Constants ---
  static const double none = 0.0;
  static const double xxs = 2.0;
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 20.0;
  static const double xxl = 24.0;
  static const double xxxl = 32.0;
  static const double huge = 48.0;
  static const double massive = 64.0;

  // --- EdgeInsets Tokens ---
  static const EdgeInsets pNone = EdgeInsets.zero;
  static const EdgeInsets pXxs = EdgeInsets.all(xxs);
  static const EdgeInsets pXs = EdgeInsets.all(xs);
  static const EdgeInsets pSm = EdgeInsets.all(sm);
  static const EdgeInsets pMd = EdgeInsets.all(md);
  static const EdgeInsets pLg = EdgeInsets.all(lg);
  static const EdgeInsets pXl = EdgeInsets.all(xl);
  static const EdgeInsets pXxl = EdgeInsets.all(xxl);
  static const EdgeInsets pXxxl = EdgeInsets.all(xxxl);

  // Horizontal Padding
  static const EdgeInsets phSm = EdgeInsets.symmetric(horizontal: sm);
  static const EdgeInsets phMd = EdgeInsets.symmetric(horizontal: md);
  static const EdgeInsets phLg = EdgeInsets.symmetric(horizontal: lg);
  static const EdgeInsets phXl = EdgeInsets.symmetric(horizontal: xl);
  static const EdgeInsets phXxl = EdgeInsets.symmetric(horizontal: xxl);

  // Vertical Padding
  static const EdgeInsets pvSm = EdgeInsets.symmetric(vertical: sm);
  static const EdgeInsets pvMd = EdgeInsets.symmetric(vertical: md);
  static const EdgeInsets pvLg = EdgeInsets.symmetric(vertical: lg);
  static const EdgeInsets pvXl = EdgeInsets.symmetric(vertical: xl);
  static const EdgeInsets pvXxl = EdgeInsets.symmetric(vertical: xxl);

  // Screen Padding Defaults
  static const EdgeInsets screenPadding = EdgeInsets.symmetric(
    horizontal: lg,
    vertical: md,
  );

  static const EdgeInsets cardPadding = EdgeInsets.all(lg);
  static const EdgeInsets modalPadding = EdgeInsets.all(xxl);

  // --- SizedBox Gap Shortcuts ---
  static const SizedBox gapW2 = SizedBox(width: xxs);
  static const SizedBox gapW4 = SizedBox(width: xs);
  static const SizedBox gapW8 = SizedBox(width: sm);
  static const SizedBox gapW12 = SizedBox(width: md);
  static const SizedBox gapW16 = SizedBox(width: lg);
  static const SizedBox gapW20 = SizedBox(width: xl);
  static const SizedBox gapW24 = SizedBox(width: xxl);
  static const SizedBox gapW32 = SizedBox(width: xxxl);

  static const SizedBox gapH2 = SizedBox(height: xxs);
  static const SizedBox gapH4 = SizedBox(height: xs);
  static const SizedBox gapH8 = SizedBox(height: sm);
  static const SizedBox gapH12 = SizedBox(height: md);
  static const SizedBox gapH16 = SizedBox(height: lg);
  static const SizedBox gapH20 = SizedBox(height: xl);
  static const SizedBox gapH24 = SizedBox(height: xxl);
  static const SizedBox gapH32 = SizedBox(height: xxxl);
  static const SizedBox gapH48 = SizedBox(height: huge);
}
