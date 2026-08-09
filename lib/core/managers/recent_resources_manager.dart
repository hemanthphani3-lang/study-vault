import 'dart:collection';
import '../../data/models/resource_model.dart';
import '../../domain/repositories/resource_repository.dart';

/// Local manager maintaining the recent resources access log with LRU cap.
class RecentResourcesManager {
  RecentResourcesManager({
    required IResourceRepository resourceRepository,
    this.maxRecentCount = 20,
  }) : _resourceRepo = resourceRepository;

  final IResourceRepository _resourceRepo;
  final int maxRecentCount;
  final LinkedHashMap<String, ResourceModel> _recentMap = LinkedHashMap<String, ResourceModel>();

  /// Records that a user opened or accessed a resource.
  Future<void> recordAccess(String resourceId) async {
    final ResourceModel? res = await _resourceRepo.getResourceById(resourceId);
    if (res != null) {
      _recentMap.remove(resourceId);
      if (_recentMap.length >= maxRecentCount) {
        _recentMap.remove(_recentMap.keys.first);
      }
      _recentMap[resourceId] = res;
    }
  }

  /// Returns recent resources ordered from most recent to least recent.
  List<ResourceModel> getRecentResources() {
    return _recentMap.values.toList().reversed.toList();
  }

  /// Clears in-memory recent resources log.
  void clearRecent() {
    _recentMap.clear();
  }
}
