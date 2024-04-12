import 'package:parameterized_test/src/test_options/value_with_test_options.dart';
import 'package:test/test.dart';

/// {@template TestOptions}
/// Wrapper class for test options.
/// {@endtemplate}
class TestOptions {
  /// {@macro TestOptions}
  const TestOptions({
    this.customDescriptionBuilder,
    this.testOn,
    this.timeout,
    this.skip,
    this.tags,
    this.onPlatform,
    this.retry,
  });

  /// {@macro CustomDescriptionBuilder}
  final CustomDescriptionBuilder? customDescriptionBuilder;

  /// See [test]
  final String? testOn;

  /// See [test]
  final Timeout? timeout;

  /// See [test]
  final dynamic skip;

  /// See [test]
  final dynamic tags;

  /// See [test]
  final Map<String, dynamic>? onPlatform;

  /// See [test]
  final int? retry;
}
