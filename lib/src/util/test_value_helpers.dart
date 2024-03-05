import '../errors/parameter_count_error.dart';
import '../test_options/test_options.dart';
import '../test_options/value_with_test_options.dart';

void mapTests(
  Iterable<ValueWithTestOptions> values,
  int length,
  dynamic Function(Iterable<dynamic>) body,
) {
  for (final ValueWithTestOptions value in values) {
    value.testOptions.test(value.description, () {
      validityCheck(value, length);
      return body(value.value);
    });
  }
}

void mapGroups(
  Iterable<ValueWithTestOptions> values,
  int length,
  dynamic Function(Iterable<dynamic>) body,
) {
  for (final ValueWithTestOptions value in values) {
    value.toGroupOptions.groupTest(() {
      validityCheck(value, length);
      return body(value.value);
    });
  }
}

void validityCheck(Iterable<dynamic> values, int length) {
  if (values.length != length) {
    throw ParameterCountError(length, values.length);
  }
}

Iterable<ValueWithTestOptions> wrap(
  Iterable<dynamic> values,
  TestOptions defaultTestOptions,
  Object groupDescription,
  CustomDescriptionBuilder? customDiscriptionBuilder,
) {
  int index = 0;
  return values.map((e) {
    index++;
    if (e is ValueWithTestOptions) {
      return e.copyWith(
        index: index,
        groupDescription: groupDescription,
        customDiscriptionBuilder: customDiscriptionBuilder,
      );
    } else if (e is Iterable<dynamic>) {
      return ValueWithTestOptions(
        e,
        defaultTestOptions,
        index: index,
        groupDescription: groupDescription,
        customDiscriptionBuilder: customDiscriptionBuilder,
      );
    } else {
      return ValueWithTestOptions(
        [e],
        defaultTestOptions,
        index: index,
        groupDescription: groupDescription,
        customDiscriptionBuilder: customDiscriptionBuilder,
      );
    }
  });
}
