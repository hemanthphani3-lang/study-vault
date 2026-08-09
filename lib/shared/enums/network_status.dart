import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

/// Represents the overall status of the StudyVault P2P network client.
enum NetworkStatus {
  online(
    label: 'Online & Synced',
    color: AppColors.success,
    description: 'Connected to peer network with active DHT routing.',
  ),
  connecting(
    label: 'Discovering Peers',
    color: AppColors.warning,
    description: 'Searching for bootstrap nodes and resolving routing table.',
  ),
  p2pActive(
    label: 'P2P Relaying',
    color: AppColors.secondary,
    description: 'Actively serving verified chunks to the peer network.',
  ),
  offline(
    label: 'Offline (Local Vault)',
    color: AppColors.error,
    description: 'Operating in isolated offline mode. Local files available.',
  );

  const NetworkStatus({
    required this.label,
    required this.color,
    required this.description,
  });

  final String label;
  final Color color;
  final String description;
}
