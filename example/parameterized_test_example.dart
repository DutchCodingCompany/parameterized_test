// ignore_for_file: avoid_print

import 'package:csv/csv.dart';
import 'package:parameterized_test/parameterized_test.dart';
import 'package:test/test.dart';

void main() {
  // Simple test containing a list of single values
  parameterizedTest(
    'Example of list of single values',
    [
      1,
      2,
      3,
    ],
    (int value) {
      final result = value < 4;
      expect(result, true);
    },
  );

  // Simple test containing a list of multiple values
  parameterizedTest('Example of list of multiple values', [
    [0, 1, 1],
    [1, 1, 2],
    [1, 2, 3],
    [2, 2, 4],
  ], (int value1, int value2, int sum) {
    expect(value1 + value2, sum);
  });

  // Test containing a list with complex objects
  parameterizedTest('Example of a list with complex object', [
    [DateTime(2024, 4, 12), 5],
    [DateTime(1969, 07, 20), 7],
  ], (DateTime dateTime, int expectedWeekday) {
    expect(dateTime.weekday, expectedWeekday);
  });

  // Test containing a list of enums
  parameterizedTest(
    'Example using enum as value',
    FruitEnum.values,
    (FruitEnum testEnum) {
      expect(testEnum.name.length, testEnum.wordLength);
    },
  );

  // Test retreiving the list of values from a function
  List<dynamic> provideData() {
    return [
      [0, 1, 1],
      [1, 1, 2],
      [1, 2, 3],
      [2, 2, 4],
    ];
  }

  parameterizedTest(
    'Example of list of values from function',
    provideData(),
    (int value1, int value2, int sum) {
      expect(value1 + value2, sum);
    },
  );

  // Simple test with setup and teardown
  parameterizedTest(
    'Example with setup and teardown ',
    [
      ['kiwi', 4],
      ['apple', 5],
      ['banana', 6],
    ],
    (String word, int length) {
      expect(word.length, length);
    },
    setUp: () {
      print('Setup everything I need for testing');
    },
    tearDown: () {
      print('tear it down again');
    },
  );

  // Test which is a async test
  // Note: This is a example test to showcase async tests are also possible.
  // But this is not a good practice to use a delay like
  // this in a test. Running this test will take longer. This could be
  // fixed by using a package like fake_async.
  parameterizedTest(
    'Example using a async test',
    [
      100,
      200,
      300,
    ],
    (int value) async {
      final millis = DateTime.now().millisecondsSinceEpoch;
      await Future<void>.delayed(Duration(milliseconds: value));
      final passed = DateTime.now().millisecondsSinceEpoch - millis;

      expect(passed >= value, true);
    },
  );

  // Test with CSV data
  parameterizedTest('Example of CSV data',
      const CsvToListConverter().convert('kiwi,4\r\napple,5\r\nbanana,6'),
      (String fruit, int length) {
    expect(fruit.length, length);
  });
}

enum FruitEnum {
  kiwi(4),
  apple(5),
  banana(6),
  pineapple(9);

  const FruitEnum(this.wordLength);

  final int wordLength;
}
