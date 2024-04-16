import 'package:parameterized_test/parameterized_test.dart';
import 'package:parameterized_test/src/test_options/value_with_test_options.dart';
import 'package:test/test.dart';

void main() {
  test('Object test options extensions test', () {
    // act
    final result = [
      1,
      3.options(skip: 'not now'),
    ];

    expect(
      result[1],
      const TypeMatcher<ValueWithTestOptions>()
          .having((value) => value.values, 'value', [3]).having(
        (value) => value.testOptions?.skip,
        'skip',
        'not now',
      ),
    );
  });

  test('List test options extensions tests', () {
    // act
    final result = [
      [1, 2],
      [3, 4].options(skip: 'not now'),
    ];

    expect(
      result[1],
      const TypeMatcher<ValueWithTestOptions>()
          .having((value) => value.values, 'value', [3, 4]).having(
        (value) => value.testOptions?.skip,
        'skip',
        'not now',
      ),
    );
  });
}
