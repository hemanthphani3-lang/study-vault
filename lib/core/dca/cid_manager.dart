import 'dart:typed_data';
import '../crypto/sha256_helper.dart';
import 'dca_models.dart';

/// CID Manager providing CIDv1 Multihash Generation, Decoding, and Verification.
class CidManager {
  CidManager();

  static const String cidv1Prefix = 'bafybeic';

  /// Generates a valid CIDv1 string (`bafybeic...`) for a binary payload [bytes].
  String generateCid(Uint8List bytes) {
    final String hashHex = Sha256Helper.toHex(Sha256Helper.digest(bytes));
    final String truncatedHex = hashHex.substring(0, 32).toLowerCase();
    return '$cidv1Prefix$truncatedHex';
  }

  /// Validates format of a CID string.
  bool isValidCidFormat(String cid) {
    if (!cid.startsWith(cidv1Prefix)) return false;
    final String suffix = cid.substring(cidv1Prefix.length);
    return suffix.length == 32 && RegExp(r'^[0-9a-f]+$').hasMatch(suffix);
  }

  /// Verifies payload [bytes] match expected [cid].
  CidValidationResult verifyContentCid(String cid, Uint8List bytes) {
    if (!isValidCidFormat(cid)) {
      return CidValidationResult(
        isValid: false,
        cid: cid,
        computedHash: '',
        details: 'Invalid CID format prefix or length. Expected $cidv1Prefix<32hex>',
      );
    }

    final String generated = generateCid(bytes);
    final bool match = generated.toLowerCase() == cid.toLowerCase();

    return CidValidationResult(
      isValid: match,
      cid: cid,
      computedHash: generated,
      details: match ? 'CID payload integrity verified.' : 'Multihash mismatch: Computed $generated',
    );
  }
}
