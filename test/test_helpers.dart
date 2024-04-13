import 'package:parameterized_test/src/test_options/test_options.dart';
import 'package:test/test.dart';

class MockTestOptions extends TestOptions {
  MockTestOptions({this.descriptionCallback}) : super();

  final dynamic Function(Object)? descriptionCallback;
}

class TestHelper {
  TestHelper();

  final List<TestCapture> testCaptures = [];
  final List<dynamic Function()> setupCaptures = [];

  void test(
    Object? description,
    dynamic Function() body, {
    String? testOn,
    Timeout? timeout,
    Object? skip,
    Object? tags,
    Map<String, dynamic>? onPlatform,
    int? retry,
  }) {
    testCaptures.add(
      TestCapture(
        description: description,
        body: body,
        testOn: testOn,
        timeout: timeout,
        skip: skip,
        tags: tags,
        onPlatform: onPlatform,
        retry: retry,
      ),
    );
    body();
  }

  void setUp(dynamic Function() body) {
    setupCaptures.add(body);
    body();
  }
}

class TestCapture {
  TestCapture({
    this.description,
    this.body,
    this.testOn,
    this.timeout,
    this.skip,
    this.tags,
    this.onPlatform,
    this.retry,
  });

  final Object? description;
  final dynamic Function()? body;

  final String? testOn;
  final Timeout? timeout;
  final Object? skip;
  final Object? tags;
  final Map<String, dynamic>? onPlatform;
  final int? retry;
}
