import 'package:intl/intl.dart';

/// Formatting helpers for byte sizes, peer counts, and dates.
abstract final class Formatters {
  /// Converts bytes to a human-readable string (e.g., "14.2 MB").
  static String formatBytes(int bytes, {int decimals = 1}) {
    if (bytes <= 0) return '0 B';
    const List<String> suffixes = <String>['B', 'KB', 'MB', 'GB', 'TB'];
    num value = bytes;
    int i = 0;
    while (value >= 1024 && i < suffixes.length - 1) {
      value /= 1024;
      i++;
    }
    return '${value.toStringAsFixed(decimals)} ${suffixes[i]}';
  }

  /// Formats peer counts with compact suffix (e.g. 1.2k peers).
  static String formatPeerCount(int count) {
    if (count < 1000) return '$count';
    return '${(count / 1000).toStringAsFixed(1)}k';
  }

  /// Formats year or timestamp into academic citation year.
  static String formatYear(int year) {
    return '$year';
  }

  /// Compact date formatter.
  static String formatDate(DateTime date) {
    return DateFormat.yMMMd().format(date);
  }
}
