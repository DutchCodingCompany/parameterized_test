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
        (String word, int length) {
      expect(word.length, length);
    },
  );

  parameterizedTest(
    'Example of list dynamic with 2 arguments, with extra options provided for 1 use case.',
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
}
