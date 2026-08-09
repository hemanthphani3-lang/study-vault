import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/route_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_icons.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/cards/glass_card.dart';
import '../../../../core/widgets/feedback/empty_state_widget.dart';
import '../../../../core/widgets/inputs/app_search_bar.dart';
import '../../../../core/widgets/inputs/search_filter_chip.dart';
import '../../../../core/widgets/layout/section_header.dart';
import '../../../../shared/enums/resource_type.dart';
import '../providers/search_provider.dart';

/// Flagship Search screen with instant filter chips, suggestions, and recent searches.
class SearchView extends ConsumerStatefulWidget {
  const SearchView({super.key});

  @override
  ConsumerState<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends ConsumerState<SearchView> {
  int _selectedFilterIndex = 0;
  final List<String> _filters = <String>[
    'All Items',
    'Research Papers',
    'Datasets',
    'Textbooks',
    'Open Notes',
    'Codebases',
  ];

  final List<String> _recentSearches = <String>[
    'Decentralized zkSNARK systems',
    'Transformer architecture memory footprint',
    'CRISPR CAS-12 sequencing datasets',
    'Distributed consensus fault tolerance',
    'Quantum computing qubit fidelity',
  ];

  final List<Map<String, dynamic>> _trendingTopics = <Map<String, dynamic>>[
    <String, dynamic>{
      'topic': 'Zero-Knowledge Proofs',
      'category': 'Cryptography',
      'peers': '420 peers',
      'icon': AppIcons.shield,
    },
    <String, dynamic>{
      'topic': 'Large Language Models (LLMs)',
      'category': 'AI & ML',
      'peers': '890 peers',
      'icon': AppIcons.sparkles,
    },
    <String, dynamic>{
      'topic': 'Genomic Variant Benchmarks',
      'category': 'Bioinformatics',
      'peers': '310 peers',
      'icon': AppIcons.database,
    },
    <String, dynamic>{
      'topic': 'Graph Neural Networks',
      'category': 'Deep Learning',
      'peers': '275 peers',
      'icon': AppIcons.network,
    },
  ];

  void _navigateToResults(String query) {
    if (query.trim().isEmpty) return;
    ref.read(searchQueryProvider.notifier).state = query;
    ref.read(searchProvider.notifier).search(query);
    context.pushNamed(AppRoutes.searchResultsName);
  }

  void _onFilterTap(int index) {
    setState(() {
      _selectedFilterIndex = index;
    });

    final SearchNotifier notifier = ref.read(searchProvider.notifier);
    switch (index) {
      case 1:
        notifier.setFilter(ResourceType.paper);
        break;
      case 2:
        notifier.setFilter(ResourceType.dataset);
        break;
      case 3:
        notifier.setFilter(ResourceType.book);
        break;
      case 4:
        notifier.setFilter(ResourceType.document);
        break;
      case 0:
      default:
        notifier.setFilter(null);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final SearchState searchState = ref.watch(searchProvider);
    final String currentQuery = ref.watch(searchQueryProvider);
    final List<String> effectiveRecents = searchState.recentSearches.isNotEmpty
        ? searchState.recentSearches
        : _recentSearches;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Academic Knowledge Search',
          style: AppTypography.titleLarge.copyWith(fontWeight: FontWeight.w800),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(AppIcons.refresh, color: AppColors.hint),
            onPressed: () {
              ref.read(searchQueryProvider.notifier).state = '';
              ref.read(searchProvider.notifier).reset();
              setState(() {
                _selectedFilterIndex = 0;
              });
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
          // Search Input Bar
          AppSearchBar(
            hintText: 'Search title, authors, DOI, CID, topics...',
            onChanged: (String val) {
              ref.read(searchQueryProvider.notifier).state = val;
              ref.read(searchProvider.notifier).loadSuggestions(val);
            },
            onSubmitted: (String val) => _navigateToResults(val),
          ),
          AppSpacing.gapH16,

          // Filter Chips Carousel
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List<Widget>.generate(
                _filters.length,
                (int index) => Padding(
                  padding: const EdgeInsets.only(right: AppSpacing.xs),
                  child: SearchFilterChip(
                    label: _filters[index],
                    isSelected: _selectedFilterIndex == index,
                    onTap: () => _onFilterTap(index),
                  ),
                ),
              ),
            ),
          ),
          AppSpacing.gapH24,

          // Recent Searches Section
          if (effectiveRecents.isNotEmpty) ...<Widget>[
            SectionHeader(
              title: 'Recent Searches',
              subtitle: 'Stored in local encrypted cache',
              actionLabel: 'Clear All',
              onAction: () {
                ref.read(searchProvider.notifier).clearAllHistory();
                setState(() {
                  _recentSearches.clear();
                });
              },
            ),
            AppSpacing.gapH8,
            ...List<Widget>.generate(
              effectiveRecents.length,
              (int index) {
                final String query = effectiveRecents[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.xs),
                  child: GlassCard(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.md,
                      vertical: AppSpacing.sm,
                    ),
                    onTap: () => _navigateToResults(query),
                    child: Row(
                      children: <Widget>[
                        const Icon(
                          AppIcons.refresh,
                          size: 16,
                          color: AppColors.hint,
                        ),
                        AppSpacing.gapW12,
                        Expanded(
                          child: Text(
                            query,
                            style: AppTypography.bodyMedium.copyWith(
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            AppIcons.clear,
                            size: 16,
                            color: AppColors.hint,
                          ),
                          onPressed: () {
                            ref.read(searchProvider.notifier).deleteRecentSearch(query);
                            setState(() {
                              _recentSearches.remove(query);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            AppSpacing.gapH24,
          ],

          // Trending Academic Suggestions
          const SectionHeader(
            title: 'Trending Topics & Swarms',
            subtitle: 'Real-time peer seeder discovery',
          ),
          AppSpacing.gapH12,
          ...List<Widget>.generate(
            _trendingTopics.length,
            (int index) {
              final Map<String, dynamic> item = _trendingTopics[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.md),
                child: GlassCard(
                  onTap: () => _navigateToResults(item['topic'] as String),
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(AppSpacing.sm),
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: AppRadius.rMd,
                          border: Border.all(color: AppColors.glassBorderSubtle),
                        ),
                        child: Icon(
                          item['icon'] as IconData,
                          color: AppColors.secondary,
                          size: 20,
                        ),
                      ),
                      AppSpacing.gapW16,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              item['topic'] as String,
                              style: AppTypography.titleMedium.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            AppSpacing.gapH4,
                            Text(
                              '${item['category']} • ${item['peers']}',
                              style: AppTypography.caption.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.chevron_right_rounded,
                        color: AppColors.hint,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          AppSpacing.gapH24,

          // Quick Empty State Preview
          if (_recentSearches.isEmpty && currentQuery.isEmpty)
            const EmptyStateWidget(
              title: 'No Recent Searches',
              description: 'Type a query or tap a trending topic to discover peer-seeded academic materials.',
            ),

          AppSpacing.gapH48,
        ],
      ),
    );
  }
}
