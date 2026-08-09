import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';

/// Contract for structured logging in StudyVault.
abstract interface class IAppLogger {
  void debug(String message, [Object? error, StackTrace? stackTrace]);
  void info(String message);
  void warning(String message, [Object? error]);
  void error(String message, [Object? error, StackTrace? stackTrace]);
}

/// Standard production implementation of [IAppLogger].
final class AppLogger implements IAppLogger {
  const AppLogger();

  @override
  void debug(String message, [Object? error, StackTrace? stackTrace]) {
    if (kDebugMode) {
      developer.log(
        '[DEBUG] $message',
        name: 'StudyVault',
        error: error,
        stackTrace: stackTrace,
        level: 500,
      );
    }
  }

  @override
  void info(String message) {
    developer.log(
      '[INFO] $message',
      name: 'StudyVault',
      level: 800,
    );
  }

  @override
  void warning(String message, [Object? error]) {
    developer.log(
      '[WARN] $message',
      name: 'StudyVault',
      error: error,
      level: 900,
    );
  }

  @override
  void error(String message, [Object? error, StackTrace? stackTrace]) {
    developer.log(
      '[ERROR] $message',
      name: 'StudyVault',
      error: error,
      stackTrace: stackTrace,
      level: 1000,
    );
  }
}
