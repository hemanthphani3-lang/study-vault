import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/discovery/peer_node_model.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../providers/discovery_provider.dart';

/// Production-grade Peer Discovery Screen for StudyVault Discovery Protocol (SVDP).
class PeerDiscoveryScreen extends ConsumerStatefulWidget {
  const PeerDiscoveryScreen({
    super.key,
    this.initialMetadataId = 'res_math_101',
  });

  final String initialMetadataId;

  @override
  ConsumerState<PeerDiscoveryScreen> createState() => _PeerDiscoveryScreenState();
}

class _PeerDiscoveryScreenState extends ConsumerState<PeerDiscoveryScreen> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: widget.initialMetadataId);
    Future.microtask(() {
      ref.read(peerDiscoveryProvider.notifier).discoverPeers(widget.initialMetadataId);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final discoveryState = ref.watch(peerDiscoveryProvider);
    final peers = discoveryState.peers;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('SVDP Peer Discovery'),
        backgroundColor: AppColors.surface,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.radar),
            tooltip: 'Rescan Network',
            onPressed: () {
              final query = _searchController.text.trim();
              if (query.isNotEmpty) {
                ref.read(peerDiscoveryProvider.notifier).discoverPeers(query);
              }
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          // Search & Filter Header
          _buildSearchHeader(context),

          // Network Seeder Telemetry Banner
          _buildTelemetryBanner(context, discoveryState),

          // Discovered Peers List
          Expanded(
            child: discoveryState.isLoading
                ? const Center(child: CircularProgressIndicator(color: AppColors.primary))
                : peers.isEmpty
                    ? _buildEmptyState(context)
                    : ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: peers.length,
                        itemBuilder: (BuildContext context, int index) {
                          return _buildPeerCard(context, peers[index], index + 1);
                        },
                      ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: AppColors.surface,
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _searchController,
              style: const TextStyle(color: AppColors.textPrimary),
              decoration: InputDecoration(
                hintText: 'Enter Metadata ID (e.g. res_math_101)',
                hintStyle: const TextStyle(color: AppColors.hint),
                filled: true,
                fillColor: AppColors.card,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Icon(Icons.search, color: AppColors.primary),
              ),
              onSubmitted: (String val) {
                if (val.trim().isNotEmpty) {
                  ref.read(peerDiscoveryProvider.notifier).discoverPeers(val.trim());
                }
              },
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
            onPressed: () {
              final query = _searchController.text.trim();
              if (query.isNotEmpty) {
                ref.read(peerDiscoveryProvider.notifier).discoverPeers(query);
              }
            },
            child: const Text('Discover', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildTelemetryBanner(BuildContext context, PeerDiscoveryState state) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: const BoxDecoration(
        color: AppColors.card,
        border: Border(bottom: BorderSide(color: AppColors.glassBorderSubtle)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              const Icon(Icons.sensors, color: AppColors.success, size: 18),
              const SizedBox(width: 8),
              Text(
                'ONLINE SEEDERS FOUND: ${state.totalOnlineSeeders}',
                style: const TextStyle(color: AppColors.success, fontWeight: FontWeight.bold, fontSize: 13),
              ),
            ],
          ),
          Text(
            'SVDP v1.0 (SVE-003)',
            style: AppTypography.caption,
          ),
        ],
      ),
    );
  }

  Widget _buildPeerCard(BuildContext context, PeerNodeModel peer, int rank) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.glassBorderSubtle),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 14,
                    backgroundColor: AppColors.primary.withValues(alpha: 0.2),
                    child: Text('#$rank', style: const TextStyle(color: AppColors.primary, fontSize: 11, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(width: 10),
                  Text(peer.nodeId, style: AppTypography.titleMedium),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.primary),
                ),
                child: Text(
                  'Rank Score: ${peer.rankScore}',
                  style: const TextStyle(color: AppColors.primary, fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(peer.fingerprint, style: const TextStyle(color: AppColors.textSecondary, fontFamily: 'monospace', fontSize: 12)),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Wrap(
                spacing: 6,
                children: peer.capabilities.take(3).map((String cap) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: AppColors.card,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(cap, style: const TextStyle(color: AppColors.textSecondary, fontSize: 11)),
                  );
                }).toList(),
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.wifi, size: 14, color: peer.pingMs < 50 ? AppColors.success : AppColors.warning),
                  const SizedBox(width: 4),
                  Text('${peer.pingMs}ms', style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                  const SizedBox(width: 12),
                  Text('🌐 ${peer.country}', style: const TextStyle(color: AppColors.textPrimary, fontSize: 12, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(Icons.radar_outlined, size: 64, color: AppColors.hint),
          const SizedBox(height: 16),
          Text('No peer seeders discovered for this metadata ID.', style: AppTypography.titleMedium),
          const SizedBox(height: 8),
          const Text('Try searching another academic resource ID.', style: TextStyle(color: AppColors.textSecondary)),
        ],
      ),
    );
  }
}
