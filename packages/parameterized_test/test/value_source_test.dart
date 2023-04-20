import 'package:parameterized_test/parameterized_test.dart';
import 'package:parameterized_test/src/test_options/group_test_options.dart';
import 'package:parameterized_test/src/value_source.dart';
import 'package:test/test.dart';

import 'test_helpers.dart';

void main() {
  group('ValueSource tests', () {
    late GroupTestOptions mockOptions;

    setUp(() {
      mockOptions = MockGroupOptions('mockOptions');
    });

    test('body gets executed with values of non nested list', () {
      List<int> numbers = [];

      final valueSource = ValueSource(
        [
          MockValueWithTestOptions([1]),
          MockValueWithTestOptions([2]),
        ],
        mockOptions,
      );

      valueSource.executeTests(
        TestParameters1((int number) {
          numbers.add(number);
        }),
      );

      expect(numbers, [1, 2]);
    });

    test('body gets executed with values of nested list', () {
      List<int> numbers = [];

      final valueSource = ValueSource(
        [
          MockValueWithTestOptions([1, 2]),
          MockValueWithTestOptions([3, 4]),
        ],
        mockOptions,
      );

      valueSource.executeTests(
        TestParameters2((int number1, int number2) {
          numbers.add(number1);
          numbers.add(number2);
        }),
      );

      expect(numbers, [1, 2, 3, 4]);
    });
  });
}
