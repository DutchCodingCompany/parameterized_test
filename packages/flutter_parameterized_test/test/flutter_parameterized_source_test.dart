import 'package:flutter_test/flutter_test.dart';
import 'package:parameterized_source/parameterized_source.dart';

void main() {
  group('ParameterizedSource.csv tests', () {
    test('csv values are split by , by default', () {
      // arrange
      final expected = [
        ['apple', 'banana'],
        ['pineapple', 'kiwi'],
      ];

      // act
      final actual = ParameterizedSource.csv([
        'apple, banana',
        'pineapple, kiwi',
      ]).params;

      // assert
      expect(actual, expected);
    });

    test('csv values are split by ;', () {
      // arrange
      final expected = [
        ['apple', 'banana'],
        ['pineapple', 'kiwi'],
      ];

      // act
      final actual = ParameterizedSource.csv(
        [
          'apple; banana',
          'pineapple; kiwi',
        ],
        pattern: ';',
      ).params;

      // assert
      expect(actual, expected);
    });

    test('csv values are not split', () {
      // arrange
      final expected = [
        ['apple; banana'],
        ['pineapple; kiwi'],
      ];

      // act
      final actual = ParameterizedSource.csv([
        'apple; banana',
        'pineapple; kiwi',
      ]).params;

      // assert
      expect(actual, expected);
    });

    test('csv values are parsed', () {
      // arrange
      final expected = [
        ['apple', 1.0, 1, true, false, null],
        ['banana', 1.0, 1, true, false, 'kiwi'],
      ];

      // act
      final actual = ParameterizedSource.csv([
        'apple, 1.0, 1, true, false, ',
        'banana, 1.0, 1, true, false, kiwi',
      ]).params;

      // assert
      expect(actual, expected);
    });

    test('csv values are not parsed', () {
      // arrange
      final expected = [
        ['apple', '1.0', '1', 'true', 'false', ''],
      ];

      // act
      final actual = ParameterizedSource.csv([
        'apple, "1.0", "1", "true", "false", ""',
      ]).params;

      // assert
      expect(actual, expected);
    });
  });

  group('ParameterizedSource.values tests', () {
    test('values are seperated', () {
      // arrange
      final expected = [
        ['apple'],
        ['banana'],
        ['kiwi'],
      ];

      // act
      final actual = ParameterizedSource.value([
        'apple',
        'banana',
        'kiwi',
      ]).params;

      // assert
      expect(actual, expected);
    });

    test('values are seperated but not like csv', () {
      // arrange
      final expected = [
        ['apple,2'],
        ['banana,2'],
        ['kiwi,2'],
      ];

      // act
      final actual = ParameterizedSource.value([
        'apple,2',
        'banana,2',
        'kiwi,2',
      ]).params;

      // assert
      expect(actual, expected);
    });
  });
}
