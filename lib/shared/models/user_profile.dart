import 'package:flutter/foundation.dart';

/// Immutable domain model for the local student/researcher vault profile.
@immutable
class UserProfile {
  const UserProfile({
    required this.publicKey,
    required this.pseudonym,
    required this.institution,
    required this.reputationScore,
    required this.totalSharedBytes,
    required this.savedItemsCount,
  });

  final String publicKey;
  final String pseudonym;
  final String institution;
  final int reputationScore;
  final int totalSharedBytes;
  final int savedItemsCount;

  static const UserProfile empty = UserProfile(
    publicKey: '0x0000000000000000000000000000000000000000',
    pseudonym: 'Anonymous Scholar',
    institution: 'Decentralized Academic Mesh',
    reputationScore: 100,
    totalSharedBytes: 0,
    savedItemsCount: 0,
  );
}
