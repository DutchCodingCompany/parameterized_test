import 'test_parameters.dart';

abstract interface class TestSource {
  void executeTests(TestParameters body);
  void executeGroup(TestParameters body);
}
