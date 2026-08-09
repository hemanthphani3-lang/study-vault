import '../../data/models/settings_model.dart';

/// Domain contract for storing user preferences, quorum security toggles, and cache parameters.
abstract interface class ISettingsRepository {
  Future<String?> getSettingValue(String key);
  Future<SettingsModel?> getSetting(String key);
  Future<void> setSetting(String key, String value, {String category = 'system', bool isEncrypted = false});
  Future<Map<String, String>> getAllSettings();
  Future<void> purgeCache();
}
