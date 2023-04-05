import 'package:parameterized_test/src/test_options/group_test_options.dart';
import 'package:parameterized_test/src/test_options/test_options.dart';
import 'package:parameterized_test/src/test_options/value_with_test_options.dart';

class MockGroupOptions extends GroupTestOptions {
  MockGroupOptions(String description) : super(description: description);

  @override
  void groupTest(dynamic Function() body) {
    body();
  }
}

class MockTestOptions extends TestOptions {
  MockTestOptions({this.descriptionCallback}) : super();

  final dynamic Function(Object)? descriptionCallback;

  @override
  void test(Object description, dynamic Function() body) {
    descriptionCallback?.call(description);
    body();
  }
}

class MockValueWithTestOptions extends ValueWithTestOptions {
  MockValueWithTestOptions(
    Iterable<dynamic> values, {
    MockTestOptions? testOptions,
  }) : super(values, testOptions ?? MockTestOptions());
}
