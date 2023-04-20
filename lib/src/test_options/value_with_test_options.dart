import 'group_test_options.dart';
import 'test_options.dart';

class ValueWithTestOptions extends Iterable<dynamic> {
  ValueWithTestOptions(this.value, this.testOptions);

  final Iterable<dynamic> value;
  final TestOptions testOptions;

  @override
  Iterator<dynamic> get iterator => value.iterator;

  GroupTestOptions get toGroupOptions => GroupTestOptions(
        description: '$value',
        skip: testOptions.skip,
        onPlatform: testOptions.onPlatform,
        retry: testOptions.retry,
        tags: testOptions.tags,
        timeout: testOptions.timeout,
      );
}
