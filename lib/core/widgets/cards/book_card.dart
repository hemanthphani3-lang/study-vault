import 'package:flutter/material.dart';
import '../../../shared/enums/resource_type.dart';
import '../../../shared/enums/verification_tier.dart';
import '../../../shared/helpers/formatters.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_icons.dart';
import '../../theme/app_radius.dart';
import '../../theme/app_shadows.dart';
import '../../theme/app_spacing.dart';
import '../../theme/app_typography.dart';
import '../badges/app_badge.dart';
import '../buttons/app_icon_button.dart';
import '../buttons/primary_button.dart';
import '../buttons/secondary_button.dart';
import 'glass_card.dart';

/// Flagship Academic Book & Resource Card adapted to Linear/Arc aesthetic.
class BookCard extends StatelessWidget {
  const BookCard({
    required this.title,
    required this.authors,
    required this.year,
    required this.type,
    required this.sizeBytes,
    required this.peerSeeders,
    super.key,
    this.subtitle,
    this.rating = 4.9,
    this.verificationTier = VerificationTier.verified,
    this.isDownloaded = false,
    this.isFavorite = false,
    this.coverImageUrl,
    this.onTap,
    this.onDownload,
    this.onView,
    this.onFavorite,
  });

  final String title;
  final List<String> authors;
  final int year;
  final ResourceType type;
  final int sizeBytes;
  final int peerSeeders;
  final String? subtitle;
  final double rating;
  final VerificationTier verificationTier;
  final bool isDownloaded;
  final bool isFavorite;
  final String? coverImageUrl;
  final VoidCallback? onTap;
  final VoidCallback? onDownload;
  final VoidCallback? onView;
  final VoidCallback? onFavorite;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      onTap: onTap,
      padding: AppSpacing.pLg,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Book Cover Thumbnail
              _BookCover(type: type, coverUrl: coverImageUrl),
              AppSpacing.gapW16,

              // Content Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            title,
                            style: AppTypography.titleMedium.copyWith(
                              fontWeight: FontWeight.w700,
                              height: 1.3,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (onFavorite != null)
                          AppIconButton(
                            icon: isFavorite ? AppIcons.bookmark : AppIcons.bookmarkBorder,
                            iconColor: isFavorite ? AppColors.warning : AppColors.hint,
                            size: 32,
                            iconSize: 16,
                            onPressed: onFavorite,
                          ),
                      ],
                    ),
                    AppSpacing.gapH4,
                    Text(
                      '${authors.join(', ')} • $year',
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (subtitle != null) ...<Widget>[
                      AppSpacing.gapH4,
                      Text(
                        subtitle!,
                        style: AppTypography.caption.copyWith(color: AppColors.hint),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          AppSpacing.gapH16,

          // Metadata & Badges Bar
          Row(
            children: <Widget>[
              AppBadge(
                variant: verificationTier == VerificationTier.verified
                    ? BadgeVariant.verified
                    : BadgeVariant.premium,
                compact: true,
              ),
              AppSpacing.gapW8,
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: AppSpacing.xxs,
                ),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: AppRadius.rSm,
                  border: Border.all(color: AppColors.glassBorderSubtle),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Icon(AppIcons.peers, size: 12, color: AppColors.secondary),
                    AppSpacing.gapW4,
                    Text(
                      '$peerSeeders peers',
                      style: AppTypography.labelSmall.copyWith(
                        color: AppColors.textPrimary,
                        fontSize: 10.5,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Icon(Icons.star_rounded, size: 14, color: AppColors.warning),
                  AppSpacing.gapW4,
                  Text(
                    rating.toStringAsFixed(1),
                    style: AppTypography.labelSmall.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  AppSpacing.gapW8,
                  Text(
                    Formatters.formatBytes(sizeBytes),
                    style: AppTypography.caption.copyWith(color: AppColors.hint),
                  ),
                ],
              ),
            ],
          ),
          AppSpacing.gapH16,

          // Action Buttons
          Row(
            children: <Widget>[
              if (onView != null)
                Expanded(
                  child: SecondaryButton(
                    label: 'Preview',
                    icon: AppIcons.document,
                    size: ButtonSize.small,
                    onPressed: onView,
                  ),
                ),
              if (onView != null && onDownload != null) AppSpacing.gapW12,
              if (onDownload != null)
                Expanded(
                  child: PrimaryButton(
                    label: isDownloaded ? 'Stored' : 'Sync to Vault',
                    icon: isDownloaded ? AppIcons.check : AppIcons.download,
                    size: ButtonSize.small,
                    onPressed: onDownload,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BookCover extends StatelessWidget {
  const _BookCover({required this.type, this.coverUrl});

  final ResourceType type;
  final String? coverUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 76,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppRadius.rMd,
        border: Border.all(color: AppColors.glassBorder, width: 1.2),
        boxShadow: AppShadows.subtle,
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            AppColors.surface,
            AppColors.card,
          ],
        ),
      ),
      child: Center(
        child: Icon(
          type.icon,
          size: 26,
          color: AppColors.secondary,
        ),
      ),
    );
  }
}
