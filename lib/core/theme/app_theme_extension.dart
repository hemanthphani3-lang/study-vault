import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_decorations.dart';
import 'app_durations.dart';
import 'app_gradients.dart';
import 'app_radius.dart';
import 'app_shadows.dart';
import 'app_spacing.dart';
import 'app_typography.dart';

/// Custom ThemeExtension allowing direct, ergonomic access to StudyVault tokens.
///
/// Usage: `context.colors`, `context.spacing`, `context.radius`, `context.typography`,
/// `context.shadows`, `context.decorations`, `context.durations`.
@immutable
class StudyVaultThemeExtension extends ThemeExtension<StudyVaultThemeExtension> {
  const StudyVaultThemeExtension({
    this.background = AppColors.background,
    this.surface = AppColors.surface,
    this.card = AppColors.card,
    this.primary = AppColors.primary,
    this.secondary = AppColors.secondary,
    this.success = AppColors.success,
    this.warning = AppColors.warning,
    this.error = AppColors.error,
    this.textPrimary = AppColors.textPrimary,
    this.textSecondary = AppColors.textSecondary,
    this.hint = AppColors.hint,
  });

  final Color background;
  final Color surface;
  final Color card;
  final Color primary;
  final Color secondary;
  final Color success;
  final Color warning;
  final Color error;
  final Color textPrimary;
  final Color textSecondary;
  final Color hint;

  // Shortcuts to companion token classes
  Type get spacingType => AppSpacing;
  Type get radiusType => AppRadius;
  Type get typographyType => AppTypography;
  Type get shadowsType => AppShadows;
  Type get decorationsType => AppDecoration;
  Type get durationsType => AppDurations;
  Type get gradientsType => AppGradients;

  @override
  StudyVaultThemeExtension copyWith({
    Color? background,
    Color? surface,
    Color? card,
    Color? primary,
    Color? secondary,
    Color? success,
    Color? warning,
    Color? error,
    Color? textPrimary,
    Color? textSecondary,
    Color? hint,
  }) {
    return StudyVaultThemeExtension(
      background: background ?? this.background,
      surface: surface ?? this.surface,
      card: card ?? this.card,
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      error: error ?? this.error,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      hint: hint ?? this.hint,
    );
  }

  @override
  StudyVaultThemeExtension lerp(
    covariant ThemeExtension<StudyVaultThemeExtension>? other,
    double t,
  ) {
    if (other is! StudyVaultThemeExtension) return this;
    return StudyVaultThemeExtension(
      background: Color.lerp(background, other.background, t) ?? background,
      surface: Color.lerp(surface, other.surface, t) ?? surface,
      card: Color.lerp(card, other.card, t) ?? card,
      primary: Color.lerp(primary, other.primary, t) ?? primary,
      secondary: Color.lerp(secondary, other.secondary, t) ?? secondary,
      success: Color.lerp(success, other.success, t) ?? success,
      warning: Color.lerp(warning, other.warning, t) ?? warning,
      error: Color.lerp(error, other.error, t) ?? error,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t) ?? textPrimary,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t) ?? textSecondary,
      hint: Color.lerp(hint, other.hint, t) ?? hint,
    );
  }
}
