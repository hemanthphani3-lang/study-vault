/// Functional Result type for Clean Architecture domain & repository methods.
sealed class Result<S, E> {
  const Result();

  /// Creates a success result containing [value].
  const factory Result.success(S value) = Success<S, E>;

  /// Creates a failure result containing [error].
  const factory Result.failure(E error) = Failure<S, E>;

  /// Returns true if this is a [Success].
  bool get isSuccess => this is Success<S, E>;

  /// Returns true if this is a [Failure].
  bool get isFailure => this is Failure<S, E>;

  /// Pattern matching fold method.
  R fold<R>(R Function(S success) onSuccess, R Function(E failure) onFailure) {
    return switch (this) {
      Success<S, E>(value: final S val) => onSuccess(val),
      Failure<S, E>(error: final E err) => onFailure(err),
    };
  }
}

final class Success<S, E> extends Result<S, E> {
  const Success(this.value);
  final S value;
}

final class Failure<S, E> extends Result<S, E> {
  const Failure(this.error);
  final E error;
}

/// Generic base domain failure.
abstract class AppFailure {
  const AppFailure(this.message, [this.cause]);
  final String message;
  final Object? cause;

  @override
  String toString() => 'AppFailure: $message';
}

final class NetworkFailure extends AppFailure {
  const NetworkFailure(super.message, [super.cause]);
}

final class DatabaseFailure extends AppFailure {
  const DatabaseFailure(super.message, [super.cause]);
}

final class NotFoundFailure extends AppFailure {
  const NotFoundFailure(super.message, [super.cause]);
}
