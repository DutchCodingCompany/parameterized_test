import 'package:parameterized_test/src/test_options/test_options.dart';
import 'package:parameterized_test/src/test_options/value_with_test_options.dart';
import 'package:test/test.dart';

void main() {
  final TestOptions testOptions = TestOptions();

  group('description tests', () {
    test(
        'ValueWithTestOptions with only String values are wrapped with \'quotes\'',
        () {
      final result = ValueWithTestOptions(
        ['a', 'b', '', '   '],
        testOptions,
      ).description;

      expect(result, "[ 'a', 'b', '', '   ' ]");
    });

    test(
        'ValueWithTestOptions with mixed types only String values are wrapped with \'quotes\'',
        () {
      final result = ValueWithTestOptions(
        ['a', 'b', '', '   ', 1, 1.5, true, _ClassWithToString()],
        testOptions,
      ).description;

      expect(
          result, "[ 'a', 'b', '', '   ', 1, 1.5, true, class with toString ]");
    });

    test(
        'ValueWithTestOptions with customDescriptionBuilder',
            () {
          final result = ValueWithTestOptions(
            ['a', 'b', '', '   ', 1, 1.5, true, _ClassWithToString()],
            testOptions,
            index: 10,
            groupDescription: 'group description',
            customDiscriptionBuilder: (groupDescription, index, values) => '🚀[$index] $groupDescription: <<${values.join('|')}>>',
          ).description;

          expect(
              result, "🚀[10] group description: <<a|b||   |1|1.5|true|class with toString>>");
        });
  });
}

class _ClassWithToString {
  @override
  String toString() => 'class with toString';
}
