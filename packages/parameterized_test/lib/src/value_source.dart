import 'package:meta/meta.dart';
import 'package:parameterized_test/src/test_options/value_with_test_options.dart';

import 'errors/parameter_count_error.dart';
import 'errors/parameter_type_error.dart';
import 'test_options/group_test_options.dart';
import 'test_options/test_options.dart';
import 'test_source.dart';

abstract class ValueSource<T> implements TestSource<T> {
  factory ValueSource(
    Iterable values,
    GroupTestOptions groupTestOptions, [
    TestOptions defaultTestOptions = const TestOptions(),
  ]) =>
      _ValueSourceImpl(wrap(values, defaultTestOptions), groupTestOptions);

  @visibleForTesting
  static Iterable<ValueWithTestOptions<R>> wrap<R>(Iterable values, TestOptions defaultTestOptions) {
    return values.map((e) {
      if (e is ValueWithTestOptions<R>) {
        return e;
      } else if (e is Iterable<R>) {
        return ValueWithTestOptions(e, defaultTestOptions);
      } else {
        return ValueWithTestOptions([e], defaultTestOptions);
      }
    });
  }
}

class _ValueSourceImpl<T> implements ValueSource<T> {
  const _ValueSourceImpl(
    this._values,
    this._groupTestOptions,
  );

  final Iterable<ValueWithTestOptions<T>> _values;
  final GroupTestOptions _groupTestOptions;

  @override
  void executeTests<A1>(
    dynamic Function(A1 value) body,
  ) {
    _groupTestOptions.groupTest(
      () {
        mapTest(_values, (value) {
          final A1 a1 = cast(value);
          body(a1);
        });
      },
    );
  }

  @override
  void executeTests2<A1, A2>(
    Function(A1 value, A2 value2) body,
  ) {
    _groupTestOptions.groupTest(() {
      mapTests(_values, 2, (value) {
        final A1 a1 = castElementAt(value, 0);
        final A2 a2 = castElementAt(value, 1);
        body(a1, a2);
      });
    });
  }

  @override
  void executeTests3<A1, A2, A3>(
    Function(A1 value, A2 value2, A3 value3) body,
  ) {
    _groupTestOptions.groupTest(() {
      mapTests(_values, 3, (value) {
        final A1 a1 = castElementAt(value, 0);
        final A2 a2 = castElementAt(value, 1);
        final A3 a3 = castElementAt(value, 2);
        body(a1, a2, a3);
      });
    });
  }

  @override
  void executeTests4<A1, A2, A3, A4>(
    Function(A1 value, A2 value2, A3 value3, A4 value4) body,
  ) {
    _groupTestOptions.groupTest(() {
      mapTests(_values, 4, (value) {
        final A1 a1 = castElementAt(value, 0);
        final A2 a2 = castElementAt(value, 1);
        final A3 a3 = castElementAt(value, 2);
        final A4 a4 = castElementAt(value, 3);
        body(a1, a2, a3, a4);
      });
    });
  }

  @override
  dynamic executeTests5<A1, A2, A3, A4, A5>(
    Function(A1 value, A2 value2, A3 value3, A4 value4, A5 value5) body,
  ) {
    _groupTestOptions.groupTest(() {
      mapTests(_values, 5, (value) {
        final A1 a1 = castElementAt(value, 0);
        final A2 a2 = castElementAt(value, 1);
        final A3 a3 = castElementAt(value, 2);
        final A4 a4 = castElementAt(value, 3);
        final A5 a5 = castElementAt(value, 4);
        body(a1, a2, a3, a4, a5);
      });
    });
  }

  @override
  executeTests6<A1, A2, A3, A4, A5, A6>(
    Function(A1 value, A2 value2, A3 value3, A4 value4, A5 value5, A6 value6) body,
  ) {
    _groupTestOptions.groupTest(() {
      mapTests(_values, 6, (value) {
        final A1 a1 = castElementAt(value, 0);
        final A2 a2 = castElementAt(value, 1);
        final A3 a3 = castElementAt(value, 2);
        final A4 a4 = castElementAt(value, 3);
        final A5 a5 = castElementAt(value, 4);
        final A6 a6 = castElementAt(value, 5);
        body(a1, a2, a3, a4, a5, a6);
      });
    });
  }

  @visibleForTesting
  void mapTest(Iterable<ValueWithTestOptions<T>> values, dynamic Function(T) body) {
    for (final value in values) {
      validityCheck(value, 1);
      value.testOptions.test('[ ${value.first} ]', () {
        body(value.value.first);
      });
    }
  }

  @visibleForTesting
  void mapTests(Iterable<ValueWithTestOptions<T>> values, int length, void Function(Iterable<T>) body) {
    for (final value in values) {
      value.testOptions.test('[ $value ]', () {
        body(value.value);
      });
    }
  }

  @visibleForTesting
  void validityCheck(Iterable<T> values, int length) {
    if (values.length != length) {
      throw ParameterCountError(length, values.length);
    }
  }

  @visibleForTesting
  R cast<R, S>(S value) {
    try {
      return value as R;
    } on TypeError catch (e, s) {
      throw ParameterTypeError(R, runtimeType);
    }
  }

  @visibleForTesting
  R castElementAt<R>(Iterable values, int index) => cast(values.elementAt(index));
}
