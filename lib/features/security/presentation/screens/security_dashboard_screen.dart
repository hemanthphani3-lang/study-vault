import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/security/security_models.dart';
import '../providers/security_provider.dart';

/// Production-grade Zero Trust Security Gateway Dashboard for SVSG/1.0.
class SecurityDashboardScreen extends ConsumerStatefulWidget {
  const SecurityDashboardScreen({super.key});

  @override
  ConsumerState<SecurityDashboardScreen> createState() => _SecurityDashboardScreenState();
}

class _SecurityDashboardScreenState extends ConsumerState<SecurityDashboardScreen> {
  late final TextEditingController _nodeIdController;
  late final TextEditingController _metadataIdController;

  @override
  void initState() {
    super.initState();
    _nodeIdController = TextEditingController(text: 'node_alpha_client_01');
    _metadataIdController = TextEditingController(text: 'res_math_101');
  }

  @override
  void dispose() {
    _nodeIdController.dispose();
    _metadataIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final secState = ref.watch(securityGatewayProvider);
    final lastResponse = secState.lastResponse;
    final auditLogs = secState.auditLogs;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('SVSG Zero Trust Security Gateway'),
        backgroundColor: AppColors.surface,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh Audit Logs',
            onPressed: () {
              ref.read(securityGatewayProvider.notifier).refreshAuditLogs();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Gateway Telemetry Status Banner
            _buildGatewayStatusBanner(context, secState),
            const SizedBox(height: 20),

            // Pipeline Stage Results (if authorized/validated)
            if (lastResponse != null) ...<Widget>[
              _buildPipelineStatusCard(context, lastResponse),
              const SizedBox(height: 20),
            ],

            // Interactive Authorization Tester Panel
            _buildTesterPanel(context, secState),
            const SizedBox(height: 20),

            // Live Security Audit Trail
            _buildAuditLogsSection(context, auditLogs),
          ],
        ),
      ),
    );
  }

  Widget _buildGatewayStatusBanner(BuildContext context, SecurityGatewayStateContainer secState) {
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
                  const Icon(Icons.shield, color: AppColors.success, size: 24),
                  const SizedBox(width: 8),
                  Text('ZERO TRUST GATEWAY ACTIVE', style: AppTypography.caption.copyWith(color: AppColors.success)),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.primary),
                ),
                child: const Text('SVSG v1.0', style: TextStyle(color: AppColors.primary, fontSize: 11, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text('11-Stage Verification Engine', style: AppTypography.headlineSmall),
          const SizedBox(height: 6),
          const Text(
            'Enforces protocol version, Ed25519 node identity, discovery registration, replay nonces, and SHA-256 tokens.',
            style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _buildPipelineStatusCard(BuildContext context, SecurityAuthResponse response) {
    final bool passed = response.isAuthorized;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: passed ? AppColors.success : AppColors.error),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(passed ? Icons.verified_user : Icons.gpp_bad, color: passed ? AppColors.success : AppColors.error),
                  const SizedBox(width: 10),
                  Text(
                    passed ? 'AUTHORIZATION GRANTED' : 'AUTHORIZATION REJECTED',
                    style: TextStyle(color: passed ? AppColors.success : AppColors.error, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Text(
                'Sub-50ms',
                style: TextStyle(color: AppColors.textSecondary, fontSize: 12),
              ),
            ],
          ),
          if (response.authToken != null) ...<Widget>[
            const SizedBox(height: 10),
            Text('Token: ${response.authToken}', style: const TextStyle(color: AppColors.primary, fontFamily: 'monospace', fontSize: 12)),
          ],
          if (response.failureReason != null) ...<Widget>[
            const SizedBox(height: 10),
            Text('Reason: ${response.failureReason}', style: const TextStyle(color: AppColors.error, fontSize: 12)),
          ],
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: response.validationResults.entries.map((MapEntry<String, bool> e) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: e.value ? AppColors.success.withValues(alpha: 0.15) : AppColors.error.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  '${e.key}: ${e.value ? "✓ PASS" : "✗ FAIL"}',
                  style: TextStyle(color: e.value ? AppColors.success : AppColors.error, fontSize: 11, fontWeight: FontWeight.bold),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildTesterPanel(BuildContext context, SecurityGatewayStateContainer secState) {
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
          Text('SIMULATE SVSG AUTHORIZATION', style: AppTypography.caption),
          const SizedBox(height: 12),
          TextField(
            controller: _nodeIdController,
            style: const TextStyle(color: AppColors.textPrimary),
            decoration: const InputDecoration(
              labelText: 'Node ID',
              fillColor: AppColors.card,
              filled: true,
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _metadataIdController,
            style: const TextStyle(color: AppColors.textPrimary),
            decoration: const InputDecoration(
              labelText: 'Academic Metadata ID',
              fillColor: AppColors.card,
              filled: true,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: <Widget>[
              Expanded(
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.security),
                  label: const Text('Authorize Session'),
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
                  onPressed: secState.isValidating
                      ? null
                      : () {
                          final req = SecurityAuthRequest(
                            nodeId: _nodeIdController.text.trim(),
                            publicKeyHex: '0a1b2c3d4e5f60718293a4b5c6d7e8f90a1b2c3d4e5f60718293a4b5c6d7e8f9',
                            fingerprint: 'SHA256:AA:BB:CC:DD:EE:FF:11:22',
                            signatureHex: '11223344556677889900aabbccddeeff11223344556677889900aabbccddeeff',
                            timestamp: DateTime.now().toUtc(),
                            nonce: 'nonce_${DateTime.now().microsecondsSinceEpoch.toRadixString(36)}',
                            metadataId: _metadataIdController.text.trim(),
                            targetPeerId: 'node_seeder_01',
                            fileSizeBytes: 1048576,
                          );
                          ref.read(securityGatewayProvider.notifier).authorizeSession(req);
                        },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: OutlinedButton.icon(
                  icon: const Icon(Icons.replay),
                  label: const Text('Test Replay Attack'),
                  style: OutlinedButton.styleFrom(foregroundColor: AppColors.warning),
                  onPressed: secState.isValidating
                      ? null
                      : () {
                          // Submit exact duplicate nonce to trigger replay rejection
                          final req = SecurityAuthRequest(
                            nodeId: _nodeIdController.text.trim(),
                            publicKeyHex: '0a1b2c3d4e5f60718293a4b5c6d7e8f90a1b2c3d4e5f60718293a4b5c6d7e8f9',
                            fingerprint: 'SHA256:AA:BB:CC:DD:EE:FF:11:22',
                            signatureHex: '11223344556677889900aabbccddeeff11223344556677889900aabbccddeeff',
                            timestamp: DateTime.now().toUtc(),
                            nonce: 'DUPLICATE_NONCE_REPLAY_TEST',
                            metadataId: _metadataIdController.text.trim(),
                            targetPeerId: 'node_seeder_01',
                            fileSizeBytes: 1048576,
                          );
                          ref.read(securityGatewayProvider.notifier).authorizeSession(req);
                        },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAuditLogsSection(BuildContext context, List<SecurityAuditEntry> auditLogs) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('SANITIZED SECURITY AUDIT TRAIL (${auditLogs.length})', style: AppTypography.caption),
        const SizedBox(height: 10),
        if (auditLogs.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Center(child: Text('No security audit events logged yet.', style: TextStyle(color: AppColors.textSecondary))),
          )
        else
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: auditLogs.length > 10 ? 10 : auditLogs.length,
            itemBuilder: (BuildContext context, int index) {
              final entry = auditLogs[index];
              final bool isAuth = entry.policyDecision == 'AUTHORIZED';

              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.glassBorderSubtle),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      isAuth ? Icons.check_circle_outline : Icons.warning_amber_outlined,
                      color: isAuth ? AppColors.success : AppColors.error,
                      size: 18,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(entry.eventType, style: TextStyle(color: isAuth ? AppColors.success : AppColors.error, fontSize: 12, fontWeight: FontWeight.bold)),
                              Text(entry.timestamp.toIso8601String().substring(11, 19), style: const TextStyle(color: AppColors.textSecondary, fontSize: 11)),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(entry.details, style: const TextStyle(color: AppColors.textPrimary, fontSize: 12)),
                          const SizedBox(height: 2),
                          Text('Node: ${entry.nodeId} | Session: ${entry.sessionId}', style: const TextStyle(color: AppColors.textSecondary, fontSize: 10, fontFamily: 'monospace')),
                        ],
                      ),
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
