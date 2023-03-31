import 'package:meta/meta.dart';
import 'package:test/test.dart';

import 'test_options/group_test_options.dart';
import 'test_parameters.dart';
import 'value_source.dart';

/// Create a group of parameterized tests.
///
/// The group will iterate over the supplied [testOptions].
/// The [testOptions] are supplied through a [ParameterizedSource].
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
///     (Iterable<dynamic> values) {
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
//ignore: long-parameter-list
void parameterizedTest(
  Object description,
  Iterable<dynamic> values,
  TestParameters body, {
  void Function()? setUp,
  String? testOn,
  Timeout? timeout,
  dynamic skip,
  dynamic tags,
  Map<String, dynamic>? onPlatform,
  int? retry,
}) {
  ValueSource(
    values,
    GroupTestOptions(
      description: description,
      setUp: setUp,
      testOn: testOn,
      timeout: timeout,
      skip: skip,
      tags: tags,
      onPlatform: onPlatform,
      retry: retry,
    ),
  ).executeTests(body);
}
