import 'package:meta/meta.dart';
import 'package:parameterized_test/src/errors/parameterized_error.dart';
import 'package:parameterized_test/src/test_options/value_with_test_options.dart';
import 'package:test/test.dart';

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

typedef SetupFunc = void Function(dynamic Function());

ParameterizedTest get parameterizedTest => ParameterizedTest(
      group,
      test,
      setUp,
      tearDown,
    );

ParameterizedTest get parameterizedGroup => ParameterizedTest(
      group,
      group,
      setUp,
      tearDown,
    );

class ParameterizedTest {
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

        int i = 1;
        for (final v in values) {
          final testOptions = v is ValueWithTestOptions ? v.testOptions : null;
          final value = v is ValueWithTestOptions
              ? v.value
              : v is List
                  ? v
                  : [v];

          final testDescription = testOptions?.customDescriptionBuilder
                  ?.call(description, i, value) ??
              customDescriptionBuilder?.call(description, i, value) ??
              '[ ${value.map(
                    (e) => e is String ? "'$e'" : e.toString(),
                  ).join(
                    ', ',
                  )} ]';

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
                throw ParameterizedError.fromNoSuchMethodError(e, value, body);
              }
              //ignore: avoid_catching_errors
              on TypeError catch (e) {
                throw ParameterizedError.fromTypeError(e, value, body);
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
}
