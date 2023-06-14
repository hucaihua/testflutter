import 'package:logger/logger.dart';

/// @Author : Alex Hu
/// @Contact: hucaihua.lzu@gmail.com
/// @Date: on 2023-06-05 15:02

class Log {
  static final Logger _logger = Logger(
    printer: PrefixPrinter(PrettyPrinter(methodCount: 2 , stackTraceBeginIndex: 0)),
  );

  static void v(dynamic message) {
    _logger.v(message);
  }

  static void d(dynamic message) {
    _logger.d(message);
  }

  static void i(dynamic message) {
    _logger.i(message);
  }

  static void w(dynamic message) {
    _logger.w(message);
  }

  static void e(dynamic message) {
    _logger.e(message);
  }

  static void wtf(dynamic message) {
    _logger.wtf(message);
  }
}
