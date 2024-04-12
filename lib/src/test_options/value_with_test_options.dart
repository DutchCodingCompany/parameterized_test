import 'test_options.dart';

typedef CustomDescriptionBuilder = Object? Function(
  Object? groupDescription,
  int index,
  List<dynamic> values,
);

class ValueWithTestOptions {
  ValueWithTestOptions(
    this.value,
    this.testOptions,
  );

  final List<dynamic> value;
  final TestOptions testOptions;
}
