import 'group_test_options.dart';
import 'test_options.dart';

class ValueWithTestOptions extends Iterable<dynamic> {
  ValueWithTestOptions(this.value, this.testOptions);

  final Iterable<dynamic> value;
  final TestOptions testOptions;

  String get description =>
      '[ ${value.map((e) => e is String ? '\'$e\'' : e.toString()).join(', ')} ]';

  @override
  Iterator<dynamic> get iterator => value.iterator;

  GroupTestOptions get toGroupOptions => GroupTestOptions(
        description: description,
        skip: testOptions.skip,
        onPlatform: testOptions.onPlatform,
        retry: testOptions.retry,
        tags: testOptions.tags,
        timeout: testOptions.timeout,
      );
}
