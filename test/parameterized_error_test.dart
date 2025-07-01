// We want to catch these errors to test if we can provide better error messages
// ignore_for_file: document_ignores

import 'package:parameterized_test/src/errors/parameterized_error.dart';
import 'package:test/test.dart';

void main() {
  group('Test formatting of error messages', () {
    test('ParameterizedError from NoSuchMethodError', () {
      try {
        Function.apply((int value) => value, [1, 2]);
        //ignore: avoid_catching_errors
      } on NoSuchMethodError catch (e) {
        final result = ParameterizedError.fromNoSuchMethodError(e, [1, 2]);
        expect(
          result.message,
          "Provided value(s) didn't match the function arguments "
          'count.\n'
          'Amount of provided values: 2\n'
          'Expected function arguments: 1\n'
          'Test values: [1, 2]\n'
          'Provided types: (int, int)\n'
          'Expected types: (int)',
        );
      }
      try {
        Function.apply((int value, int value2) => value + value2, [1]);
        //ignore: avoid_catching_errors
      } on NoSuchMethodError catch (e) {
        final result = ParameterizedError.fromNoSuchMethodError(e, [1]);
        expect(
          result.message,
          "Provided value(s) didn't match the function arguments "
          'count.\n'
          'Amount of provided values: 1\n'
          'Expected function arguments: 2\n'
          'Test values: [1]\n'
          'Provided types: (int)\n'
          'Expected types: (int, int)',
        );
      }
    });

    test('ParameterizedError for TypeError', () {
      final result = ParameterizedError.forTypeError([
        1,
      ], (String value) => value);
      expect(
        result.message,
        "Provided value(s) didn't match the function arguments types.\n"
        'Test values: [1]\n'
        'Provided types: (int)\n'
        'Expected types: (String)',
      );
    });
  });

  test('extractFunctionArgumentsSignature tests', () {
    final testValues = [
      ((int value) => Null, 'int'),
      ((int value) => String, 'int'),
      ((int value, String string) => Null, 'int, String'),
      ((int value, String string) => double, 'int, String'),
      ((Map<int, String> value, String string) => Null, 'Map, String'),
      (
        (Map<int, String> value, String string) => Map<double, bool>,
        'Map, String',
      ),
      (
        (Map<int, Map<double, bool>> value, String string) => Null,
        'Map, String',
      ),
      ((int value, String string) async => Future<String>, 'int, String'),
    ];

    for (final e in testValues) {
      final result = ParameterizedError.extractFunctionArgumentsSignature(
        e.$1.toString(),
      );

      expect(result, e.$2);
    }
  });
}
