import 'package:flutter/material.dart';

/// Numeric helper extensions for responsive gaps and byte formatting.
extension NumberSpacingExtensions on num {
  /// Vertical gap: `16.gapH` -> `SizedBox(height: 16)`
  Widget get gapH => SizedBox(height: toDouble());

  /// Horizontal gap: `16.gapW` -> `SizedBox(width: 16)`
  Widget get gapW => SizedBox(width: toDouble());

  /// Format raw bytes into human readable KB, MB, GB string.
  String toByteString({int decimals = 1}) {
    if (this <= 0) return '0 B';
    const List<String> suffixes = <String>['B', 'KB', 'MB', 'GB', 'TB'];
    num bytes = this;
    int i = 0;
    while (bytes >= 1024 && i < suffixes.length - 1) {
      bytes /= 1024;
      i++;
    }
    return '${bytes.toStringAsFixed(decimals)} ${suffixes[i]}';
  }
}
