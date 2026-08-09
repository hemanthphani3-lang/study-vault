import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_icons.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_shadows.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/badges/app_badge.dart';
import '../../../../core/widgets/buttons/glass_button.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../core/widgets/buttons/secondary_button.dart';
import '../../../../core/widgets/cards/glass_card.dart';
import '../../../../core/widgets/layout/section_header.dart';
import '../../../../core/widgets/overlays/app_bottom_sheet.dart';
import '../../../../core/widgets/overlays/reusable_dialog.dart';
import '../providers/settings_provider.dart';

/// Comprehensive Settings & Node Configuration Screen.
class SettingsView extends ConsumerStatefulWidget {
  const SettingsView({super.key});

  @override
  ConsumerState<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends ConsumerState<SettingsView> {
  void _showClearCacheDialog() {
    ReusableDialog.show<void>(
      context: context,
      icon: AppIcons.delete,
      title: 'Clear Local Cache?',
      description:
          'This will purge unpinned chunk files while preserving all verified metadata and SQLite Drift records.',
      primaryActionLabel: 'Purge Cache',
      secondaryActionLabel: 'Cancel',
      onPrimaryAction: () {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: AppColors.surface,
            content: Text(
              'Unpinned cache purged successfully (42 MB freed).',
              style: AppTypography.bodySmall.copyWith(color: AppColors.success),
            ),
          ),
        );
      },
    );
  }

  void _showMessageAdminSheet() {
    AppBottomSheet.show<void>(
      context: context,
      title: 'Message Network Admin',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Transmit an encrypted diagnostic ping or peer dispute to the federated network administrators.',
            style: AppTypography.bodySmall.copyWith(color: AppColors.textSecondary),
          ),
          AppSpacing.gapH16,
          TextField(
            maxLines: 4,
            style: AppTypography.bodyMedium,
            decoration: InputDecoration(
              hintText: 'Describe issue or report unverified seeder node...',
              hintStyle: AppTypography.bodySmall.copyWith(color: AppColors.hint),
              filled: true,
              fillColor: AppColors.card,
              border: const OutlineInputBorder(
                borderRadius: AppRadius.rMd,
                borderSide: BorderSide(color: AppColors.glassBorderSubtle),
              ),
            ),
          ),
          AppSpacing.gapH20,
          PrimaryButton(
            label: 'Transmit Encrypted Message',
            icon: AppIcons.upload,
            isFullWidth: true,
            onPressed: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: AppColors.surface,
                  content: Text(
                    'Encrypted diagnostic transmitted to 3 quorum admins.',
                    style: AppTypography.bodySmall.copyWith(color: AppColors.secondary),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _showAboutDialog() {
    ReusableDialog.show<void>(
      context: context,
      icon: AppIcons.sparkles,
      title: 'About StudyVault',
      description:
          '${AppConstants.appName} is an open-source decentralized academic knowledge network built to guarantee censorship-resistant education across peer-to-peer swarms.\n\nVersion: ${AppConstants.appVersion}\nLicense: Apache 2.0\nArchitecture: Clean Architecture & Drift SQLite',
      primaryActionLabel: 'Got It',
    );
  }

  @override
  Widget build(BuildContext context) {
    final SettingsState settings = ref.watch(settingsProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Settings & Node Preferences',
          style: AppTypography.titleLarge.copyWith(fontWeight: FontWeight.w800),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        children: <Widget>[
          // Academic Identity Profile Card
          GlassCard(
            child: Row(
              children: <Widget>[
                Container(
                  width: 56,
                  height: 56,
                  decoration: const BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    shape: BoxShape.circle,
                    boxShadow: AppShadows.primaryGlow,
                  ),
                  child: const Center(
                    child: Icon(
                      AppIcons.profile,
                      color: AppColors.background,
                      size: 28,
                    ),
                  ),
                ),
                AppSpacing.gapW16,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            'Academic Seeder Node',
                            style: AppTypography.titleMedium.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          AppSpacing.gapW8,
                          const AppBadge(variant: BadgeVariant.premium, compact: true),
                        ],
                      ),
                      AppSpacing.gapH2,
                      Text(
                        'Public Key: 0x8F32...A9B1',
                        style: AppTypography.codeSnippet.copyWith(
                          color: AppColors.hint,
                          fontSize: 11,
                        ),
                      ),
                      AppSpacing.gapH4,
                      Text(
                        'Reputation: 99.8% Verified Quorum',
                        style: AppTypography.caption.copyWith(
                          color: AppColors.secondary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          AppSpacing.gapH24,

          // Theme & Appearance
          const SectionHeader(
            title: 'Appearance',
            subtitle: 'Celestial Knowledge design language',
          ),
          AppSpacing.gapH12,
          GlassCard(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    const Icon(AppIcons.sparkles, color: AppColors.primary, size: 20),
                    AppSpacing.gapW12,
                    Text(
                      'Celestial Dark Mode',
                      style: AppTypography.bodyMedium.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const AppBadge(variant: BadgeVariant.featured, compact: true),
              ],
            ),
          ),
          AppSpacing.gapH24,

          // Storage & Vault Allocation
          const SectionHeader(
            title: 'Storage & Offline Vault',
            subtitle: 'Local SQLite Drift database management',
          ),
          AppSpacing.gapH12,
          GlassCard(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        const Icon(AppIcons.database, color: AppColors.secondary, size: 20),
                        AppSpacing.gapW12,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Offline Cache Size',
                              style: AppTypography.bodyMedium.copyWith(fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '84.6 MB used of 2.0 GB quota',
                              style: AppTypography.caption.copyWith(color: AppColors.hint),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SecondaryButton(
                      label: 'Purge',
                      size: ButtonSize.small,
                      onPressed: _showClearCacheDialog,
                    ),
                  ],
                ),
              ],
            ),
          ),
          AppSpacing.gapH24,

          // Security & Cryptographic Keyring
          const SectionHeader(
            title: 'Security & Verification',
            subtitle: 'Zero-knowledge verification and signatures',
          ),
          AppSpacing.gapH12,
          GlassCard(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        const Icon(AppIcons.shield, color: AppColors.success, size: 20),
                        AppSpacing.gapW12,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Strict Quorum Verification',
                              style: AppTypography.bodyMedium.copyWith(fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Require 3+ institutional signatures',
                              style: AppTypography.caption.copyWith(color: AppColors.hint),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Switch(
                      value: settings.enablePeerDiscovery,
                      activeThumbColor: AppColors.primary,
                      activeTrackColor: AppColors.primary.withValues(alpha: 0.35),
                      onChanged: (bool val) {
                        ref.read(settingsProvider.notifier).togglePeerDiscovery(val);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          AppSpacing.gapH24,

          // Network & DHT Relays
          const SectionHeader(
            title: 'Decentralized Network',
            subtitle: 'P2P transport & DHT configuration',
          ),
          AppSpacing.gapH12,
          GlassCard(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        const Icon(AppIcons.network, color: AppColors.warning, size: 20),
                        AppSpacing.gapW12,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Background Mesh Sync',
                              style: AppTypography.bodyMedium.copyWith(fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Periodically discover and index new papers',
                              style: AppTypography.caption.copyWith(color: AppColors.hint),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Switch(
                      value: settings.enableBackgroundSync,
                      activeThumbColor: AppColors.primary,
                      activeTrackColor: AppColors.primary.withValues(alpha: 0.35),
                      onChanged: (bool val) {
                        ref.read(settingsProvider.notifier).toggleBackgroundSync(val);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          AppSpacing.gapH24,

          // Actions: Message Admin & About
          Row(
            children: <Widget>[
              Expanded(
                child: SecondaryButton(
                  label: 'Message Admin',
                  icon: AppIcons.help,
                  onPressed: _showMessageAdminSheet,
                ),
              ),
              AppSpacing.gapW12,
              Expanded(
                child: GlassButton(
                  label: 'About StudyVault',
                  icon: AppIcons.sparkles,
                  onPressed: _showAboutDialog,
                ),
              ),
            ],
          ),
          AppSpacing.gapH48,
        ],
      ),
    );
  }
}
