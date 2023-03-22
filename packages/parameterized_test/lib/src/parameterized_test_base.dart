import 'package:meta/meta.dart';
import 'package:test/test.dart';

import 'test_options/group_test_options.dart';
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
void parameterizedTest<T>(
  Object description,
  Iterable values,
  dynamic Function(T value) body, {
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

@isTestGroup
void parameterizedTest2<A1, A2>(
  Object description,
  Iterable<Iterable> values,
  dynamic Function(A1 a1, A2 a2) body, {
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
  ).executeTests2(body);
}

@isTestGroup
void parameterizedTest3<T, A1, A2, A3>(
  Object description,
  Iterable<Iterable<T>> values,
  dynamic Function(A1 a1, A2 a2, A3 a3) body, {
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
  ).executeTests3(body);
}

@isTestGroup
void parameterizedTest4<T, A1, A2, A3, A4>(
  Object description,
  Iterable<Iterable<T>> values,
  dynamic Function(A1 a1, A2 a2, A3 a3, A4 a4) body, {
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
  ).executeTests4(body);
}

@isTestGroup
void parameterizedTest5<T, A1, A2, A3, A4, A5>(
  Object description,
  Iterable<Iterable<T>> values,
  dynamic Function(A1 a1, A2 a2, A3 a3, A4 a4, A5 a5) body, {
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
  ).executeTests5(body);
}

@isTestGroup
void parameterizedTest6<T, A1, A2, A3, A4, A5, A6>(
  Object description,
  Iterable<Iterable<T>> values,
  dynamic Function(A1 a1, A2 a2, A3 a3, A4 a4, A5 a5, A6 a6) body, {
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
  ).executeTests6(body);
}
