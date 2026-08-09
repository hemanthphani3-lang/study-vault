import 'package:flutter/material.dart';
import '../theme/app_decorations.dart';
import '../theme/app_durations.dart';
import '../theme/app_gradients.dart';
import '../theme/app_radius.dart';
import '../theme/app_shadows.dart';
import '../theme/app_spacing.dart';
import '../theme/app_theme_extension.dart';
import '../theme/app_typography.dart';

/// Ergonomic [BuildContext] extensions for Clean Architecture and Design System tokens.
extension BuildContextThemeExtensions on BuildContext {
  /// Access current [ThemeData].
  ThemeData get theme => Theme.of(this);

  /// Access current [ColorScheme].
  ColorScheme get colorScheme => theme.colorScheme;

  /// Access current [TextTheme].
  TextTheme get textTheme => theme.textTheme;

  /// Access StudyVault custom theme extension tokens (`context.colors`).
  StudyVaultThemeExtension get colors =>
      theme.extension<StudyVaultThemeExtension>() ??
      const StudyVaultThemeExtension();

  // --- Static Companion Token Shortcuts ---
  Type get spacing => AppSpacing;
  Type get radius => AppRadius;
  Type get typography => AppTypography;
  Type get shadows => AppShadows;
  Type get decorations => AppDecoration;
  Type get durations => AppDurations;
  Type get gradients => AppGradients;

  /// Access current [MediaQueryData].
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Screen size shortcuts.
  Size get screenSize => mediaQuery.size;
  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;

  /// Responsive Breakpoint Detectors
  bool get isSmallPhone => screenWidth < 360;
  bool get isPhone => screenWidth < 600;
  bool get isTablet => screenWidth >= 600 && screenWidth < 1024;
  bool get isDesktop => screenWidth >= 1024;

  /// Responsive layout helper value selector.
  T responsive<T>({
    required T phone,
    T? tablet,
    T? desktop,
    T? smallPhone,
  }) {
    if (isSmallPhone && smallPhone != null) return smallPhone;
    if (isDesktop && desktop != null) return desktop;
    if (isTablet && tablet != null) return tablet;
    return phone;
  }

  /// Safe area padding shortcuts.
  EdgeInsets get padding => mediaQuery.padding;
  EdgeInsets get viewInsets => mediaQuery.viewInsets;

  /// Display a floating snackbar with design system styling.
  void showAppSnackBar({
    required String message,
    bool isError = false,
    Duration duration = const Duration(seconds: 3),
    VoidCallback? onAction,
    String? actionLabel,
  }) {
    ScaffoldMessenger.of(this).hideCurrentSnackBar();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: textTheme.bodyMedium?.copyWith(
            color: isError ? Colors.white : colorScheme.onSurface,
          ),
        ),
        action: (actionLabel != null && onAction != null)
            ? SnackBarAction(
                label: actionLabel,
                textColor: colorScheme.secondary,
                onPressed: onAction,
              )
            : null,
        backgroundColor: isError ? colorScheme.error : colorScheme.surface,
        behavior: SnackBarBehavior.floating,
        duration: duration,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: isError ? colorScheme.error : colorScheme.outlineVariant,
          ),
        ),
      ),
    );
  }
}
