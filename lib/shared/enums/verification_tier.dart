import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_icons.dart';

/// Cryptographic and peer-reviewed verification tiers for educational content.
enum VerificationTier {
  verified(
    label: 'Verified Source',
    color: AppColors.success,
    icon: AppIcons.verified,
    description: 'Cryptographically signed by institutional authority or verified repository.',
  ),
  peerReviewed(
    label: 'Peer-Reviewed',
    color: AppColors.primary,
    icon: AppIcons.peerReviewed,
    description: 'Reviewed by multiple decentralized academic network peers.',
  ),
  community(
    label: 'Community Seed',
    color: AppColors.secondary,
    icon: AppIcons.community,
    description: 'Shared by decentralized network peers with positive consensus.',
  ),
  unverified(
    label: 'Unverified',
    color: AppColors.hint,
    icon: AppIcons.unverified,
    description: 'Pending signature validation and peer quorum consensus.',
  );

  const VerificationTier({
    required this.label,
    required this.color,
    required this.icon,
    required this.description,
  });

  final String label;
  final Color color;
  final IconData icon;
  final String description;
}
