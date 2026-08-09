import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_durations.dart';
import '../../theme/app_radius.dart';
import '../../theme/app_shadows.dart';
import '../../theme/app_spacing.dart';
import '../../theme/app_typography.dart';
import 'glass_card.dart';

/// Category card showcasing academic domains with glowing cosmic aura.
class CategoryCard extends StatefulWidget {
  const CategoryCard({
    required this.title,
    required this.itemCount,
    required this.icon,
    required this.onTap,
    super.key,
    this.accentColor = AppColors.primary,
  });

  final String title;
  final String itemCount;
  final IconData icon;
  final VoidCallback onTap;
  final Color accentColor;

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: AppDurations.fast,
      transform: Matrix4.translationValues(0, _isHovered ? -3 : 0, 0),
      child: GlassCard(
        onTap: widget.onTap,
        borderColor: _isHovered ? widget.accentColor : AppColors.glassBorderSubtle,
        boxShadow: _isHovered ? AppShadows.floating : AppShadows.card,
        child: InkWell(
          onTap: widget.onTap,
          onHighlightChanged: (bool val) {
            setState(() {
              _isHovered = val;
            });
          },
          borderRadius: AppRadius.rXl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: widget.accentColor.withValues(alpha: 0.15),
                  borderRadius: AppRadius.rMd,
                  border: Border.all(
                    color: widget.accentColor.withValues(alpha: 0.4),
                  ),
                ),
                child: Icon(
                  widget.icon,
                  color: widget.accentColor,
                  size: 24,
                ),
              ),
              AppSpacing.gapH16,
              Text(
                widget.title,
                style: AppTypography.titleMedium.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              AppSpacing.gapH4,
              Text(
                widget.itemCount,
                style: AppTypography.caption.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
