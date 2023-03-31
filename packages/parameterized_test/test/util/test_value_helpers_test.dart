import 'package:parameterized_test/src/errors/parameter_count_error.dart';
import 'package:parameterized_test/src/util/test_value_helpers.dart';
import 'package:test/test.dart';

import '../test_helpers.dart';

void main() {
  group('mapTests tests', () {
    test('mapTests length 1 Iterable lenght equals 1', () {
      final testValues = [
        MockValueWithTestOptions([1]),
      ];

      late Iterable<dynamic> result;

      mapTests(testValues, 1, (value) {
        result = value;
      });

      expect(result, [1]);
    });

    test('mapTests length 1 throws [ParameterCountError] Iterable lenght not equals 1', () {
      final testValues = [
        MockValueWithTestOptions([1, 2]),
      ];

      Iterable<dynamic>? result;

      void callback() {
        mapTests(testValues, 1, (value) {
          result = value;
        });
      }

      expect(
        callback,
        throwsA(
          isA<ParameterCountError>()
              .having((error) => error.actual, 'actual', 2)
              .having((error) => error.expected, 'expected', 1),
        ),
      );
      expect(result, null);
    });

    test('excutes test with testoptions', () {
      List<Object> result = [];
      List<bool> executed = [];

      final testValues = [
        MockValueWithTestOptions([1], testOptions: MockTestOptions(descriptionCallback: (description) {
          result.add(description);
        })),
        MockValueWithTestOptions([2], testOptions: MockTestOptions(descriptionCallback: (description) {
          result.add(description);
        })),
      ];

      mapTests(testValues, 1, (value) {
        executed.add(true);
      });

      expect(result, ['(1)', '(2)']);
      expect(executed, [true, true]);
    });
  });
}
