//ignore_for_file: long-parameter-list
import 'package:test/test.dart' as dart_test;

import 'test_options.dart';
import 'value_with_test_options.dart';

extension ListTestParametersEx<T extends List<dynamic>> on T {
  /// Applied extra test options for a specified test value.
  /// For example:
  /// ```dart
  /// [
  ///   ['kiwi',4],
  ///   ['apple',5].options(skip: true),
  /// ]
  /// ```
  ValueWithTestOptions options({
    CustomDescriptionBuilder? customDescriptionBuilder,
    String? testOn,
    dart_test.Timeout? timeout,
    dynamic skip,
    dynamic tags,
    Map<String, dynamic>? onPlatform,
    int? retry,
  }) =>
      ValueWithTestOptions(
        this,
        TestOptions(
          customDescriptionBuilder: customDescriptionBuilder,
          testOn: testOn,
          timeout: timeout,
          skip: skip,
          tags: tags,
          onPlatform: onPlatform,
          retry: retry,
        ),
      );
}

extension TestParametersEx<T extends Object> on T {
  /// Applied extra test options for a specified test value.
  /// For example:
  /// ```dart
  /// [
  ///   4,
  ///   5.options(skip: true),
  /// ]
  /// ```
  ValueWithTestOptions options({
    CustomDescriptionBuilder? customDescriptionBuilder,
    String? testOn,
    dart_test.Timeout? timeout,
    dynamic skip,
    dynamic tags,
    Map<String, dynamic>? onPlatform,
    int? retry,
  }) =>
      ValueWithTestOptions(
        [this],
        TestOptions(
          customDescriptionBuilder: customDescriptionBuilder,
          testOn: testOn,
          timeout: timeout,
          skip: skip,
          tags: tags,
          onPlatform: onPlatform,
          retry: retry,
        ),
      );
}
