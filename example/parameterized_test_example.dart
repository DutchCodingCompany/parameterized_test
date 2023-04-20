import 'package:parameterized_test/parameterized_test.dart';
import 'package:test/test.dart';

void main() {
  parameterizedTest(
    'Example of list dynamic with 2 arguments, test successful',
    [
      ['kiwi', 4],
      ['apple', 5],
      ['banana', 6],
    ],
    // Easy smaller typedef
    p2((String word, int length) {
      expect(word.length, length);
    }),
  );

  parameterizedTest(
    'Example of list dynamic with 2 arguments, test successful',
    [
      ['kiwi', 4],
      ['apple', 5],
      ['banana', 6],
    ],
    // Full class
    TestParameters2((String word, int length) {
      expect(word.length, length);
    }),
  );

  parameterizedTest(
    'Example of list dynamic with 2 arguments, test unsuccessful',
    [
      ['kiwi', 14],
      ['apple', 15],
      ['banana', 16],
    ],
    p2((String word, int length) {
      expect(word.length, length);
    }),
  );

  parameterizedTest(
    'Example of list dynamic with 2 arguments, with extra options provided for 1 use case.',
    [
      ['kiwi', 4],
      ['apple', 5],
      ['banana', 6],
      ['Dragon fruit', 11]
          .withTestOptions(skip: 'Its 12 because of space. skip for now.'),
    ],
    // Easy smaller typedef
    p2((String word, int length) {
      expect(word.length, length);
    }),
  );

  parameterizedTest(
    'Example which fails because wrong type arguments are provided',
    [
      ['kiwi', 14],
      ['apple', 15],
      ['banana', 16],
    ],
    p2((String word, bool length) {
      expect(word.length, length);
    }),
  );

  parameterizedTest(
    'Example which fails because not enough argument options are provided',
    [
      ['kiwi', 4, 1],
      ['apple', 5, 1],
      ['banana', 6, 1],
    ],
    p2((String word, int length) {
      expect(word.length, length);
    }),
    setUp: () {
      print('Setup everything I need for testing');
    },
    tearDown: () {
      print('tear it down again');
    },
  );

  parameterizedTest(
    'Example with setup and teardown included',
    [
      ['kiwi', 4],
      ['apple', 5],
      ['banana', 6],
    ],
    p2((String word, int length) {
      expect(word.length, length);
    }),
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
    p1((int value) {
      final result = value < 4;
      expect(result, true);
    }),
  );
}
