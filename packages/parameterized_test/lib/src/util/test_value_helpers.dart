import '../errors/parameter_count_error.dart';
import '../test_options/value_with_test_options.dart';

void mapTests<T>(Iterable<ValueWithTestOptions<T>> values, int length, Function(Iterable) body) {
  for (final ValueWithTestOptions value in values) {
    value.testOptions.test('$value', () {
      validityCheck(value, length);
      body(value.value);
    });
  }
}

void validityCheck<T>(Iterable<T> values, int length) {
  if (values.length != length) {
    throw ParameterCountError(length, values.length);
  }
}
