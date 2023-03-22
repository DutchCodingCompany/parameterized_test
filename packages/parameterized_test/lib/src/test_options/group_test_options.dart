import 'package:test/test.dart' as dart_test;

class GroupTestOptions {
  const GroupTestOptions({
    required this.description,
    this.setUp,
    this.testOn,
    this.timeout,
    this.skip,
    this.tags,
    this.onPlatform,
    this.retry,
  });

  final Object description;
  final void Function()? setUp;
  final String? testOn;
  final dart_test.Timeout? timeout;
  final dynamic skip;
  final dynamic tags;
  final Map<String, dynamic>? onPlatform;
  final int? retry;

  void groupTest(dynamic Function() body) {
    dart_test.group(
      description,
      () {
        if (setUp != null) {
          dart_test.setUp(() => setUp!());
        }
        body();
      },
      testOn: testOn,
      timeout: timeout,
      skip: skip,
      tags: tags,
      onPlatform: onPlatform,
      retry: retry,
    );
  }
}
