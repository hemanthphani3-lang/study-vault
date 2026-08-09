import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

/// Connection status of an individual P2P node in the mesh.
enum PeerStatus {
  connected(label: 'Connected', color: AppColors.success),
  relaying(label: 'Relaying', color: AppColors.secondary),
  connecting(label: 'Connecting', color: AppColors.warning),
  disconnected(label: 'Disconnected', color: AppColors.error);

  const PeerStatus({required this.label, required this.color});

  final String label;
  final Color color;
}
