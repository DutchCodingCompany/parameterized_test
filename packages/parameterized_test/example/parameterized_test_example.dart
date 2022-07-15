import 'package:parameterized_source/parameterized_source.dart';
import 'package:parameterized_test/parameterized_test.dart';
import 'package:test/test.dart';

void main() {
  parameterizedTest(
    'Amount of letters',
    ParameterizedSource.csv([
      'kiwi, 4',
      'apple, 5',
      'banana, 6',
    ]),
        (List<dynamic> values) {
      final String input = values[0];
      final expected = values[1];

      final actual = input.length;

      expect(actual, expected);
    },
  );

  parameterizedTest(
    'Amount of letters',
    ParameterizedSource.values([
      ['kiwi', 4],
      ['apple', 5],
      ['banana', 6],
    ]),
        (List<dynamic> values) {
      final String input = values[0];
      final expected = values[1];

      final actual = input.length;

      expect(actual, expected);
    },
  );

  parameterizedTest(
    'Words with 4 letters',
    ParameterizedSource.value([
      'kiwi',
      'bike',
      'four',
    ]),
        (List<dynamic> values) {
      final String input = values[0];

      final actual = input.length;

      expect(actual, 4);
    },
  );
}
