import 'test_options.dart';

class ValueWithTestOptions extends Iterable<dynamic> {
  ValueWithTestOptions(this.value, this.testOptions);

  final Iterable<dynamic> value;
  final TestOptions testOptions;

  @override
  Iterator<dynamic> get iterator => value.iterator;
}
