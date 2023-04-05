import '../errors/parameter_count_error.dart';
import '../test_options/test_options.dart';
import '../test_options/value_with_test_options.dart';

void mapTests(Iterable<ValueWithTestOptions> values, int length,
    dynamic Function(Iterable<dynamic>) body) {
  for (final ValueWithTestOptions value in values) {
    value.testOptions.test('$value', () {
      validityCheck(value, length);
      body(value.value);
    });
  }
}

void validityCheck(Iterable<dynamic> values, int length) {
  if (values.length != length) {
    throw ParameterCountError(length, values.length);
  }
}

Iterable<ValueWithTestOptions> wrap(
    Iterable<dynamic> values, TestOptions defaultTestOptions) {
  return values.map((e) {
    if (e is ValueWithTestOptions) {
      return e;
    } else if (e is Iterable<dynamic>) {
      return ValueWithTestOptions(e, defaultTestOptions);
    } else {
      return ValueWithTestOptions([e], defaultTestOptions);
    }
  });
}
