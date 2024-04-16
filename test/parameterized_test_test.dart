// ignore_for_file: avoid_print

import 'package:parameterized_test/parameterized_test.dart';
import 'package:parameterized_test/src/errors/parameterized_error.dart';
import 'package:parameterized_test/src/parameterized_test.dart';
import 'package:parameterized_test/src/test_options/test_options.dart';
import 'package:parameterized_test/src/test_options/value_with_test_options.dart';
import 'package:test/test.dart';

import 'test_helpers.dart';

void main() {
  late TestHelper _group;
  late TestHelper _test;
  late TestHelper _setUp;
  late TestHelper _tearDown;
  late ParameterizedTestImpl pTest;

  setUp(() {
    _group = TestHelper();
    _test = TestHelper();
    _setUp = TestHelper();
    _tearDown = TestHelper();
    pTest = ParameterizedTestImpl(
      _group.test,
      _test.test,
      _setUp.setUp,
      _tearDown.setUp,
    );
  });

  group('makeDescription tests', () {
    const baseDescription = 'Group description';
    test(
        'makeDescription return a String with '
        'comma separated values', () {
      final values = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

      final result = pTest.makeDescription(baseDescription, 1, values, null);

      expect(result, '[ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ]');
    });

    test(
        'makeDescription return a String with '
        'single qouted strings', () {
      final values = ['one', 'two', 'three'];

      final result = pTest.makeDescription(baseDescription, 1, values, null);

      expect(result, "[ 'one', 'two', 'three' ]");
    });

    test(
        'makeDescription return a String with '
        'single qouted strings and unqouted other object', () {
      final values = [
        'one',
        'two',
        'three',
        true,
        false,
        4,
        5,
        6,
        7.0,
        8.0,
        9.0,
      ];

      final result = pTest.makeDescription(baseDescription, 1, values, null);

      expect(
        result,
        "[ 'one', 'two', 'three', "
        'true, false, 4, 5, 6, 7.0, 8.0, 9.0 ]',
      );
    });

    test(
        'makeDescription return a String with '
        'formatted output by customDescriptionBuilder ', () {
      final values = [1, 2, 3];

      String builder(
        Object? groupDescription,
        int index,
        List<dynamic> values,
      ) {
        return '[ $groupDescription | $index | ${values.length} ]';
      }

      final result = pTest.makeDescription(baseDescription, 1, values, builder);

      expect(result, '[ Group description | 1 | 3 ]');
    });
  });

  test('parseValues test', () {
    final values = <dynamic>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    final valuesWithOption = (
      values: values,
      testOptions: const TestOptions(skip: 'skip'),
    );
    const dynamic singleValue = 1;

    expect(
      pTest.parseValues(valuesWithOption),
      valuesWithOption,
    );
    expect(
      pTest.parseValues(values),
      (values: values, testOptions: null),
    );
    expect(
      pTest.parseValues(singleValue),
      isA<ValueWithTestOptions>().having(
        (value) => value.values,
        'values',
        [singleValue],
      ).having(
        (value) => value.testOptions,
        'testOptions',
        null,
      ),
    );
  });

  group('parameterizedTest setUp + tearDown tests', () {
    test('no setUp/tearDown is called if none is provided', () {
      pTest('test', [1, 2, 3], (int value) => expect(value, value));
      expect(_setUp.setupCaptures, isEmpty);
      expect(_tearDown.setupCaptures, isEmpty);
    });

    test('setUp/tearDown is called if when provided', () {
      // ignore: prefer_function_declarations_over_variables
      final setUpCall = () => print('setUp');
      // ignore: prefer_function_declarations_over_variables
      final tearDownCall = () => print('tearDown');

      pTest(
        'test',
        [1, 2, 3],
        (int value) => expect(value, value),
        setUp: setUpCall,
        tearDown: tearDownCall,
      );
      expect(_setUp.setupCaptures, hasLength(1));
      expect(_setUp.setupCaptures.first, setUpCall);
      expect(_tearDown.setupCaptures, hasLength(1));
      expect(_tearDown.setupCaptures.first, tearDownCall);
    });
  });

  group('parameterizedTest group tests', () {
    test('group is called once per parameterizedTest', () {
      pTest('test', [1, 2, 3], (int value) => expect(value, value));
      expect(_group.testCaptures, hasLength(1));
    });

    test(
        'group is called with right parameters '
        '[ description, testOn, timeout, skip, tags, onPlatform, retry ]', () {
      const description = 'description';
      const testOn = 'testOn';
      const timeout = Timeout(Duration(seconds: 1));
      const skip = 'skip';
      const tags = 'tags';
      final onPlatform = {'onPlatform': 1};
      const retry = 2;

      pTest(
        description,
        [1, 2, 3],
        (int value) => expect(value, value),
        testOn: testOn,
        timeout: timeout,
        skip: skip,
        tags: tags,
        onPlatform: onPlatform,
        retry: retry,
      );

      expect(_group.testCaptures, hasLength(1));
      final result = _group.testCaptures.first;
      expect(result.description, description);
      expect(result.testOn, testOn);
      expect(result.timeout, timeout);
      expect(result.skip, skip);
      expect(result.tags, tags);
      expect(result.onPlatform, onPlatform);
      expect(result.retry, retry);
    });

    test(
        'group is called with right parameters '
        'options on value are not passed to group '
        '[ description, testOn, timeout, skip, tags, onPlatform, retry ]', () {
      const description = 'description';
      const testOn = 'testOn';
      const timeout = Timeout(Duration(seconds: 1));
      const skip = 'skip';
      const tags = 'tags';
      final onPlatform = {'onPlatform': 1};
      const retry = 2;

      pTest(
        description,
        [
          1,
          2.options(
            testOn: '',
            timeout: const Timeout(Duration(seconds: 2)),
            skip: '',
            tags: '',
            onPlatform: {},
            retry: 1,
          ),
          3,
        ],
        (int value) => expect(value, value),
        testOn: testOn,
        timeout: timeout,
        skip: skip,
        tags: tags,
        onPlatform: onPlatform,
        retry: retry,
      );

      expect(_group.testCaptures, hasLength(1));
      final result = _group.testCaptures.first;
      expect(result.description, description);
      expect(result.testOn, testOn);
      expect(result.timeout, timeout);
      expect(result.skip, skip);
      expect(result.tags, tags);
      expect(result.onPlatform, onPlatform);
      expect(result.retry, retry);
    });
  });

  group('parameterizedTest test tests', () {
    test('test called x times for the length of the values', () {
      pTest('test', [1, 2, 3], (int value) => expect(value, value));

      expect(_test.testCaptures, hasLength(3));
    });

    test('test called x times for the length of the values', () {
      pTest('test', [1, 2, 3], (int value) => expect(value, value));

      expect(_test.testCaptures, hasLength(3));
    });

    test('group testOptions are not passed to test', () {
      pTest(
        'test',
        [1, 2, 3],
        (int value) => expect(value, value),
        testOn: 'testOn',
        timeout: const Timeout(Duration(seconds: 1)),
        skip: 'skip',
        tags: 'tags',
        onPlatform: {'onPlatform': 1},
        retry: 2,
      );

      expect(_test.testCaptures, hasLength(3));
      for (final result in _test.testCaptures) {
        expect(result.description, isNot('test'));
        expect(result.testOn, null);
        expect(result.timeout, null);
        expect(result.skip, null);
        expect(result.tags, null);
        expect(result.onPlatform, null);
        expect(result.retry, null);
      }
    });

    test('test is called with test options provided for a value', () {
      const testOn = 'testOn';
      const timeout = Timeout(Duration(seconds: 1));
      const skip = 'skip';
      const tags = 'tags';
      final onPlatform = {'onPlatform': 1};
      const retry = 2;

      pTest(
        'test',
        [
          1,
          2.options(
            testOn: testOn,
            timeout: timeout,
            skip: skip,
            tags: tags,
            onPlatform: onPlatform,
            retry: retry,
          ),
          3,
        ],
        (int value) => expect(value, value),
        testOn: '',
        timeout: const Timeout(Duration(seconds: 2)),
        skip: '',
        tags: '',
        onPlatform: {},
        retry: 0,
      );

      expect(_test.testCaptures, hasLength(3));
      expect(_test.testCaptures[0].testOn, null);
      expect(_test.testCaptures[1].testOn, testOn);
      expect(_test.testCaptures[2].testOn, null);
      expect(_test.testCaptures[0].timeout, null);
      expect(_test.testCaptures[1].timeout, timeout);
      expect(_test.testCaptures[2].timeout, null);
      expect(_test.testCaptures[0].skip, null);
      expect(_test.testCaptures[1].skip, skip);
      expect(_test.testCaptures[2].skip, null);
      expect(_test.testCaptures[0].tags, null);
      expect(_test.testCaptures[1].tags, tags);
      expect(_test.testCaptures[2].tags, null);
      expect(_test.testCaptures[0].onPlatform, null);
      expect(_test.testCaptures[1].onPlatform, onPlatform);
      expect(_test.testCaptures[2].onPlatform, null);
      expect(_test.testCaptures[0].retry, null);
      expect(_test.testCaptures[1].retry, retry);
      expect(_test.testCaptures[2].retry, null);
    });

    test('test use description by desciption builder', () {
      pTest(
        'test',
        [1, 2, 3],
        (int value) => expect(value, value),
        customDescriptionBuilder: (groupDescription, index, values) {
          return index + values.length;
        },
      );

      expect(_test.testCaptures, hasLength(3));
      expect(_test.testCaptures[0].description, 2);
      expect(_test.testCaptures[1].description, 3);
      expect(_test.testCaptures[2].description, 4);
    });

    test(
        'test throws ParameterizedError when length values and length '
        'function arguments dont match', () {
      expect(
        () =>
            pTest('test', [1, 2, 3], (int value, int value2) => value + value2),
        throwsA(isA<ParameterizedError>()),
      );
      expect(
        () => pTest(
          'test',
          [
            [1, 2],
            [3, 4],
            [5, 6],
          ],
          (int value) => value,
        ),
        throwsA(isA<ParameterizedError>()),
      );
    });

    test(
        'test throws ParameterizedError when values types and '
        'function arguments types dont match', () {
      expect(
        () => pTest('test', [1, 2, 3], (String value) => value),
        throwsA(isA<ParameterizedError>()),
      );
      expect(
        () => pTest(
          'test',
          [
            [1, 2],
            [3, 4],
            [5, 6],
          ],
          (int value, String value2) => value + value2.length,
        ),
        throwsA(isA<ParameterizedError>()),
      );
    });

    test('test doesnt catch exceptions other than NoSuchMethodError, TypeError',
        () {
      expect(
        () => pTest('test', [1, 2, 3], (int value) => throw Exception('test')),
        throwsA(isA<Exception>()),
      );
    });
  });
}
