import '../domain/settings_domain.dart';

/// Concrete Settings repository implementation.
class SettingsRepositoryImpl implements ISettingsRepository {
  const SettingsRepositoryImpl();

  @override
  Future<bool> getP2PRelaying() async => true;

  @override
  Future<void> setP2PRelaying(bool enabled) async {}
}
