import 'package:parameterized_test/src/test_options/value_with_test_options.dart';
import 'package:test/test.dart' as dart_test;

class TestOptions {
  const TestOptions({
    this.customDescriptionBuilder,
    this.testOn,
    this.timeout,
    this.skip,
    this.tags,
    this.onPlatform,
    this.retry,
  });

  final CustomDescriptionBuilder? customDescriptionBuilder;
  final String? testOn;
  final dart_test.Timeout? timeout;
  final dynamic skip;
  final dynamic tags;
  final Map<String, dynamic>? onPlatform;
  final int? retry;

  dynamic test(Object description, dynamic Function() body) async {
    dart_test.test(
      description,
      body,
      timeout: timeout,
      skip: skip,
      tags: tags,
      onPlatform: onPlatform,
      retry: retry,
    );
  }
}
