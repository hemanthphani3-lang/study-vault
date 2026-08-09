import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/route_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_icons.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/badges/app_badge.dart';
import '../../../../core/widgets/cards/book_card.dart';
import '../../../../core/widgets/cards/category_card.dart';
import '../../../../core/widgets/cards/download_progress_card.dart';
import '../../../../core/widgets/cards/network_status_card.dart';
import '../../../../core/widgets/inputs/app_search_bar.dart';
import '../../../../core/widgets/layout/section_header.dart';
import '../../../../shared/models/resource_preview.dart';
import '../providers/home_provider.dart';
import '../widgets/home_continue_reading_card.dart';
import '../widgets/home_hero_card.dart';
import '../widgets/home_quick_actions.dart';

/// Flagship Home Dashboard for StudyVault featuring rich academic discovery.
class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HomeState state = ref.watch(homeProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(AppSpacing.xs),
              decoration: const BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: AppRadius.rSm,
              ),
              child: const Icon(
                AppIcons.library,
                size: 20,
                color: AppColors.background,
              ),
            ),
            AppSpacing.gapW12,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  AppConstants.appName,
                  style: AppTypography.titleLarge.copyWith(fontWeight: FontWeight.w800),
                ),
                Text(
                  AppConstants.appTagline,
                  style: AppTypography.caption.copyWith(color: AppColors.secondary),
                ),
              ],
            ),
          ],
        ),
        actions: <Widget>[
          const AppBadge(variant: BadgeVariant.online, compact: true),
          AppSpacing.gapW12,
          IconButton(
            icon: const Icon(AppIcons.network, color: AppColors.secondary),
            onPressed: () => context.goNamed(AppRoutes.networkName),
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
          // Hero Search Trigger
          AppSearchBar(
            hintText: 'Search research papers, books, datasets...',
            readOnly: true,
            onTap: () => context.goNamed(AppRoutes.searchName),
            onSubmitted: (_) => context.goNamed(AppRoutes.searchResultsName),
          ),
          AppSpacing.gapH20,

          // Knowledge Network Mesh Status
          NetworkStatusCard(
            status: state.networkStatus,
            connectedPeers: state.connectedPeersCount,
            latencyMs: 0,
            bandwidthFormatted: '0 KB/s',
          ),
          AppSpacing.gapH20,

          // Quick Actions Row
          HomeQuickActions(
            onScanMesh: () => context.goNamed(AppRoutes.searchName),
            onAddToVault: () => context.goNamed(AppRoutes.libraryName),
            onCheckHealth: () => context.goNamed(AppRoutes.networkName),
            onViewTopology: () => context.goNamed(AppRoutes.networkName),
          ),
          AppSpacing.gapH24,

          // Hero Feature Banner
          HomeHeroCard(
            seederCount: '${state.connectedPeersCount}',
            indexedCount: '${state.featuredResources.length}',
            onExploreTap: () => context.goNamed(AppRoutes.searchName),
          ),
          AppSpacing.gapH24,

          // Continue Reading Section
          if (state.featuredResources.isNotEmpty) ...<Widget>[
            SectionHeader(
              title: 'Continue Reading',
              subtitle: 'Pick up where you left off in your vault',
              actionLabel: 'View Library',
              onAction: () => context.goNamed(AppRoutes.libraryName),
            ),
            AppSpacing.gapH12,
            HomeContinueReadingCard(
              title: state.featuredResources.first.title,
              authors: state.featuredResources.first.authors,
              progress: 0.1,
              currentPage: 1,
              totalPages: 50,
              onContinue: () => context.pushNamed(AppRoutes.resourceDetailsName),
            ),
            AppSpacing.gapH24,
          ],


          // Academic Categories Grid
          SectionHeader(
            title: 'Academic Domains',
            subtitle: 'Peer-curated repositories across disciplines',
            actionLabel: 'All Domains',
            onAction: () => context.goNamed(AppRoutes.searchName),
          ),
          AppSpacing.gapH12,
          GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: AppSpacing.md,
            mainAxisSpacing: AppSpacing.md,
            childAspectRatio: 1.35,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              CategoryCard(
                title: 'Computer Science',
                itemCount: '94,200 items',
                icon: AppIcons.code,
                accentColor: AppColors.primary,
                onTap: () => context.goNamed(AppRoutes.searchResultsName),
              ),
              CategoryCard(
                title: 'Mathematics',
                itemCount: '48,150 items',
                icon: AppIcons.sparkles,
                accentColor: AppColors.secondary,
                onTap: () => context.goNamed(AppRoutes.searchResultsName),
              ),
              CategoryCard(
                title: 'Physics',
                itemCount: '36,800 items',
                icon: AppIcons.network,
                accentColor: AppColors.success,
                onTap: () => context.goNamed(AppRoutes.searchResultsName),
              ),
              CategoryCard(
                title: 'Biology & Omics',
                itemCount: '52,400 items',
                icon: AppIcons.database,
                accentColor: AppColors.warning,
                onTap: () => context.goNamed(AppRoutes.searchResultsName),
              ),
            ],
          ),
          AppSpacing.gapH24,

          // Trending Resources Section
          SectionHeader(
            title: 'Trending Resources',
            subtitle: 'Highest peer seeding and consensus ratings',
            actionLabel: 'Search All',
            onAction: () => context.goNamed(AppRoutes.searchResultsName),
          ),
          AppSpacing.gapH12,
          ...state.featuredResources.map(
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
          AppSpacing.gapH24,

          // Recent Downloads & Active Sync
          const SectionHeader(
            title: 'Active Sync & Downloads',
            subtitle: 'Decentralized chunk propagation status',
          ),
          AppSpacing.gapH12,
          const DownloadProgressCard(
            title: 'Genomics Benchmark Suite v4.2 (Whole Genome Sequences)',
            progress: 0.82,
            downloadedBytesFormatted: '410 MB',
            totalBytesFormatted: '500 MB',
            speedFormatted: '5.4 MB/s',
            etaFormatted: '16s',
            peerSeeders: 114,
          ),
          AppSpacing.gapH48,
        ],
      ),
    );
  }
}
