import 'package:parameterized_test/parameterized_test.dart';
import 'package:parameterized_test/src/errors/parameter_count_error.dart';
import 'package:parameterized_test/src/test_options/test_options.dart';
import 'package:parameterized_test/src/test_options/value_with_test_options.dart';
import 'package:parameterized_test/src/util/test_value_helpers.dart';
import 'package:test/test.dart';

import '../test_helpers.dart';

void main() {
  group('mapTests tests values length == 1', () {
    test('mapTests length 1 Iterable lenght equals 1', () {
      final testValues = [
        MockValueWithTestOptions([1]),
      ];

      late Iterable<dynamic> result;

      mapTests(testValues, 1, (value) {
        result = value;
      });

      expect(result, [1]);
    });

    test('mapTests length 1 throws [ParameterCountError] Iterable lenght not equals 1', () {
      final testValues = [
        MockValueWithTestOptions([1, 2]),
      ];

      Iterable<dynamic>? result;

      void callback() {
        mapTests(testValues, 1, (value) {
          result = value;
        });
      }

      expect(
        callback,
        throwsA(
          isA<ParameterCountError>()
              .having((error) => error.actual, 'actual', 2)
              .having((error) => error.expected, 'expected', 1),
        ),
      );
      expect(result, null);
    });

    test('excutes test with testoptions', () {
      List<Object> result = [];
      List<bool> executed = [];

      final testValues = [
        MockValueWithTestOptions([1], testOptions: MockTestOptions(descriptionCallback: (description) {
          result.add(description);
        })),
        MockValueWithTestOptions([2], testOptions: MockTestOptions(descriptionCallback: (description) {
          result.add(description);
        })),
      ];

      mapTests(testValues, 1, (value) {
        executed.add(true);
      });

      expect(result, ['(1)', '(2)']);
      expect(executed, [true, true]);
    });
  });

  group('mapTests tests values length >1', () {
    test('mapTests length 2 Iterable lenght equals 2', () {
      final testValues = [
        MockValueWithTestOptions([1, 2]),
      ];

      late Iterable<dynamic> result;

      mapTests(testValues, 2, (value) {
        result = value;
      });

      expect(result, [1, 2]);
    });

    test('mapTests length 2 throws [ParameterCountError] Iterable lenght not equals 2', () {
      final testValues = [
        MockValueWithTestOptions([1, 2, 3]),
      ];

      Iterable<dynamic>? result;

      void callback() {
        mapTests(testValues, 2, (value) {
          result = value;
        });
      }

      expect(
        callback,
        throwsA(
          isA<ParameterCountError>()
              .having((error) => error.actual, 'actual', 3)
              .having((error) => error.expected, 'expected', 2),
        ),
      );
      expect(result, null);
    });

    test('excutes test with testoptions', () {
      List<Object> result = [];
      List<bool> executed = [];

      final testValues = [
        MockValueWithTestOptions([1, 2], testOptions: MockTestOptions(descriptionCallback: (description) {
          result.add(description);
        })),
        MockValueWithTestOptions([3, 4], testOptions: MockTestOptions(descriptionCallback: (description) {
          result.add(description);
        })),
      ];

      mapTests(testValues, 2, (value) {
        executed.add(true);
      });

      expect(result, ['(1, 2)', '(3, 4)']);
      expect(executed, [true, true]);
    });
  });

  group('wrap test values tests', () {
    test('wraps non nested list with ValueWithTestOptions', () {
      final testList = [
        1,
        2,
      ];

      final result = wrap(testList, TestOptions());

      expect(
        result.elementAt(0),
        TypeMatcher<ValueWithTestOptions>()
            .having((value) => value.value, 'value', [1])
            .having((value) => value.testOptions.skip, 'skip', null)
            .having((value) => value.testOptions.timeout, 'timeout', null)
            .having((value) => value.testOptions.retry, 'retry', null)
            .having((value) => value.testOptions.tags, 'tags', null)
            .having((value) => value.testOptions.onPlatform, 'onPlatform', null),
      );
      expect(
        result.elementAt(1),
        TypeMatcher<ValueWithTestOptions>()
            .having((value) => value.value, 'value', [2])
            .having((value) => value.testOptions.skip, 'skip', null)
            .having((value) => value.testOptions.timeout, 'timeout', null)
            .having((value) => value.testOptions.retry, 'retry', null)
            .having((value) => value.testOptions.tags, 'tags', null)
            .having((value) => value.testOptions.onPlatform, 'onPlatform', null),
      );
    });

    test('wraps nested list with ValueWithTestOptions', () {
      final testList = [
        [1, 2],
        [3, 4],
      ];

      final result = wrap(testList, TestOptions());

      expect(
        result.elementAt(0),
        TypeMatcher<ValueWithTestOptions>()
            .having((value) => value.value, 'value', [1, 2])
            .having((value) => value.testOptions.skip, 'skip', null)
            .having((value) => value.testOptions.timeout, 'timeout', null)
            .having((value) => value.testOptions.retry, 'retry', null)
            .having((value) => value.testOptions.tags, 'tags', null)
            .having((value) => value.testOptions.onPlatform, 'onPlatform', null),
      );
      expect(
        result.elementAt(1),
        TypeMatcher<ValueWithTestOptions>()
            .having((value) => value.value, 'value', [3, 4])
            .having((value) => value.testOptions.skip, 'skip', null)
            .having((value) => value.testOptions.timeout, 'timeout', null)
            .having((value) => value.testOptions.retry, 'retry', null)
            .having((value) => value.testOptions.tags, 'tags', null)
            .having((value) => value.testOptions.onPlatform, 'onPlatform', null),
      );
    });

    test('wraps non nested list with ValueWithTestOptions and doesnt override existing ValueWithTestOptions', () {
      final testList = [
        1,
        2.withTestOptions(skip: true),
      ];

      final result = wrap(testList, TestOptions());

      expect(
        result.elementAt(0),
        TypeMatcher<ValueWithTestOptions>()
            .having((value) => value.value, 'value', [1])
            .having((value) => value.testOptions.skip, 'skip', null)
            .having((value) => value.testOptions.timeout, 'timeout', null)
            .having((value) => value.testOptions.retry, 'retry', null)
            .having((value) => value.testOptions.tags, 'tags', null)
            .having((value) => value.testOptions.onPlatform, 'onPlatform', null),
      );
      expect(
        result.elementAt(1),
        TypeMatcher<ValueWithTestOptions>()
            .having((value) => value.value, 'value', [2])
            .having((value) => value.testOptions.skip, 'skip', true)
            .having((value) => value.testOptions.timeout, 'timeout', null)
            .having((value) => value.testOptions.retry, 'retry', null)
            .having((value) => value.testOptions.tags, 'tags', null)
            .having((value) => value.testOptions.onPlatform, 'onPlatform', null),
      );
    });

    test('wraps nested list with ValueWithTestOptions and doesnt override existing ValueWithTestOptions', () {
      final testList = [
        [1, 2],
        [3, 4].withTestOptions(skip: true),
      ];

      final result = wrap(testList, TestOptions());

      expect(
        result.elementAt(0),
        TypeMatcher<ValueWithTestOptions>()
            .having((value) => value.value, 'value', [1, 2])
            .having((value) => value.testOptions.skip, 'skip', null)
            .having((value) => value.testOptions.timeout, 'timeout', null)
            .having((value) => value.testOptions.retry, 'retry', null)
            .having((value) => value.testOptions.tags, 'tags', null)
            .having((value) => value.testOptions.onPlatform, 'onPlatform', null),
      );
      expect(
        result.elementAt(1),
        TypeMatcher<ValueWithTestOptions>()
            .having((value) => value.value, 'value', [3,4])
            .having((value) => value.testOptions.skip, 'skip', true)
            .having((value) => value.testOptions.timeout, 'timeout', null)
            .having((value) => value.testOptions.retry, 'retry', null)
            .having((value) => value.testOptions.tags, 'tags', null)
            .having((value) => value.testOptions.onPlatform, 'onPlatform', null),
      );
    });
  });
}
