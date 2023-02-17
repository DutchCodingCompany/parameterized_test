import 'package:parameterized_test/src/parameterized_ext.dart';
import 'package:test/test.dart';

main() {
  [
    ['kiwi', 14],
    ['apple', 15],
    ['banana', 16],
  ].testSource.parameterizedTest2('list list dynamic wrong type cast', (String word, bool length) {
    expect(word.length, length);
  });

  [
    ['kiwi', 4, 1],
    ['apple', 5, 1],
    ['banana', 6, 1],
  ].testSource.parameterizedTest2('list list dynamic list to long for selected test', (String word, int length) {
    expect(word.length, length);
  });

  [
    ['kiwi', 4],
    ['apple', 5],
    ['banana', 6],
  ].testSource.parameterizedTest2('list list dynamic test', (String word, int length) {
    expect(word.length, length);
  });

  [
    ['kiwi', 14],
    ['apple', 15],
    ['banana', 16],
  ].testSource.parameterizedTest2('list list dynamic test', (String word, int length) {
    expect(word.length, length);
  });
}
