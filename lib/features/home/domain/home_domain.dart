import '../../../../shared/models/resource_preview.dart';

/// Clean Architecture domain repository contract for Home feed.
abstract interface class IHomeRepository {
  Future<List<ResourcePreview>> getFeaturedResources();
  Future<int> getPeerNodeCount();
}
