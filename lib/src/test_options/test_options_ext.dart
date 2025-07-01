import 'package:parameterized_test/src/test_options/test_options.dart';
import 'package:parameterized_test/src/test_options/value_with_test_options.dart';
import 'package:test/test.dart' as dart_test;

/// Extension on [List] to apply extra test options for a specified
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
  }) => (
    values: this,
    testOptions: TestOptions(
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

/// Extension on [Object] to apply extra test options for a specified
/// test value.
extension TestParametersEx on Object {
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
  }) => (
    values: [this],
    testOptions: TestOptions(
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
