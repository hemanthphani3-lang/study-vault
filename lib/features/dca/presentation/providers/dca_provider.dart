import 'dart:typed_data';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/dca/dca_interface.dart';
import '../../../../core/dca/dca_models.dart';
import '../../../../core/di/dca_providers.dart';

class DcaStateContainer {
  const DcaStateContainer({
    this.records = const <ContentRecord>[],
    this.metrics,
    this.lastValidation,
    this.isLoading = false,
    this.errorMessage,
  });

  final List<ContentRecord> records;
  final StorageMetrics? metrics;
  final CidValidationResult? lastValidation;
  final bool isLoading;
  final String? errorMessage;

  DcaStateContainer copyWith({
    List<ContentRecord>? records,
    StorageMetrics? metrics,
    CidValidationResult? lastValidation,
    bool? isLoading,
    String? errorMessage,
  }) {
    return DcaStateContainer(
      records: records ?? this.records,
      metrics: metrics ?? this.metrics,
      lastValidation: lastValidation ?? this.lastValidation,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class DcaNotifier extends Notifier<DcaStateContainer> {
  @override
  DcaStateContainer build() {
    return const DcaStateContainer();
  }

  DcaInterface get _dca => ref.read(dcaAdapterProvider);

  Future<ContentRecord> addContent({required Uint8List bytes, required String metadataId}) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final record = await _dca.storeContent(bytes, metadataId: metadataId);
      final metrics = await _dca.getStorageMetrics();
      final pins = await _dca.listPins();

      state = state.copyWith(
        records: pins,
        metrics: metrics,
        isLoading: false,
      );
      return record;
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: 'DCA Store Failed: $e');
      rethrow;
    }
  }

  Future<CidValidationResult> verifyCid(String cid, Uint8List bytes) async {
    final result = await _dca.verifyCid(cid, bytes);
    state = state.copyWith(lastValidation: result);
    return result;
  }

  Future<void> togglePin(String cid, bool pin) async {
    if (pin) {
      await _dca.pinContent(cid);
    } else {
      await _dca.unpinContent(cid);
    }
    final pins = await _dca.listPins();
    final metrics = await _dca.getStorageMetrics();
    state = state.copyWith(records: pins, metrics: metrics);
  }

  Future<void> refreshMetrics() async {
    final metrics = await _dca.getStorageMetrics();
    final pins = await _dca.listPins();
    state = state.copyWith(metrics: metrics, records: pins);
  }
}

final NotifierProvider<DcaNotifier, DcaStateContainer> dcaProvider =
    NotifierProvider<DcaNotifier, DcaStateContainer>(DcaNotifier.new);
