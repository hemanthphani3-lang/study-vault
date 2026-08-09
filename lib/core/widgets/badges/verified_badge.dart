import 'package:flutter/material.dart';
import '../../../shared/enums/verification_tier.dart';
import '../../theme/app_radius.dart';
import '../../theme/app_spacing.dart';
import '../../theme/app_typography.dart';

/// Cryptographic verification badge indicator.
class VerifiedBadge extends StatelessWidget {
  const VerifiedBadge({
    super.key,
    this.tier = VerificationTier.verified,
    this.compact = false,
  });

  final VerificationTier tier;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: compact ? AppSpacing.sm : AppSpacing.md,
        vertical: compact ? AppSpacing.xxs : AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: tier.color.withValues(alpha: 0.15),
        borderRadius: AppRadius.rSm,
        border: Border.all(
          color: tier.color.withValues(alpha: 0.4),
          width: 1.0,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            tier.icon,
            size: compact ? 12 : 14,
            color: tier.color,
          ),
          if (!compact) ...<Widget>[
            AppSpacing.gapW4,
            Text(
              tier.label,
              style: AppTypography.labelSmall.copyWith(
                color: tier.color,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.4,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
