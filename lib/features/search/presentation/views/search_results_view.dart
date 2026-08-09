import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/route_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/badges/app_badge.dart';
import '../../../../core/widgets/cards/book_card.dart';
import '../../../../core/widgets/cards/glass_card.dart';
import '../../../../core/widgets/feedback/empty_state_widget.dart';
import '../../../../core/widgets/inputs/search_filter_chip.dart';
import '../../../../core/widgets/layout/top_app_bar.dart';
import '../../../../core/widgets/overlays/app_bottom_sheet.dart';
import '../../../../domain/search/models/search_filter.dart';
import '../../../../domain/search/models/search_sort_option.dart';
import '../../../../shared/enums/verification_tier.dart';
import '../../../../shared/models/resource_preview.dart';
import '../providers/search_provider.dart';

/// Comprehensive Search Results view with sorting, filtering, and peer seeder telemetry.
class SearchResultsView extends ConsumerStatefulWidget {
  const SearchResultsView({super.key});

  @override
  ConsumerState<SearchResultsView> createState() => _SearchResultsViewState();
}

class _SearchResultsViewState extends ConsumerState<SearchResultsView> {
  String _selectedSort = 'Most Relevant';
  int _activeFilter = 0;

  final List<String> _sortOptions = <String>[
    'Most Relevant',
    'Highest Seeders',
    'Publication Year',
    'Verification Tier',
    'File Size',
  ];

  final List<String> _filters = <String>[
    'All Verified',
    'Tier 1 Institutional',
    'Peer-Reviewed',
    'In Local Vault',
    'Open Access',
  ];

  void _showSortModal() {
    AppBottomSheet.show<void>(
      context: context,
      title: 'Sort Results By',
      child: Column(
        children: List<Widget>.generate(
          _sortOptions.length,
          (int index) {
            final String opt = _sortOptions[index];
            final bool isSelected = opt == _selectedSort;
            return ListTile(
              title: Text(
                opt,
                style: AppTypography.bodyMedium.copyWith(
                  color: isSelected ? AppColors.secondary : AppColors.textPrimary,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
              trailing: isSelected
                  ? const Icon(Icons.check, color: AppColors.secondary)
                  : null,
              onTap: () {
                setState(() {
                  _selectedSort = opt;
                });
                _applySortSelection(opt);
                Navigator.of(context).pop();
              },
            );
          },
        ),
      ),
    );
  }

  void _applySortSelection(String option) {
    final SearchNotifier notifier = ref.read(searchProvider.notifier);
    switch (option) {
      case 'Highest Seeders':
        notifier.setSortOption(SearchSortOption.highestSeeders);
        break;
      case 'Publication Year':
        notifier.setSortOption(SearchSortOption.publicationYearDesc);
        break;
      case 'Verification Tier':
        notifier.setSortOption(SearchSortOption.trustScore);
        break;
      case 'File Size':
      case 'Most Relevant':
      default:
        notifier.setSortOption(SearchSortOption.mostRelevant);
        break;
    }
  }

  void _applyFilterSelection(int index) {
    final SearchNotifier notifier = ref.read(searchProvider.notifier);
    setState(() {
      _activeFilter = index;
    });

    switch (index) {
      case 1:
        notifier.applyFilter(const SearchFilter(verificationTier: VerificationTier.verified));
        break;
      case 2:
        notifier.applyFilter(const SearchFilter(verificationTier: VerificationTier.peerReviewed));
        break;
      case 3:
        notifier.applyFilter(const SearchFilter(isDownloaded: true));
        break;
      case 0:
      case 4:
      default:
        notifier.applyFilter(SearchFilter.empty);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final SearchState searchState = ref.watch(searchProvider);
    final String query = ref.watch(searchQueryProvider);
    final String effectiveQuery = query.isEmpty ? 'Decentralized Knowledge Systems' : query;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: TopAppBar(
        title: 'Search Results',
        subtitle: 'Found ${searchState.results.length} matches for "$effectiveQuery"',
        showBackButton: true,
        onBackTap: () => context.pop(),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.tune_rounded, color: AppColors.secondary),
            tooltip: 'Sort & Filter',
            onPressed: _showSortModal,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        children: <Widget>[
          // Active Filter Chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List<Widget>.generate(
                _filters.length,
                (int index) => Padding(
                  padding: const EdgeInsets.only(right: AppSpacing.xs),
                  child: SearchFilterChip(
                    label: _filters[index],
                    isSelected: _activeFilter == index,
                    onTap: () => _applyFilterSelection(index),
                  ),
                ),
              ),
            ),
          ),
          AppSpacing.gapH16,

          // Query Telemetry & Sort Indicator
          GlassCard(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.sm,
            ),
            child: Row(
              children: <Widget>[
                const AppBadge(variant: BadgeVariant.verified, compact: true),
                AppSpacing.gapW12,
                Expanded(
                  child: Text(
                    'Sorted by: $_selectedSort',
                    style: AppTypography.caption.copyWith(
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                InkWell(
                  onTap: _showSortModal,
                  borderRadius: AppRadius.rSm,
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.xxs),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Change',
                          style: AppTypography.caption.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_drop_down_rounded,
                          color: AppColors.primary,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          AppSpacing.gapH16,

          // Search Result Cards / Loading / Empty
          if (searchState.status == SearchStatus.loading)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: AppSpacing.xxl),
              child: Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              ),
            )
          else if (searchState.results.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: AppSpacing.xxl),
              child: EmptyStateWidget(
                title: 'No Matching Resources Found',
                description: 'Try adjusting filters or searching for different academic keywords or authors.',
              ),
            )
          else
            ...searchState.results.map(
              (ResourcePreview resource) => Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.md),
                child: BookCard(
                  title: resource.title,
                  authors: resource.authors,
                  year: resource.year,
                  type: resource.type,
                  sizeBytes: resource.sizeBytes,
                  peerSeeders: resource.peerSeeders,
                  isDownloaded: resource.isDownloaded,
                  onTap: () => context.pushNamed(AppRoutes.resourceDetailsName),
                  onDownload: () => context.pushNamed(AppRoutes.resourceDetailsName),
                ),
              ),
            ),
          AppSpacing.gapH48,
        ],
      ),
    );
  }
}
