import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_icons.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_shadows.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/badges/app_badge.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../core/widgets/buttons/secondary_button.dart';
import '../../../../core/widgets/cards/glass_card.dart';
import '../../../../core/widgets/cards/glass_container.dart';
import '../../../../core/widgets/layout/app_divider.dart';
import '../../../../core/widgets/layout/top_app_bar.dart';
import '../../../../core/widgets/overlays/reusable_dialog.dart';

/// Detailed Academic Resource Screen with P2P Swarm telemetry, country distribution, and vault download.
class ResourceDetailsView extends ConsumerStatefulWidget {
  const ResourceDetailsView({super.key});

  @override
  ConsumerState<ResourceDetailsView> createState() => _ResourceDetailsViewState();
}

class _ResourceDetailsViewState extends ConsumerState<ResourceDetailsView> {
  bool _isSavedToVault = false;
  bool _isDownloading = false;

  void _triggerDownload() {
    setState(() {
      _isDownloading = true;
    });

    Future<void>.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) {
        setState(() {
          _isDownloading = false;
          _isSavedToVault = true;
        });

        ReusableDialog.show<void>(
          context: context,
          icon: AppIcons.check,
          title: 'Synced to Vault',
          description:
              'All 32 cryptographically verified chunks have been assembled and stored in your local SQLite Drift database.',
          primaryActionLabel: 'Open in Reader',
          secondaryActionLabel: 'Done',
          onPrimaryAction: () => Navigator.of(context).pop(),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: TopAppBar(
        title: 'Resource Details',
        subtitle: 'Cryptographically Verified CID',
        showBackButton: true,
        onBackTap: () => context.pop(),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              _isSavedToVault ? AppIcons.favorite : AppIcons.favoriteBorder,
              color: _isSavedToVault ? AppColors.error : AppColors.hint,
            ),
            onPressed: () {
              setState(() {
                _isSavedToVault = !_isSavedToVault;
              });
            },
          ),
          IconButton(
            icon: const Icon(AppIcons.share, color: AppColors.textPrimary),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        children: <Widget>[
          // Hero Cover Presentation Card
          GlassContainer(
            padding: AppSpacing.cardPadding,
            child: Column(
              children: <Widget>[
                Container(
                  width: 120,
                  height: 160,
                  decoration: const BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: AppRadius.rMd,
                    border: Border.fromBorderSide(
                      BorderSide(color: AppColors.glassBorder, width: 1.5),
                    ),
                    boxShadow: AppShadows.floating,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[
                        AppColors.surface,
                        AppColors.card,
                      ],
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      AppIcons.book,
                      color: AppColors.primary,
                      size: 48,
                    ),
                  ),
                ),
                AppSpacing.gapH20,
                Text(
                  'Distributed Consensus & ZK-Rollups in Academic Archives',
                  style: AppTypography.headlineSmall.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                  textAlign: TextAlign.center,
                ),
                AppSpacing.gapH8,
                Text(
                  'Dr. Elena Vance • Prof. Marcus Chen • Dr. A. Thorne',
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),
                AppSpacing.gapH16,
                const Wrap(
                  alignment: WrapAlignment.center,
                  spacing: AppSpacing.sm,
                  runSpacing: AppSpacing.xs,
                  children: <Widget>[
                    AppBadge(variant: BadgeVariant.verified),
                    AppBadge(variant: BadgeVariant.online),
                    AppBadge(variant: BadgeVariant.featured),
                  ],
                ),
              ],
            ),
          ),
          AppSpacing.gapH24,

          // Action Buttons: Primary Download to Vault & View Online
          Row(
            children: <Widget>[
              Expanded(
                child: PrimaryButton(
                  label: _isSavedToVault ? 'Stored in Vault' : 'Sync to Local Vault',
                  icon: _isSavedToVault ? AppIcons.check : AppIcons.download,
                  isLoading: _isDownloading,
                  onPressed: _isSavedToVault ? null : _triggerDownload,
                ),
              ),
              AppSpacing.gapW12,
              Expanded(
                child: SecondaryButton(
                  label: 'View Online',
                  icon: AppIcons.network,
                  onPressed: () {},
                ),
              ),
            ],
          ),
          AppSpacing.gapH24,

          // Metadata Grid Card
          GlassCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Document Metadata',
                  style: AppTypography.titleMedium.copyWith(fontWeight: FontWeight.w700),
                ),
                const AppDivider(isGlowing: true),
                const _MetadataRow(label: 'Content ID (CID)', value: 'bafybeic5...73d9f4a'),
                const _MetadataRow(label: 'Digital Object ID', value: '10.1145/3372297.3417882'),
                const _MetadataRow(label: 'Publication Year', value: '2026'),
                const _MetadataRow(label: 'Resource Type', value: 'Peer-Reviewed Research Paper'),
                const _MetadataRow(label: 'File Format', value: 'PDF + Encrypted Markdown'),
                const _MetadataRow(label: 'File Size', value: '14.2 MB (32 Chunks)'),
                const _MetadataRow(label: 'License', value: 'Creative Commons CC-BY 4.0'),
              ],
            ),
          ),
          AppSpacing.gapH24,

          // Abstract & Description
          GlassCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Abstract',
                  style: AppTypography.titleMedium.copyWith(fontWeight: FontWeight.w700),
                ),
                AppSpacing.gapH12,
                Text(
                  'This paper introduces a decentralized protocol for academic peer distribution utilizing zero-knowledge succinct non-interactive arguments of knowledge (zk-SNARKs). By verifying cryptographic proof of consensus across a permissionless student network, StudyVault guarantees censorship resistance, archival longevity, and instantaneous offline vault accessibility without trusting centralized cloud intermediaries.',
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
          AppSpacing.gapH24,

          // Availability & P2P Swarm Status
          GlassCard(
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
                        AppIcons.peers,
                        color: AppColors.secondary,
                        size: 20,
                      ),
                    ),
                    AppSpacing.gapW12,
                    Text(
                      'P2P Swarm Health',
                      style: AppTypography.titleMedium.copyWith(fontWeight: FontWeight.w700),
                    ),
                    const Spacer(),
                    const AppBadge(variant: BadgeVariant.online, compact: true),
                  ],
                ),
                const AppDivider(),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _SwarmStat(label: 'Active Seeders', value: '142 nodes'),
                    _SwarmStat(label: 'Leechers', value: '18 nodes'),
                    _SwarmStat(label: 'Avg Speed', value: '8.4 MB/s'),
                  ],
                ),
                AppSpacing.gapH16,
                Text(
                  'Geodistributed Node Locations',
                  style: AppTypography.labelMedium.copyWith(color: AppColors.hint),
                ),
                AppSpacing.gapH8,
                const Wrap(
                  spacing: AppSpacing.xs,
                  runSpacing: AppSpacing.xs,
                  children: <Widget>[
                    _CountryPill(country: 'Germany 🇩🇪', nodes: 38),
                    _CountryPill(country: 'United States 🇺🇸', nodes: 44),
                    _CountryPill(country: 'Japan 🇯🇵', nodes: 22),
                    _CountryPill(country: 'Singapore 🇸🇬', nodes: 19),
                    _CountryPill(country: 'Brazil 🇧🇷', nodes: 14),
                  ],
                ),
              ],
            ),
          ),
          AppSpacing.gapH48,
        ],
      ),
    );
  }
}

class _MetadataRow extends StatelessWidget {
  const _MetadataRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 130,
            child: Text(
              label,
              style: AppTypography.bodySmall.copyWith(color: AppColors.hint),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SwarmStat extends StatelessWidget {
  const _SwarmStat({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          value,
          style: AppTypography.titleSmall.copyWith(
            fontWeight: FontWeight.w800,
            color: AppColors.textPrimary,
          ),
        ),
        AppSpacing.gapH2,
        Text(
          label,
          style: AppTypography.caption.copyWith(color: AppColors.hint),
        ),
      ],
    );
  }
}

class _CountryPill extends StatelessWidget {
  const _CountryPill({required this.country, required this.nodes});

  final String country;
  final int nodes;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppRadius.rSm,
        border: Border.all(color: AppColors.glassBorderSubtle),
      ),
      child: Text(
        '$country ($nodes)',
        style: AppTypography.caption.copyWith(
          color: AppColors.textSecondary,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
