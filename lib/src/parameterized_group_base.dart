import 'package:meta/meta.dart';
import 'package:test/test.dart';

import '../parameterized_test.dart';
import 'test_options/group_test_options.dart';
import 'value_source.dart';

/// Create a new parameterizedGroup with given [description], [values] and [body]
///
/// [parameterizedGroup] also have the same options as group tests have. These options will be passed to the group function.
///
/// For example:
/// ```dart
/// parameterizedGroup(
///   'Amount of letters',
///   [
///     ['kiwi', 4],
///     ['apple', 5],
///     ['banana', 6].withTestOptions(skip: 'skip this'),
///   ],
///   p2((String word, int length) {
///     test('test word length',() {
///       expect(word.length, length);
///       });
///   }),
/// );
/// ```
@isTestGroup
void parameterizedGroup(
  /// Group description.
  Object description,

  /// List of group values. For each values in the list a group test will be executed.
  Iterable<dynamic> values,

  /// The test body which is executed for each group value.
  /// See [TestParameters] for more info on different bodies.
  TestParameters body, {
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
    null,
  ).executeGroup(body);
}
