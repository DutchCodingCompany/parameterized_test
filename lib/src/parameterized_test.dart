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
ParameterizedTest get parameterizedTest => ParameterizedTest(
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
ParameterizedTest get parameterizedGroup => ParameterizedTest(
      group,
      group,
      setUp,
      tearDown,
    );

/// {@template ParameterizedTest}
/// Implementation of parameterized test.
/// {@endtemplate}
class ParameterizedTest {
  /// {@macro ParameterizedTest}
  ParameterizedTest(
    this._group,
    this._test,
    this._setup,
    this._tearDown,
  );

  final TestFunc _group;
  final TestFunc _test;
  final SetupFunc _setup;
  final SetupFunc _tearDown;

  @isTestGroup
  /// {@macro parameterizedTest}
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

        var i = 1;
        for (final v in values) {
          final testOptions = v is ValueWithTestOptions ? v.testOptions : null;
          final value = v is ValueWithTestOptions
              ? v.value
              : v is List
                  ? v
                  : [v];

          final testDescription = makeDescription(
            description,
            i,
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
                throw ParameterizedError.fromTypeError(value, body);
              }
            },
            testOn: testOptions?.testOn ?? testOn,
            timeout: testOptions?.timeout ?? timeout,
            skip: testOptions?.skip ?? skip,
            tags: testOptions?.tags ?? tags,
            onPlatform: testOptions?.onPlatform ?? onPlatform,
            retry: testOptions?.retry ?? retry,
          );
          i++;
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
    int i,
    List<dynamic> value,
    CustomDescriptionBuilder? customDescriptionBuilder,
  ) {
    final mappedValues = value.map(
      (e) => e is String ? "'$e'" : e.toString(),
    );

    return customDescriptionBuilder?.call(description, i, value) ??
        '[ ${mappedValues.join(', ')} ]';
  }
}
