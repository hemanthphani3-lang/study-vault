import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/identity/node_profile.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../providers/identity_provider.dart';

/// Production-grade Node Identity Screen displaying cryptographically self-sovereign device identity.
class NodeIdentityScreen extends ConsumerWidget {
  const NodeIdentityScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final identityState = ref.watch(nodeIdentityProvider);
    final profile = identityState.profile;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Node Identity Dashboard'),
        backgroundColor: AppColors.surface,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh Identity',
            onPressed: () => ref.read(nodeIdentityProvider.notifier).refreshIdentity(),
          ),
        ],
      ),
      body: identityState.isLoading
          ? const Center(child: CircularProgressIndicator(color: AppColors.primary))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Node Status Header Card
                  _buildHeaderCard(context, profile, identityState.isRegistered),
                  const SizedBox(height: 20),

                  // Cryptographic Fingerprint Section
                  _buildFingerprintCard(context, profile?.fingerprint ?? ''),
                  const SizedBox(height: 20),

                  // Public Key Card
                  _buildPublicKeyCard(context, profile?.publicKeyHex ?? ''),
                  const SizedBox(height: 20),

                  // Node Capabilities Chips
                  _buildCapabilitiesSection(context, profile?.capabilities ?? <String>[]),
                  const SizedBox(height: 20),

                  // Platform Telemetry Card
                  _buildTelemetryCard(context, profile),
                ],
              ),
            ),
    );
  }

  Widget _buildHeaderCard(BuildContext context, NodeProfile? profile, bool isRegistered) {
    return Container(
      width: double.infinity,
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
              Text('NODE IDENTITY', style: AppTypography.caption),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: isRegistered ? AppColors.success.withValues(alpha: 0.2) : AppColors.warning.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: isRegistered ? AppColors.success : AppColors.warning),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      isRegistered ? Icons.check_circle : Icons.sync,
                      size: 14,
                      color: isRegistered ? AppColors.success : AppColors.warning,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      isRegistered ? 'REGISTERED' : 'UNREGISTERED / LOCAL',
                      style: TextStyle(
                        color: isRegistered ? AppColors.success : AppColors.warning,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SelectableText(
            profile?.nodeId ?? 'node_initializing',
            style: AppTypography.headlineMedium.copyWith(color: AppColors.textPrimary, fontFamily: 'monospace'),
          ),
          const SizedBox(height: 8),
          Text(
            'Cryptographic Device Identifier (Ed25519)',
            style: AppTypography.bodySmall.copyWith(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }

  Widget _buildFingerprintCard(BuildContext context, String fingerprint) {
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
          Text('SHA-256 FINGERPRINT', style: AppTypography.caption),
          const SizedBox(height: 8),
          Row(
            children: <Widget>[
              const Icon(Icons.fingerprint, color: AppColors.primary, size: 24),
              const SizedBox(width: 12),
              Expanded(
                child: SelectableText(
                  fingerprint,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontFamily: 'monospace',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.copy, size: 18, color: AppColors.textSecondary),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: fingerprint));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Fingerprint copied to clipboard')),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPublicKeyCard(BuildContext context, String pubKeyHex) {
    final String truncated = pubKeyHex.length > 24
        ? '${pubKeyHex.substring(0, 16)}...${pubKeyHex.substring(pubKeyHex.length - 12)}'
        : pubKeyHex;

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
          Text('ED25519 PUBLIC KEY', style: AppTypography.caption),
          const SizedBox(height: 8),
          Row(
            children: <Widget>[
              const Icon(Icons.key, color: AppColors.secondary, size: 24),
              const SizedBox(width: 12),
              Expanded(
                child: SelectableText(
                  truncated,
                  style: const TextStyle(color: AppColors.textPrimary, fontFamily: 'monospace'),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.copy, size: 18, color: AppColors.textSecondary),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: pubKeyHex));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Public key copied to clipboard')),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCapabilitiesSection(BuildContext context, List<String> capabilities) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('NODE CAPABILITIES', style: AppTypography.caption),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: capabilities.map((String cap) {
            return Chip(
              backgroundColor: AppColors.surface,
              side: const BorderSide(color: AppColors.primary),
              label: Text(
                cap,
                style: const TextStyle(color: AppColors.primary, fontSize: 12),
              ),
              avatar: const Icon(Icons.bolt, size: 14, color: AppColors.primary),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildTelemetryCard(BuildContext context, NodeProfile? profile) {
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
          Text('SYSTEM TELEMETRY', style: AppTypography.caption),
          const SizedBox(height: 12),
          _buildInfoRow('Platform', profile?.platform ?? 'Unknown'),
          _buildInfoRow('App Version', profile?.appVersion ?? '0.10.0-alpha'),
          _buildInfoRow('Country', profile?.countryCode ?? 'US'),
          _buildInfoRow('Trust Score', '${profile?.trustScore ?? 1.0}'),
          _buildInfoRow('Reputation Tier', profile?.reputationTier ?? 'standard'),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(label, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13)),
          Text(value, style: const TextStyle(color: AppColors.textPrimary, fontSize: 13, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
