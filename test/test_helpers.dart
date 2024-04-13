import 'package:parameterized_test/src/test_options/test_options.dart';

class MockTestOptions extends TestOptions {
  MockTestOptions({this.descriptionCallback}) : super();

  final dynamic Function(Object)? descriptionCallback;
}
