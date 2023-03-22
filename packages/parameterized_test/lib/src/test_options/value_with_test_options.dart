import 'test_options.dart';

class ValueWithTestOptions<T> extends Iterable<T> {
  ValueWithTestOptions(this.value, this.testOptions);

  final Iterable<T> value;
  final TestOptions testOptions;

  @override
  Iterator<T> get iterator => value.iterator;
}
