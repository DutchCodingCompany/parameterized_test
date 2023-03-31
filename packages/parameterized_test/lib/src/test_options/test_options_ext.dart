//ignore_for_file: long-parameter-list
import 'package:test/test.dart' as dart_test;

import 'test_options.dart';
import 'value_with_test_options.dart';

extension IterableTestParametersEx<T extends Iterable<dynamic>> on T {
  ValueWithTestOptions withTestOptions({
    dart_test.Timeout? timeout,
    dynamic skip,
    dynamic tags,
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
    dynamic skip,
    dynamic tags,
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
