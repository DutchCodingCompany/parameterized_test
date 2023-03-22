import 'package:parameterized_test/parameterized_test.dart';
import 'package:test/test.dart';

main() {
  parameterizedTest2('list list dynamic wrong type cast', [
    ['kiwi', 14],
    ['apple', 15],
    ['banana', 16],
  ], (String word, bool length) {
    expect(word.length, length);
  });

  parameterizedTest2('list list dynamic list to long for selected test', [
    ['kiwi', 4, 1],
    ['apple', 5, 1],
    ['banana', 6, 1].withTestOptions(skip: true),
  ], (String word, int length) {
    expect(word.length, length);
  }, setUp: () {
    print('iets');
  });

  parameterizedTest2('list list dynamic test', [
    ['kiwi', 4],
    ['apple', 5],
    ['banana', 6],
  ], (String word, int length) {
    expect(word.length, length);
  });

  parameterizedTest2('list list dynamic test', [
    ['kiwi', 14],
    ['apple', 15],
    ['banana', 16],
  ], (String word, int length) {
    expect(word.length, length);
  });

  parameterizedTest(
      'wrap single values',
      [
        1,
        2,
        3.withTestOptions(skip: true),
      ],
          (int value) {
        final result = value < 3;
        expect(result, true);
      });
}
