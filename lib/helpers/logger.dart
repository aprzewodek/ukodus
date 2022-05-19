import 'dart:developer' as dev;

class Logger {
  static final Logger _instance = Logger._internal();

  factory Logger() {
    return _instance;
  }

  Logger._internal() {
    // initialization logic
  }

  void log({
    Object? exception,
    StackTrace? stackTrace,
    String? message,
  }) {
    dev.log(
      message ?? '',
      time: DateTime.now(),
      error: exception,
      stackTrace: stackTrace,
    );
  }
}
