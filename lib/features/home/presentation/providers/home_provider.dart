import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/enums/network_status.dart';
import '../../../../shared/enums/resource_type.dart';
import '../../../../shared/enums/verification_tier.dart';
import '../../../../shared/models/resource_preview.dart';

/// State representation for the Home screen.
class HomeState {
  const HomeState({
    required this.networkStatus,
    required this.connectedPeersCount,
    required this.featuredResources,
    required this.isLoading,
  });

  final NetworkStatus networkStatus;
  final int connectedPeersCount;
  final List<ResourcePreview> featuredResources;
  final bool isLoading;

  static const HomeState initial = HomeState(
    networkStatus: NetworkStatus.online,
    connectedPeersCount: 42,
    isLoading: false,
    featuredResources: <ResourcePreview>[
      ResourcePreview(
        id: 'sv-res-001',
        title: 'Decentralized Academic Storage: Zero-Knowledge Verification Networks',
        authors: <String>['Dr. Elena Vance', 'Prof. Marcus Chen'],
        year: 2026,
        type: ResourceType.paper,
        verificationTier: VerificationTier.verified,
        sizeBytes: 14680064, // 14 MB
        peerSeeders: 34,
        cid: 'bafybeicg24pknox2zox7e22f254e2q3w5i6k7a8b9c0d1e2f3g4h5i6j7k',
        institution: 'Global Academic Protocol Lab',
        doi: '10.1038/s41586-026-04289-w',
        isDownloaded: true,
      ),
      ResourcePreview(
        id: 'sv-res-002',
        title: 'Global Genomic Variants: Benchmark Open-Source Dataset v4.2',
        authors: <String>['OpenBio Consortium'],
        year: 2025,
        type: ResourceType.dataset,
        verificationTier: VerificationTier.peerReviewed,
        sizeBytes: 524288000, // 500 MB
        peerSeeders: 89,
        cid: 'bafybeid74x4qknox2zox7e22f254e2q3w5i6k7a8b9c0d1e2f3g4h5i6j7k',
        institution: 'Open Bioinformatics Alliance',
      ),
      ResourcePreview(
        id: 'sv-res-003',
        title: 'Principles of Quantum Cryptography & Distributed Ledgers',
        authors: <String>['Prof. K. Thorne', 'Dr. S. Hawking Jr.'],
        year: 2026,
        type: ResourceType.book,
        verificationTier: VerificationTier.verified,
        sizeBytes: 47185920, // 45 MB
        peerSeeders: 61,
        cid: 'bafybeie99x1qknox2zox7e22f254e2q3w5i6k7a8b9c0d1e2f3g4h5i6j7k',
        institution: 'Institute for Advanced Study',
      ),
    ],
  );
}

final StateProvider<HomeState> homeProvider =
    StateProvider<HomeState>((Ref ref) => HomeState.initial);
