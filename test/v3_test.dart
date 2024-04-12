import 'package:parameterized_test/src/parameterized_test.dart';
import 'package:parameterized_test/src/test_options/test_options_ext.dart';
import 'package:test/test.dart';

void main() {
  parameterizedTest('Working test', [
    ['kiwi', 4],
    ['apple', 5],
    ['apple', 5].options(customDescriptionBuilder: (a, b, c) => '$c,$b,$a'),
    ['banana', 6].options(skip: 'daarom'),
    ['apple', 5],
    ['banana', 6],
  ], (String word, int length) {
    expect(word.length, length);
  });

  parameterizedTest('Failing expect', [
    ['kiwi', 5],
    ['apple', 6],
    ['banana', 7],
  ], (String word, int length) {
    expect(word.length, length);
  });

  parameterizedTest(
      'Failing test, Providing too many values(3) for function '
      'positionalArguments(2)',
      [
        ['kiwi', 4, 2],
        ['apple', 5, 3],
        ['banana', 6, 4],
      ], (String word, int length) {
    expect(word.length, length);
  });

  parameterizedTest(
      'Failing test, Providing too many values(3) for function '
      'positionalArguments(2)',
      [
        ['kiwi', 4, 2],
        ['apple', 5, 3],
        ['banana', 6, <Map<Map<String, int>, int>>{}],
      ], (String word, int length) {
    expect(word.length, length);
  });

  parameterizedTest(
      'Failing test, Providing not enough values(2) for function '
      'positionalArguments(3)',
      [
        ['kiwi', 4],
        ['apple', 5],
        ['banana', 6],
      ], (String word, int length, String name) {
    expect(word.length, length);
  });

  parameterizedTest(
      'Failing test, Providing not enough values(2) for function '
      'positionalArguments(3)',
      [
        ['kiwi', 4],
        ['apple', 5],
        ['banana', 6],
      ], (
    String word,
    int length,
    TooMany<String, int, Map<String, int>, double> name,
  ) {
    expect(word.length, length);
  });

  parameterizedTest(
      'Failing test, Providing wrong value Type(int) for function '
      'positionalArguments(String)',
      [
        ['kiwi', 4],
        ['apple', 5],
        ['banana', 8],
      ], (String word, String length) {
    expect(word.length, length);
  });

  parameterizedTest(
      'Failing test, Providing wrong value Types(String, int) for function '
      'positionalArguments(int, String)',
      [
        ['kiwi', 4],
        ['apple', 5],
        ['banana', 8],
      ], (int word, String length) {
    expect(word, length.length);
  });
}

class TooMany<A, S, D, F> {}
