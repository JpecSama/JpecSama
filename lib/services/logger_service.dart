import 'package:logger/logger.dart';

class LoggerService {
  static final Logger _logger = Logger();

  static void log(String message) {
    _logger.i(message);
  }

  static void debug(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.d(message, error: error, stackTrace: stackTrace);
  }

  static void error(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }
}
