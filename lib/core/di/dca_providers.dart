import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dca/cid_manager.dart';
import '../dca/dca_interface.dart';
import '../dca/integrity_service.dart';
import '../dca/ipfs_adapter.dart';
import '../dca/local_content_registry.dart';
import '../dca/pin_manager.dart';
import '../dca/storage_manager.dart';

final Provider<CidManager> cidManagerProvider = Provider<CidManager>((Ref ref) {
  return CidManager();
});

final Provider<LocalContentRegistry> localContentRegistryProvider = Provider<LocalContentRegistry>((Ref ref) {
  return LocalContentRegistry();
});

final Provider<PinManager> pinManagerProvider = Provider<PinManager>((Ref ref) {
  final registry = ref.watch(localContentRegistryProvider);
  return PinManager(registry: registry);
});

final Provider<DcaInterface> dcaAdapterProvider = Provider<DcaInterface>((Ref ref) {
  final cidManager = ref.watch(cidManagerProvider);
  final pinManager = ref.watch(pinManagerProvider);
  final registry = ref.watch(localContentRegistryProvider);

  return IpfsAdapter(
    cidManager: cidManager,
    pinManager: pinManager,
    registry: registry,
  );
});

final Provider<IntegrityService> integrityServiceProvider = Provider<IntegrityService>((Ref ref) {
  final dca = ref.watch(dcaAdapterProvider);
  return IntegrityService(dcaInterface: dca);
});

final Provider<StorageManager> storageManagerProvider = Provider<StorageManager>((Ref ref) {
  final dca = ref.watch(dcaAdapterProvider);
  return StorageManager(dcaInterface: dca);
});
