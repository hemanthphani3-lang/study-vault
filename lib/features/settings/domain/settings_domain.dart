/// Clean Architecture domain contract for Settings.
abstract interface class ISettingsRepository {
  Future<bool> getP2PRelaying();
  Future<void> setP2PRelaying(bool enabled);
}
