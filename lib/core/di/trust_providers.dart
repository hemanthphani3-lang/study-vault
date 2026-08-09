import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../trust/trust_calculator.dart';
import '../trust/trust_engine.dart';
import '../trust/trust_manager.dart';
import '../trust/trust_policy.dart';
import '../trust/trust_storage.dart';

final Provider<TrustPolicy> trustPolicyProvider = Provider<TrustPolicy>((Ref ref) {
  return const TrustPolicy();
});

final Provider<TrustCalculator> trustCalculatorProvider = Provider<TrustCalculator>((Ref ref) {
  final policy = ref.watch(trustPolicyProvider);
  return TrustCalculator(policy: policy);
});

final Provider<TrustStorage> trustStorageProvider = Provider<TrustStorage>((Ref ref) {
  return TrustStorage();
});

final Provider<TrustEngine> trustEngineProvider = Provider<TrustEngine>((Ref ref) {
  final calculator = ref.watch(trustCalculatorProvider);
  final storage = ref.watch(trustStorageProvider);
  return TrustEngine(calculator: calculator, storage: storage);
});

final Provider<TrustManager> trustManagerProvider = Provider<TrustManager>((Ref ref) {
  final engine = ref.watch(trustEngineProvider);
  return TrustManager(engine: engine);
});
