sealed class LoadException implements Exception {
  const LoadException();
}

final class NetworkLoadException extends LoadException {
  const NetworkLoadException();
}

final class TimeoutLoadException extends LoadException {
  const TimeoutLoadException();
}

final class NotFoundLoadException extends LoadException {
  const NotFoundLoadException();
}

final class ServerLoadException extends LoadException {
  const ServerLoadException({required this.statusCode});

  final int statusCode;
}

final class UnexpectedLoadException extends LoadException {
  const UnexpectedLoadException();
}
