import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';
import 'app_radius.dart';
import 'app_spacing.dart';
import 'app_theme_extension.dart';
import 'app_typography.dart';

/// Complete Material 3 Theme definition for StudyVault.
///
/// Encapsulates the dark cosmic aesthetic with neon accents and verified tokens.
abstract final class AppTheme {
  /// Flagship Dark Theme for StudyVault.
  static ThemeData get darkTheme {
    const ColorScheme colorScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.primary,
      onPrimary: AppColors.background,
      primaryContainer: AppColors.card,
      onPrimaryContainer: AppColors.textPrimary,
      secondary: AppColors.secondary,
      onSecondary: AppColors.background,
      secondaryContainer: AppColors.card,
      onSecondaryContainer: AppColors.textPrimary,
      tertiary: AppColors.success,
      onTertiary: AppColors.background,
      error: AppColors.error,
      onError: AppColors.textPrimary,
      surface: AppColors.surface,
      onSurface: AppColors.textPrimary,
      surfaceContainerHighest: AppColors.card,
      onSurfaceVariant: AppColors.textSecondary,
      outline: AppColors.divider,
      outlineVariant: AppColors.glassBorderSubtle,
      shadow: Colors.black,
      scrim: AppColors.overlay,
      inverseSurface: AppColors.textPrimary,
      onInverseSurface: AppColors.background,
      inversePrimary: AppColors.primary,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: colorScheme,
      textTheme: AppTypography.textTheme,
      fontFamily: AppTypography.bodyMedium.fontFamily,

      // --- System UI / AppBar ---
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: AppTypography.headlineSmall,
        iconTheme: const IconThemeData(color: AppColors.textPrimary, size: 22),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: AppColors.surface,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      ),

      // --- Cards & Surfaces ---
      cardTheme: const CardThemeData(
        color: AppColors.card,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: AppRadius.shapeXl,
        clipBehavior: Clip.antiAlias,
      ),

      // --- Elevated Buttons ---
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.background,
          elevation: 0,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.xxl,
            vertical: AppSpacing.md,
          ),
          shape: AppRadius.shapeLg,
          textStyle: AppTypography.labelLarge.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.background,
          ),
        ),
      ),

      // --- Outlined Buttons ---
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.textPrimary,
          side: const BorderSide(color: AppColors.glassBorder, width: 1.2),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.xl,
            vertical: AppSpacing.md,
          ),
          shape: AppRadius.shapeLg,
          textStyle: AppTypography.labelLarge,
        ),
      ),

      // --- Input Fields ---
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        hintStyle: AppTypography.bodyMedium.copyWith(color: AppColors.hint),
        labelStyle: AppTypography.bodyMedium.copyWith(color: AppColors.textSecondary),
        prefixIconColor: AppColors.hint,
        suffixIconColor: AppColors.hint,
        border: const OutlineInputBorder(
          borderRadius: AppRadius.rLg,
          borderSide: BorderSide(color: AppColors.glassBorderSubtle, width: 1),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: AppRadius.rLg,
          borderSide: BorderSide(color: AppColors.glassBorderSubtle, width: 1),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: AppRadius.rLg,
          borderSide: BorderSide(color: AppColors.primary, width: 1.5),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: AppRadius.rLg,
          borderSide: BorderSide(color: AppColors.error, width: 1.2),
        ),
      ),

      // --- Dividers & Chips ---
      dividerTheme: const DividerThemeData(
        color: AppColors.divider,
        thickness: 1,
        space: 1,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.card,
        disabledColor: AppColors.surface,
        selectedColor: AppColors.primary.withValues(alpha: 0.2),
        secondarySelectedColor: AppColors.secondary.withValues(alpha: 0.2),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xxs,
        ),
        shape: AppRadius.shapeMd,
        side: const BorderSide(color: AppColors.glassBorderSubtle, width: 0.8),
        labelStyle: AppTypography.labelSmall.copyWith(color: AppColors.textPrimary),
      ),

      // --- Navigation Bar ---
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.surface,
        indicatorColor: AppColors.primary.withValues(alpha: 0.2),
        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return AppTypography.labelSmall.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w700,
              );
            }
            return AppTypography.labelSmall.copyWith(color: AppColors.hint);
          },
        ),
        iconTheme: WidgetStateProperty.resolveWith<IconThemeData>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return const IconThemeData(color: AppColors.primary, size: 24);
            }
            return const IconThemeData(color: AppColors.hint, size: 22);
          },
        ),
      ),

      // --- Theme Extensions ---
      extensions: const <ThemeExtension<dynamic>>[
        StudyVaultThemeExtension(),
      ],
    );
  }
}
