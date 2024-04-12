import 'package:parameterized_test/src/test_options/test_options.dart';
import 'package:parameterized_test/src/test_options/value_with_test_options.dart';

class MockTestOptions extends TestOptions {
  MockTestOptions({this.descriptionCallback}) : super();

  final dynamic Function(Object)? descriptionCallback;
}

class MockValueWithTestOptions extends ValueWithTestOptions {
  MockValueWithTestOptions(
    List<dynamic> values, {
    MockTestOptions? testOptions,
  }) : super(values, testOptions ?? MockTestOptions());
}
