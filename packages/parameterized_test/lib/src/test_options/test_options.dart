import 'package:test/test.dart' as dart_test;

class TestOptions {
  const TestOptions({
    this.timeout,
    this.skip,
    this.tags,
    this.onPlatform,
    this.retry,
  });

  final dart_test.Timeout? timeout;
  final skip;
  final tags;
  final Map<String, dynamic>? onPlatform;
  final int? retry;

  void test(Object description, dynamic Function() body) {
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
