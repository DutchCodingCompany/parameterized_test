import 'package:test/test.dart' as dart_test;

class GroupMeta {
  const GroupMeta({
    this.testOn,
    this.timeout,
    this.skip,
    this.tags,
    this.onPlatform,
    this.retry,
  });

  final String? testOn;
  final dart_test.Timeout? timeout;
  final dynamic skip;
  final dynamic tags;
  final Map<String, dynamic>? onPlatform;
  final int? retry;

  void groupTest(String description, dynamic Function() body) {
    dart_test.group(
      description,
      body,
      testOn: testOn,
      timeout: timeout,
      skip: skip,
      tags: tags,
      onPlatform: onPlatform,
      retry: retry,
    );
  }
}

class TestMeta {
  const TestMeta({
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

  void test(String description, dynamic Function() body) {
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
