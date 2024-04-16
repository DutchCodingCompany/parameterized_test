import 'package:meta/meta.dart';
import 'package:parameterized_test/src/errors/parameterized_error.dart';
import 'package:parameterized_test/src/test_options/value_with_test_options.dart';
import 'package:test/test.dart';

/// Callback signature for test and group functions.
typedef TestFunc = void Function(
  Object? description,
  dynamic Function() body, {
  String? testOn,
  Timeout? timeout,
  Object? skip,
  Object? tags,
  Map<String, dynamic>? onPlatform,
  int? retry,
});

/// Callback signature for setUp and tearDown functions.
typedef SetupFunc = void Function(dynamic Function());

/// {@template parameterizedTest}
// ignore: comment_references
/// Create a new parameterizedTest with given [description], [values] and [body]
///
/// [parameterizedTest] also have the same options as group tests have.
/// These options will be passed to the group function.
///
/// For example:
/// ```dart
/// parameterizedTest(
///   'Amount of letters',
///   [
///     ['kiwi', 4],
///     ['apple', 5],
///     ['banana', 6].options(skip: 'skip this'),
///   ],
///   (String word, int length) {
///     expect(word.length, length);
///   },
/// );
/// ```
/// {@endtemplate}
@isTestGroup
ParameterizedTest get parameterizedTest => const ParameterizedTestImpl(
      group,
      test,
      setUp,
      tearDown,
    );

/// {@template parameterizedGroup}
// ignore: comment_references
/// Create a new parameterizedGroup with given [description], [values]
// ignore: comment_references
/// and [body]
///
/// [parameterizedGroup] also have the same options as group tests have.
/// These options will be passed to the group function.
///
/// For example:
/// ```dart
/// parameterizedGroup(
///   'Amount of letters',
///   [
///     ['kiwi', 4],
///     ['apple', 5],
///     ['banana', 6].options(skip: 'skip this'),
///   ],
///   (String word, int length) {
///     test('test word length',() {
///       expect(word.length, length);
///       });
///   },
/// );
/// ```
/// {@endtemplate}
@isTestGroup
ParameterizedTest get parameterizedGroup => const ParameterizedTestImpl(
      group,
      group,
      setUp,
      tearDown,
    );

/// {@template ParameterizedTest}
/// Implementation of parameterized test.
/// {@endtemplate}
// ignore: one_member_abstracts
abstract interface class ParameterizedTest {
  /// {@macro parameterizedTest}
  @isTestGroup
  void call(
    Object? description,
    List<dynamic> values,
    Function body, {
    CustomDescriptionBuilder? customDescriptionBuilder,
    dynamic Function()? setUp,
    dynamic Function()? tearDown,
    String? testOn,
    Timeout? timeout,
    Object? skip,
    Object? tags,
    Map<String, dynamic>? onPlatform,
    int? retry,
  });
}

/// {@macro ParameterizedTest}
class ParameterizedTestImpl implements ParameterizedTest {
  /// {@macro ParameterizedTest}
  const ParameterizedTestImpl(
    this._group,
    this._test,
    this._setup,
    this._tearDown,
  );

  final TestFunc _group;
  final TestFunc _test;
  final SetupFunc _setup;
  final SetupFunc _tearDown;

  @override
  @isTestGroup
  void call(
    Object? description,
    List<dynamic> values,
    Function body, {
    CustomDescriptionBuilder? customDescriptionBuilder,
    dynamic Function()? setUp,
    dynamic Function()? tearDown,
    String? testOn,
    Timeout? timeout,
    Object? skip,
    Object? tags,
    Map<String, dynamic>? onPlatform,
    int? retry,
  }) {
    _group(
      description,
      () {
        if (setUp != null) {
          _setup(setUp);
        }

        var index = 1;
        for (final v in values) {
          final (:testOptions, values: value) = parseValues(v);

          final testDescription = makeDescription(
            description,
            index,
            value,
            testOptions?.customDescriptionBuilder ?? customDescriptionBuilder,
          );

          _test(
            testDescription,
            () {
              try {
                return Function.apply(
                  body,
                  value,
                );
              }
              //ignore: avoid_catching_errors
              on NoSuchMethodError catch (e) {
                throw ParameterizedError.fromNoSuchMethodError(e, value);
              }
              //ignore: avoid_catching_errors
              on TypeError {
                throw ParameterizedError.forTypeError(value, body);
              }
            },
            testOn: testOptions?.testOn,
            timeout: testOptions?.timeout,
            skip: testOptions?.skip,
            tags: testOptions?.tags,
            onPlatform: testOptions?.onPlatform,
            retry: testOptions?.retry,
          );
          index++;
        }
        if (tearDown != null) {
          _tearDown(tearDown);
        }
      },
      testOn: testOn,
      timeout: timeout,
      skip: skip,
      tags: tags,
      onPlatform: onPlatform,
      retry: retry,
    );
  }

  /// Make a description for each test.
  Object? makeDescription(
    Object? description,
    int index,
    List<dynamic> value,
    CustomDescriptionBuilder? customDescriptionBuilder,
  ) {
    final mappedValues = value.map(
      (e) => e is String ? "'$e'" : e.toString(),
    );

    return customDescriptionBuilder?.call(description, index, value) ??
        '[ ${mappedValues.join(', ')} ]';
  }

  /// Unpack wrapped values and test options.
  /// Handle different types of values.
  ValueWithTestOptions parseValues(dynamic value) => switch (value) {
        ValueWithTestOptions() => value,
        List() => (values: value, testOptions: null),
        Iterable() => (values: value.toList(), testOptions: null),
        _ => (values: [value], testOptions: null),
      };
}
