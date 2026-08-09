/// String manipulation extensions for academic metadata and UI display.
extension StringFormattingExtensions on String {
  /// Capitalizes first letter of string.
  String toCapitalized() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  /// Truncates string to [maxLength] with an ellipsis.
  String truncate(int maxLength) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength)}...';
  }

  /// Extracts acronym / initials from multi-word title.
  String toInitials({int maxChars = 2}) {
    if (trim().isEmpty) return '';
    final List<String> parts = trim().split(RegExp(r'\s+'));
    final StringBuffer buffer = StringBuffer();
    for (int i = 0; i < parts.length && i < maxChars; i++) {
      if (parts[i].isNotEmpty) {
        buffer.write(parts[i][0].toUpperCase());
      }
    }
    return buffer.toString();
  }
}
