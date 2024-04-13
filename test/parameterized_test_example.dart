// ignore_for_file: avoid_print

import 'package:parameterized_test/parameterized_test.dart';
import 'package:test/test.dart';

void main() {
  parameterizedTest('Example of DateTime matching a specific day', [
    [DateTime(2024, 4, 12), 5],
    [DateTime(1969, 07, 20), 7],
  ], (DateTime dateTime, int expectedWeekday) {
    expect(dateTime.weekday, expectedWeekday);
  });

  parameterizedTest(
    'Example of list dynamic with 2 arguments, test successful',
    [
      ['kiwi', 4],
      ['apple', 5],
      ['banana', 6],
    ],
    // Easy smaller typedef
    (String word, int length) {
      expect(word.length, length);
    },
  );

  parameterizedTest(
    'Example of list dynamic with 2 arguments, with extra options provided '
    'for 1 use case.',
    [
      ['kiwi', 4],
      ['apple', 5],
      ['banana', 6],
      ['Dragon fruit', 11]
          .options(skip: 'Its 12 because of space. skip for now.'),
    ],
    // Easy smaller typedef
    (String word, int length) {
      expect(word.length, length);
    },
  );

  parameterizedTest(
    'Example with setup and teardown included',
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

  parameterizedTest(
    'Example with list of one type.',
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

  parameterizedTest(
    'Example with list of one type, with extra options provided '
    'for 1 use case.',
    [
      1,
      2,
      3,
      4.options(skip: 'Its 4 because of space. skip for now.'),
    ],
    (int value) {
      final result = value < 4;
      expect(result, true);
    },
  );

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

  parameterizedTest(
    'Example using enum as value',
    TestEnum.values,
    (TestEnum testEnum) {
      expect(testEnum.name.length, testEnum.myLength);
    },
  );
}

enum TestEnum {
  one(3),
  two(3),
  three(5);

  const TestEnum(this.myLength);

  final int myLength;
}
