import '../../domain/repositories/settings_repository.dart';
import '../datasources/local/local_data_source.dart';
import '../models/settings_model.dart';

/// Concrete repository implementation for Settings using [ILocalDataSource].
class SettingsRepositoryImpl implements ISettingsRepository {
  const SettingsRepositoryImpl(this._localDataSource);

  final ILocalDataSource _localDataSource;

  @override
  Future<String?> getSettingValue(String key) async {
    final SettingsModel? item = await _localDataSource.getSetting(key);
    return item?.value;
  }

  @override
  Future<SettingsModel?> getSetting(String key) {
    return _localDataSource.getSetting(key);
  }

  @override
  Future<void> setSetting(String key, String value, {String category = 'system', bool isEncrypted = false}) {
    return _localDataSource.saveSetting(
      SettingsModel(
        id: 'setting_$key',
        key: key,
        value: value,
        category: category,
        isEncrypted: isEncrypted,
        updatedAt: DateTime.now(),
      ),
    );
  }

  @override
  Future<Map<String, String>> getAllSettings() {
    return _localDataSource.getAllSettings();
  }

  @override
  Future<void> purgeCache() {
    return _localDataSource.purgeSoftDeleted();
  }
}
