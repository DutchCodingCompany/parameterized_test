import 'package:parameterized_test/parameterized_test.dart';
import 'package:parameterized_test/src/test_options/group_test_options.dart';
import 'package:parameterized_test/src/test_options/test_options.dart';
import 'package:parameterized_test/src/test_options/value_with_test_options.dart';
import 'package:test/test.dart';

void main() {
  test('Object test options extensions test', () {
    // act
    final result = [
      1,
      3.withTestOptions(skip: 'not now'),
    ];

    expect(
      result[1],
      TypeMatcher<ValueWithTestOptions>()
          .having((value) => value.value, 'value', [3]).having(
        (value) => value.testOptions.skip,
        'skip',
        'not now',
      ),
    );
  });

  test('Object test options extensions tests', () {
    // act
    final result = [
      [1, 2],
      [3, 4].withTestOptions(skip: 'not now'),
    ];

    expect(
      result[1],
      TypeMatcher<ValueWithTestOptions>()
          .having((value) => value.value, 'value', [3, 4]).having(
        (value) => value.testOptions.skip,
        'skip',
        'not now',
      ),
    );
  });

  test('Test options in valueWithOptions are converted to group Options', () {
    final testOptions = ValueWithTestOptions(
      [1, 2, 3],
      TestOptions(
          tags: 'taggy',
          skip: 'skippy',
          timeout: Timeout(Duration.zero),
          retry: 1,
          onPlatform: {'foo': 'bar'}),
    );

    final result = testOptions.toGroupOptions;

    expect(
      result,
      TypeMatcher<GroupTestOptions>()
          .having((e) => e.description, 'desciption', '[1, 2, 3]')
          .having((e) => e.retry, 'retry', 1)
          .having((e) => e.onPlatform, 'onPlatform', {'foo': 'bar'})
          .having((e) => e.tags, 'tags', 'taggy')
          .having((e) => e.skip, 'skip', 'skippy')
          .having((e) => e.timeout, 'timeout', Timeout(Duration.zero)),
    );
  });
}
