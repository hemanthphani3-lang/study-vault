import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/enums/network_status.dart';
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
    connectedPeersCount: 0,
    isLoading: false,
    featuredResources: <ResourcePreview>[],
  );

}

final StateProvider<HomeState> homeProvider =
    StateProvider<HomeState>((Ref ref) => HomeState.initial);
