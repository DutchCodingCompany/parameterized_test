import 'package:meta/meta.dart';
import 'package:parameterized_test/src/parameterized_source.dart';
import 'package:flutter_test/flutter_test.dart';

/// Create a group of parameterized tests.
///
/// The group will iterate over the supplied [parameters].
/// The [parameters] are supplied through a [ParameterizedSource].
/// Each test will be executed with the next parameter which will receive the parameter in the [body].
///
/// parameterized test also have the same options as group tests have. These options will be passed to the group function.
///
/// For example:
/// ```dart
/// parameterizedTest(
///     'Amount of letters',
///     ParameterizedSource.csv([
///       'kiwi, 4',
///       'apple, 5',
///       'banana, 6',
///     ]),
///     (List<dynamic> values) {
///       final String input = values[0];
///       final expected = values[1];
///
///       final actual = input.length;
///
///       expect(actual, expected);
///     },
///   );
/// ```
@isTestGroup
void parameterizedTest(Object description,
    ParameterizedSource parameters,
    void Function(List<dynamic> values) body, {
      String? testOn,
      Timeout? timeout,
      dynamic skip,
      dynamic tags,
      Map<String, dynamic>? onPlatform,
      int? retry,
    }) {
  group(description, () {
    for (final parameter in parameters.params) {
      test(
        parameter,
            () => body(parameter),
        testOn: testOn,
        timeout: timeout,
        skip: skip,
        tags: tags,
        onPlatform: onPlatform,
        retry: retry,
      );
    }
  });
}
