import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_icons.dart';
import '../../theme/app_radius.dart';
import '../../theme/app_shadows.dart';
import '../../theme/app_spacing.dart';
import '../../theme/app_typography.dart';
import '../buttons/app_icon_button.dart';

/// Reusable Search Bar with voice placeholder, clear action, and autocomplete anchor.
class AppSearchBar extends StatefulWidget {
  const AppSearchBar({
    super.key,
    this.controller,
    this.hintText = 'Search verified papers, datasets, books, authors...',
    this.onChanged,
    this.onSubmitted,
    this.onClear,
    this.onVoiceTap,
    this.isLoading = false,
    this.autofocus = false,
    this.readOnly = false,
    this.onTap,
    this.suffixWidget,
  });

  final TextEditingController? controller;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onClear;
  final VoidCallback? onVoiceTap;
  final bool isLoading;
  final bool autofocus;
  final bool readOnly;
  final VoidCallback? onTap;
  final Widget? suffixWidget;

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  late final TextEditingController _effectiveController;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _effectiveController = widget.controller ?? TextEditingController();
    _hasText = _effectiveController.text.isNotEmpty;
    _effectiveController.addListener(_handleTextChange);
  }

  void _handleTextChange() {
    final bool currentHasText = _effectiveController.text.isNotEmpty;
    if (_hasText != currentHasText) {
      setState(() {
        _hasText = currentHasText;
      });
    }
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _effectiveController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppRadius.rXl,
        border: Border.all(color: AppColors.glassBorder, width: 1.2),
        boxShadow: AppShadows.subtle,
      ),
      child: TextField(
        controller: _effectiveController,
        readOnly: widget.readOnly,
        autofocus: widget.autofocus,
        onTap: widget.onTap,
        onChanged: widget.onChanged,
        onSubmitted: widget.onSubmitted,
        style: AppTypography.bodyMedium.copyWith(color: AppColors.textPrimary),
        cursorColor: AppColors.secondary,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: AppTypography.bodyMedium.copyWith(color: AppColors.hint),
          prefixIcon: const Icon(
            AppIcons.search,
            color: AppColors.secondary,
            size: 20,
          ),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (widget.isLoading)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm),
                  child: SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.0,
                      valueColor: AlwaysStoppedAnimation<Color>(AppColors.secondary),
                    ),
                  ),
                )
              else if (_hasText)
                IconButton(
                  icon: const Icon(
                    AppIcons.clear,
                    color: AppColors.hint,
                    size: 18,
                  ),
                  onPressed: () {
                    _effectiveController.clear();
                    widget.onChanged?.call('');
                    widget.onClear?.call();
                  },
                ),
              if (widget.onVoiceTap != null && !_hasText)
                AppIconButton(
                  icon: Icons.mic_rounded,
                  iconColor: AppColors.secondary,
                  size: 32,
                  iconSize: 18,
                  onPressed: widget.onVoiceTap,
                ),
              if (widget.suffixWidget != null) widget.suffixWidget!,
              AppSpacing.gapW4,
            ],
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
