import '../../../../shared/models/resource_preview.dart';
import '../domain/home_domain.dart';
import '../presentation/providers/home_provider.dart';

/// Concrete Home repository implementation.
class HomeRepositoryImpl implements IHomeRepository {
  const HomeRepositoryImpl();

  @override
  Future<List<ResourcePreview>> getFeaturedResources() async {
    return HomeState.initial.featuredResources;
  }

  @override
  Future<int> getPeerNodeCount() async => 42;
}
