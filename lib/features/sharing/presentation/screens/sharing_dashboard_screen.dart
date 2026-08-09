import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/sharing/sharing_models.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../providers/sharing_provider.dart';

/// Production-grade SVCS Automatic Content Sharing Dashboard UI for SVE-007.
class SharingDashboardScreen extends ConsumerStatefulWidget {
  const SharingDashboardScreen({super.key});

  @override
  ConsumerState<SharingDashboardScreen> createState() => _SharingDashboardScreenState();
}

class _SharingDashboardScreenState extends ConsumerState<SharingDashboardScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(contentSharingProvider.notifier).refreshCatalog();
    });
  }

  @override
  Widget build(BuildContext context) {
    final sharingState = ref.watch(contentSharingProvider);
    final policy = sharingState.policy;
    final catalog = sharingState.catalog;
    final telemetry = sharingState.telemetry;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('SVCS Automatic Content Sharing'),
        backgroundColor: AppColors.surface,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.playlist_add_check),
            tooltip: 'Simulate Verified Download Auto-Share',
            onPressed: () {
              final id = DateTime.now().millisecondsSinceEpoch;
              ref.read(contentSharingProvider.notifier).registerNewDownload(
                    metadataId: 'res_paper_$id',
                    title: 'Quantum Field Algorithms in P2P Mesh Networks.pdf',
                    cid: 'bafybeic77889900112233445566778899001122',
                    fileSizeBytes: 2097152,
                  );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Telemetry Banner
            _buildTelemetryBanner(context, telemetry),
            const SizedBox(height: 20),

            // Policy Settings Panel
            _buildPolicyCard(context, policy, ref),
            const SizedBox(height: 20),

            // Catalog List
            _buildCatalogSection(context, catalog),
          ],
        ),
      ),
    );
  }

  Widget _buildTelemetryBanner(BuildContext context, SharingTelemetry? telemetry) {
    final int advertised = telemetry?.advertisedCount ?? 0;
    final int total = telemetry?.totalSharedCount ?? 0;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppColors.cardGradient,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.glassBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  const Icon(Icons.share, color: AppColors.success, size: 24),
                  const SizedBox(width: 8),
                  Text('AUTOMATIC P2P SEEDING ACTIVE', style: AppTypography.caption.copyWith(color: AppColors.success)),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.primary),
                ),
                child: const Text('SVCS v1.0', style: TextStyle(color: AppColors.primary, fontSize: 11, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text('$advertised / $total Resources Advertised', style: AppTypography.headlineSmall),
          const SizedBox(height: 6),
          const Text(
            'Only verified downloads are shared. Manual file uploads are strictly prohibited. Local file paths are never exposed.',
            style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _buildPolicyCard(BuildContext context, SharingPolicy policy, WidgetRef ref) {
    final notifier = ref.read(contentSharingProvider.notifier);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.glassBorderSubtle),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('SHARING POLICY SETTINGS', style: AppTypography.caption),
          const SizedBox(height: 12),
          SwitchListTile(
            title: const Text('Allow Mobile Data Seeding', style: TextStyle(color: AppColors.textPrimary, fontSize: 14)),
            subtitle: const Text('Off = Wi-Fi Only sharing', style: TextStyle(color: AppColors.textSecondary, fontSize: 12)),
            value: policy.allowMobileData,
            onChanged: (bool val) => notifier.toggleAllowMobileData(val),
          ),
          const Divider(color: AppColors.glassBorderSubtle),
          SwitchListTile(
            title: const Text('Require Charging', style: TextStyle(color: AppColors.textPrimary, fontSize: 14)),
            subtitle: const Text('Pause seeding unless plugged into power', style: TextStyle(color: AppColors.textSecondary, fontSize: 12)),
            value: policy.requireCharging,
            onChanged: (bool val) => notifier.toggleRequireCharging(val),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('Min Battery Level:', style: TextStyle(color: AppColors.textSecondary, fontSize: 13)),
                Text('${policy.minBatteryLevelPercentage}%', style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCatalogSection(BuildContext context, List<SharedResourceRecord> catalog) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('AUTOMATIC SEEDING CATALOG (${catalog.length})', style: AppTypography.caption),
        const SizedBox(height: 10),
        if (catalog.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Center(child: Text('No verified downloads ready for seeding.', style: TextStyle(color: AppColors.textSecondary))),
          )
        else
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: catalog.length,
            itemBuilder: (BuildContext context, int index) {
              final item = catalog[index];
              final bool isAd = item.isAdvertised;

              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: isAd ? AppColors.success : AppColors.glassBorderSubtle),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(child: Text(item.title, style: AppTypography.titleMedium, overflow: TextOverflow.ellipsis)),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: isAd ? AppColors.success.withValues(alpha: 0.15) : AppColors.warning.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            item.status.name.toUpperCase(),
                            style: TextStyle(color: isAd ? AppColors.success : AppColors.warning, fontSize: 11, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text('CID: ${item.cid}', style: const TextStyle(color: AppColors.primary, fontFamily: 'monospace', fontSize: 11)),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Metadata: ${item.metadataId}', style: const TextStyle(color: AppColors.textSecondary, fontSize: 11)),
                        Text('${(item.fileSizeBytes / (1024 * 1024)).toStringAsFixed(2)} MB', style: const TextStyle(color: AppColors.textPrimary, fontSize: 12, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
      ],
    );
  }
}
