import 'package:meta/meta.dart';
import 'package:test/test.dart';

import 'test_options/group_test_options.dart';
import 'test_options/value_with_test_options.dart';
import 'test_parameters.dart';
import 'value_source.dart';

/// Create a new parameterizedTest with given [description], [values] and [body]
///
/// [parameterizedTest] also have the same options as group tests have. These options will be passed to the group function.
///
/// For example:
/// ```dart
/// parameterizedTest(
///   'Amount of letters',
///   [
///     ['kiwi', 4],
///     ['apple', 5],
///     ['banana', 6].withTestOptions(skip: 'skip this'),
///   ],
///   p2((String word, int length) {
///     expect(word.length, length);
///   }),
/// );
/// ```
@isTestGroup
void parameterizedTest(
  /// Test description.
  Object description,

  /// List of test values. For each values in the list a test will be executed.
  Iterable<dynamic> values,

  /// The test body which is executed for each test value.
  /// See [TestParameters] for more info on different bodies.
  TestParameters body, {
    /// Provide a custom description builder which will build the description for all the test values test executed.
  CustomDescriptionBuilder? customDescriptionBuilder,
  dynamic Function()? setUp,

  /// Provide a tearDown function to the `group` test.
  dynamic Function()? tearDown,
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
      tearDown: tearDown,
      testOn: testOn,
      timeout: timeout,
      skip: skip,
      tags: tags,
      onPlatform: onPlatform,
      retry: retry,
    ),
    customDescriptionBuilder,
  ).executeTests(body);
}
