import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_gradients.dart';
import 'app_radius.dart';
import 'app_shadows.dart';

/// Centralized BoxDecoration tokens for glass containers, floating cards, and glowing borders.
abstract final class AppDecoration {
  // --- Glassmorphic Containers ---
  static BoxDecoration get glassCard => BoxDecoration(
        color: AppColors.glassFill,
        borderRadius: AppRadius.rXl,
        border: Border.all(color: AppColors.glassBorder, width: 1.0),
        boxShadow: AppShadows.card,
      );

  static BoxDecoration get glassCardHover => BoxDecoration(
        color: AppColors.card.withValues(alpha: 0.85),
        borderRadius: AppRadius.rXl,
        border: Border.all(color: AppColors.primary, width: 1.2),
        boxShadow: AppShadows.primaryGlow,
      );

  static BoxDecoration get floatingCard => BoxDecoration(
        color: AppColors.card,
        borderRadius: AppRadius.rXl,
        border: Border.all(color: AppColors.glassBorderSubtle, width: 1.0),
        boxShadow: AppShadows.floating,
      );

  static const BoxDecoration surfacePanel = BoxDecoration(
    color: AppColors.surface,
    borderRadius: AppRadius.rLg,
    border: Border.fromBorderSide(
      BorderSide(color: AppColors.glassBorderSubtle, width: 1.0),
    ),
  );

  // --- Glowing Badges & Controls ---
  static const BoxDecoration glowingPill = BoxDecoration(
    gradient: AppGradients.primary,
    borderRadius: AppRadius.rFull,
    boxShadow: AppShadows.primaryGlow,
  );

  static const BoxDecoration searchInput = BoxDecoration(
    color: AppColors.surface,
    borderRadius: AppRadius.rXl,
    border: Border.fromBorderSide(
      BorderSide(color: AppColors.glassBorder, width: 1.2),
    ),
    boxShadow: AppShadows.subtle,
  );
}
