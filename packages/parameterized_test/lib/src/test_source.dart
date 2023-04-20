import 'test_parameters.dart';

abstract class TestSource {
  void executeTests(TestParameters body);
  void executeGroup(TestParameters body);
}
