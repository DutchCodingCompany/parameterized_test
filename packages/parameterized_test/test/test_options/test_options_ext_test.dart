import 'package:parameterized_test/parameterized_test.dart';
import 'package:parameterized_test/src/test_options/value_with_test_options.dart';
import 'package:test/test.dart';

void main() {
  test('Object test options extensions test', () {
    // act
    final result = [
      1,
      3.withTestOptions(skip: 'not now'),
    ];

    expect(
      result[1],
      TypeMatcher<ValueWithTestOptions>()
          .having((value) => value.value, 'value', [3]).having((value) => value.testOptions.skip, 'skip', 'not now'),
    );
  });

  test('Object test options extensions tests', () {
    // act
    final result = [
      [1, 2],
      [3, 4].withTestOptions(skip: 'not now'),
    ];

    expect(
      result[1],
      TypeMatcher<ValueWithTestOptions>()
          .having((value) => value.value, 'value', [3, 4]).having((value) => value.testOptions.skip, 'skip', 'not now'),
    );
  });
}
