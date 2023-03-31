import 'package:meta/meta.dart';

import 'test_options/group_test_options.dart';
import 'test_options/test_options.dart';
import 'test_options/value_with_test_options.dart';
import 'test_parameters.dart';
import 'test_source.dart';
import 'util/test_value_helpers.dart';

abstract class ValueSource implements TestSource {
  factory ValueSource(
    Iterable<dynamic> values,
    GroupTestOptions groupTestOptions, [
    TestOptions defaultTestOptions = const TestOptions(),
  ]) =>
      _ValueSourceImpl(wrap(values, defaultTestOptions), groupTestOptions);

  @visibleForTesting
  static Iterable<ValueWithTestOptions> wrap(Iterable<dynamic> values, TestOptions defaultTestOptions) {
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
}

class _ValueSourceImpl implements ValueSource {
  const _ValueSourceImpl(
    this._values,
    this._groupTestOptions,
  );

  final Iterable<ValueWithTestOptions> _values;
  final GroupTestOptions _groupTestOptions;

  @override
  void executeTests(
    TestParameters body,
  ) {
    _groupTestOptions.groupTest(() {
      mapTests(_values, body.count, (value) {
        body.mapBody(value);
      });
    });
  }
}
