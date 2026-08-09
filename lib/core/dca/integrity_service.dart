import 'dca_interface.dart';
import 'dca_models.dart';

/// Integrity Service auditing DCA records for corruption or missing pins.
class IntegrityService {
  IntegrityService({required DcaInterface dcaInterface}) : _dca = dcaInterface;

  final DcaInterface _dca;

  /// Audits all content records and verifies CID multihashes.
  Future<List<CidValidationResult>> auditAllContent() async {
    final List<CidValidationResult> results = <CidValidationResult>[];
    final pins = await _dca.listPins();

    for (final record in pins) {
      final payload = await _dca.retrieveContent(record.cid);
      if (payload == null) {
        results.add(CidValidationResult(
          isValid: false,
          cid: record.cid,
          computedHash: '',
          details: 'Missing payload for pinned CID record.',
        ));
      } else {
        final valResult = await _dca.verifyCid(record.cid, payload);
        results.add(valResult);
      }
    }
    return results;
  }
}
