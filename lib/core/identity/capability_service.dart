import 'dart:io';

/// Capability Service assessing local device node capabilities.
class CapabilityService {
  const CapabilityService();

  /// Determines default node capabilities based on platform environment.
  List<String> getDeviceCapabilities() {
    final List<String> caps = <String>['metadata_relay', 'search_index', 'local_vault'];
    
    if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      caps.add('peer_seeder');
      caps.add('full_node');
    } else if (Platform.isAndroid || Platform.isIOS) {
      caps.add('mobile_client');
    }
    return caps;
  }

  /// Returns current platform identifier string.
  String getPlatformName() {
    if (Platform.isWindows) return 'windows';
    if (Platform.isMacOS) return 'macos';
    if (Platform.isLinux) return 'linux';
    if (Platform.isAndroid) return 'android';
    if (Platform.isIOS) return 'ios';
    return 'flutter';
  }
}
