import 'package:parameterized_test/src/test_parameters.dart';

abstract class TestSource<T> {
  void executeTests(TestParameters body);
}
