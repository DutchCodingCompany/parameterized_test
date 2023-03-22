import 'package:test/test.dart' as dart_test;

import 'test_options.dart';
import 'value_with_test_options.dart';

extension IterableTestParametersEx<T extends Iterable> on T {
  ValueWithTestOptions withTestOptions({
    dart_test.Timeout? timeout,
    skip,
    tags,
    Map<String, dynamic>? onPlatform,
    int? retry,
  }) =>
      ValueWithTestOptions(
        this,
        TestOptions(
          timeout: timeout,
          skip: skip,
          tags: tags,
          onPlatform: onPlatform,
          retry: retry,
        ),
      );
}

extension TestParametersEx<T extends Object> on T {
  ValueWithTestOptions withTestOptions({
    dart_test.Timeout? timeout,
    skip,
    tags,
    Map<String, dynamic>? onPlatform,
    int? retry,
  }) =>
      ValueWithTestOptions(
        [this],
        TestOptions(
          timeout: timeout,
          skip: skip,
          tags: tags,
          onPlatform: onPlatform,
          retry: retry,
        ),
      );
}
