import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/route_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_icons.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/badges/app_badge.dart';
import '../../../../core/widgets/badges/verified_badge.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../core/widgets/buttons/secondary_button.dart';
import '../../../../core/widgets/cards/glass_card.dart';
import '../../../../core/widgets/feedback/empty_state_widget.dart';
import '../../../../core/widgets/feedback/progress_indicator.dart';
import '../../../../core/widgets/inputs/app_search_bar.dart';
import '../../../../core/widgets/inputs/search_filter_chip.dart';
import '../../../../core/widgets/layout/section_header.dart';
import '../../../../core/widgets/overlays/reusable_dialog.dart';
import '../../../../shared/helpers/formatters.dart';
import '../../../../shared/models/resource_preview.dart';
import '../providers/library_provider.dart';

/// Offline Knowledge Vault storing verified SQLite Drift books, papers, and notes.
class LibraryView extends ConsumerStatefulWidget {
  const LibraryView({super.key});

  @override
  ConsumerState<LibraryView> createState() => _LibraryViewState();
}

class _LibraryViewState extends ConsumerState<LibraryView> {
  int _selectedCategoryIndex = 0;
  String _filterQuery = '';

  final List<String> _categories = <String>[
    'All Vault Items',
    'Research Papers',
    'Textbooks',
    'Open Notes',
    'Downloads',
    'Favorites',
  ];

  @override
  Widget build(BuildContext context) {
    final LibraryState state = ref.watch(libraryProvider);

    final List<ResourcePreview> filteredItems = state.savedItems.where((ResourcePreview item) {
      if (_filterQuery.isEmpty) return true;
      return item.title.toLowerCase().contains(_filterQuery.toLowerCase()) ||
          item.authors.any((String a) => a.toLowerCase().contains(_filterQuery.toLowerCase()));
    }).toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Personal Knowledge Vault',
          style: AppTypography.titleLarge.copyWith(fontWeight: FontWeight.w800),
        ),
        actions: <Widget>[
          const AppBadge(variant: BadgeVariant.offline, compact: true),
          AppSpacing.gapW12,
          IconButton(
            icon: const Icon(AppIcons.database, color: AppColors.primary),
            onPressed: () {
              ReusableDialog.show<void>(
                context: context,
                icon: AppIcons.database,
                title: 'Offline Vault Storage',
                description:
                    'Your local Drift SQLite database currently holds 84.6 MB across ${state.savedItems.length} verified documents with full offline indexing.',
                primaryActionLabel: 'Close',
              );
            },
          ),
          AppSpacing.gapW8,
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        children: <Widget>[
          // Search Library Bar
          AppSearchBar(
            hintText: 'Search offline vault documents...',
            onChanged: (String val) {
              setState(() {
                _filterQuery = val;
              });
            },
          ),
          AppSpacing.gapH16,

          // Storage Quota Overview Card
          GlassCard(
            padding: AppSpacing.cardPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(AppSpacing.xs),
                      decoration: const BoxDecoration(
                        color: AppColors.surface,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        AppIcons.database,
                        color: AppColors.primary,
                        size: 20,
                      ),
                    ),
                    AppSpacing.gapW12,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Vault Storage Active',
                            style: AppTypography.titleSmall.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          AppSpacing.gapH2,
                          Text(
                            '84.6 MB used of 2.0 GB allocated offline cache',
                            style: AppTypography.caption.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '4.2%',
                      style: AppTypography.labelLarge.copyWith(
                        color: AppColors.secondary,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                AppSpacing.gapH16,
                const AppProgressBar(
                  progress: 0.042,
                  height: 6,
                ),
              ],
            ),
          ),
          AppSpacing.gapH20,

          // Categories Filter Row
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List<Widget>.generate(
                _categories.length,
                (int index) => Padding(
                  padding: const EdgeInsets.only(right: AppSpacing.xs),
                  child: SearchFilterChip(
                    label: _categories[index],
                    isSelected: _selectedCategoryIndex == index,
                    onTap: () {
                      setState(() {
                        _selectedCategoryIndex = index;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
          AppSpacing.gapH24,

          // Section Header
          SectionHeader(
            title: 'Stored Documents',
            subtitle: '${filteredItems.length} verified items available without internet',
            actionLabel: 'Discover More',
            onAction: () => context.goNamed(AppRoutes.searchName),
          ),
          AppSpacing.gapH12,

          // Saved Document List
          if (filteredItems.isEmpty)
            const EmptyStateWidget(
              title: 'No Documents in Vault',
              description: 'Discover academic papers and sync them for offline access.',
            )
          else
            ...filteredItems.map(
              (ResourcePreview item) => Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.md),
                child: GlassCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(AppSpacing.sm),
                            decoration: const BoxDecoration(
                              color: AppColors.surface,
                              borderRadius: AppRadius.rSm,
                            ),
                            child: Icon(
                              item.type.icon,
                              color: AppColors.secondary,
                              size: 20,
                            ),
                          ),
                          AppSpacing.gapW12,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  item.title,
                                  style: AppTypography.titleMedium.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                AppSpacing.gapH4,
                                Text(
                                  '${item.authors.join(', ')} • ${item.year}',
                                  style: AppTypography.bodySmall.copyWith(
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      AppSpacing.gapH16,
                      Row(
                        children: <Widget>[
                          VerifiedBadge(tier: item.verificationTier),
                          AppSpacing.gapW8,
                          const AppBadge(variant: BadgeVariant.downloaded, compact: true),
                          const Spacer(),
                          Text(
                            Formatters.formatBytes(item.sizeBytes),
                            style: AppTypography.caption.copyWith(color: AppColors.hint),
                          ),
                        ],
                      ),
                      AppSpacing.gapH16,
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: PrimaryButton(
                              label: 'Open Document',
                              icon: AppIcons.document,
                              size: ButtonSize.small,
                              onPressed: () => context.pushNamed(AppRoutes.resourceDetailsName),
                            ),
                          ),
                          AppSpacing.gapW12,
                          SecondaryButton(
                            label: 'Details',
                            size: ButtonSize.small,
                            onPressed: () => context.pushNamed(AppRoutes.resourceDetailsName),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          AppSpacing.gapH48,
        ],
      ),
    );
  }
}
