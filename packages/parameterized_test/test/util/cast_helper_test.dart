import 'package:parameterized_test/src/errors/parameter_type_error.dart';
import 'package:parameterized_test/src/util/cast_helpers.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('Single value casting successful', () {
    test('dynamic int to int', () {
      final dynamic value = 1;

      final int result = cast(value);

      expect(result, TypeMatcher<int>().having((number) => number, 'int', 1));
    });

    test('int to int', () {
      final value = 1;

      final int result = cast(value);

      expect(result, TypeMatcher<int>().having((number) => number, 'int', 1));
    });
  });

  group('Single value casting unsuccessful throws ParameterTypeError', () {
    test('dynamic int to String', () {
      final dynamic value = 1;

      String callback() => cast(value);

      expect(
        callback,
        throwsA(isA<ParameterTypeError>()
            .having((error) => error.actual, 'actual', int)
            .having((error) => error.expected, 'expected', String)),
      );
    });

    test('int to String', () {
      final int value = 1;

      String callback() => cast(value);

      expect(
        callback,
        throwsA(isA<ParameterTypeError>()
            .having((error) => error.actual, 'actual', int)
            .having((error) => error.expected, 'expected', String)),
      );
    });
  });

  group('castElementAt value casting successful', () {
    test('dynamic List<int> to int', () {
      final Iterable<dynamic> value = [1, 2];

      final int result1 = castElementAt(value, 0);
      final int result2 = castElementAt(value, 1);

      expect(result1, TypeMatcher<int>().having((number) => number, 'int', 1));
      expect(result2, TypeMatcher<int>().having((number) => number, 'int', 2));
    });

    test('List<int> to int', () {
      final value = [1, 2];

      final int result1 = castElementAt(value, 0);
      final int result2 = castElementAt(value, 1);

      expect(result1, TypeMatcher<int>().having((number) => number, 'int', 1));
      expect(result2, TypeMatcher<int>().having((number) => number, 'int', 2));
    });

    test('List<dynamic> to int & String', () {
      final value = [1, '2'];

      final int result1 = castElementAt(value, 0);
      final String result2 = castElementAt(value, 1);

      expect(result1, TypeMatcher<int>().having((number) => number, 'int', 1));
      expect(
        result2,
        TypeMatcher<String>().having((number) => number, 'int', '2'),
      );
    });
  });

  group(
    'castElementAt value casting unsuccessful throws ParameterTypeError',
    () {
      test('dynamic List<int> to String', () {
        final Iterable<dynamic> value = [1, 2];

        String callback1() => castElementAt(value, 0);
        String callback2() => castElementAt(value, 1);

        expect(
          callback1,
          throwsA(isA<ParameterTypeError>()
              .having((error) => error.actual, 'actual', int)
              .having((error) => error.expected, 'expected', String)),
        );
        expect(
          callback2,
          throwsA(isA<ParameterTypeError>()
              .having((error) => error.actual, 'actual', int)
              .having((error) => error.expected, 'expected', String)),
        );
      });

      test('List<int> to String', () {
        final List<int> value = [1, 2];
        String callback1() => castElementAt(value, 0);
        String callback2() => castElementAt(value, 1);

        expect(
          callback1,
          throwsA(isA<ParameterTypeError>()
              .having((error) => error.actual, 'actual', int)
              .having((error) => error.expected, 'expected', String)),
        );
        expect(
          callback2,
          throwsA(isA<ParameterTypeError>()
              .having((error) => error.actual, 'actual', int)
              .having((error) => error.expected, 'expected', String)),
        );
      });

      test('List<dynamic> to String', () {
        final List<dynamic> value = [1, true];
        String callback1() => castElementAt(value, 0);
        String callback2() => castElementAt(value, 1);

        expect(
          callback1,
          throwsA(isA<ParameterTypeError>()
              .having((error) => error.actual, 'actual', int)
              .having((error) => error.expected, 'expected', String)),
        );
        expect(
          callback2,
          throwsA(isA<ParameterTypeError>()
              .having((error) => error.actual, 'actual', bool)
              .having((error) => error.expected, 'expected', String)),
        );
      });
    },
  );
}
