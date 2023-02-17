import 'package:test/test.dart';

import 'meta_data.dart';
import 'test_source.dart';

abstract class ValueSource<T> implements TestSource<T> {
  factory ValueSource(List<T> values, GroupMeta groupMeta) => _ValueSourceImpl(values, groupMeta);
}

class _ValueSourceImpl<T> implements ValueSource<T> {
  const _ValueSourceImpl(this._values, this._groupMeta);

  final List<T> _values;
  final GroupMeta _groupMeta;

  @override
  void parameterizedTest(
    String description,
    dynamic Function(T value) body, {
    String? testOn,
    Timeout? timeout,
    skip,
    tags,
    Map<String, dynamic>? onPlatform,
    int? retry,
  }) {
    final testMeta = TestMeta(timeout: timeout, skip: skip, tags: tags, onPlatform: onPlatform, retry: retry);
    _groupMeta.groupTest(description, () {
      for (final value in _values) {
        testMeta.test('[${value.toString()}]', () => body(value));
      }
    });
  }
}

abstract class ValuesSource<T> implements ValueSource<List<T>>, MutliArgs {
  factory ValuesSource(List<List<T>> values, GroupMeta groupMeta) => _ValuesSourceImpl(values, groupMeta);
}

class _ValuesSourceImpl<T> extends _ValueSourceImpl<List<T>> implements ValuesSource<T> {
  const _ValuesSourceImpl(List<List<T>> values, GroupMeta groupMeta) : super(values, groupMeta);

  @override
  void parameterizedTest2<A1, A2>(String description, Function(A1 value, A2 value2) body,
      {String? testOn, Timeout? timeout, skip, tags, Map<String, dynamic>? onPlatform, int? retry}) {
    final testMeta = TestMeta(timeout: timeout, skip: skip, tags: tags, onPlatform: onPlatform, retry: retry);

    _groupMeta.groupTest(description, () {
      _mapTests(_values, 2, testMeta, (value) {
        final A1 a1 = value.castHelper(0);
        final A2 a2 = value.castHelper(1);
        body(a1, a2);
      });
    });
  }

  @override
  void parameterizedTest3<A1, A2, A3>(String description, Function(A1 value, A2 value2, A3 value3) body,
      {String? testOn, Timeout? timeout, skip, tags, Map<String, dynamic>? onPlatform, int? retry}) {
    final testMeta = TestMeta(timeout: timeout, skip: skip, tags: tags, onPlatform: onPlatform, retry: retry);
    _groupMeta.groupTest(description, () {
      _mapTests(_values, 3, testMeta, (value) {
        final A1 a1 = value.castHelper(0);
        final A2 a2 = value.castHelper(1);
        final A3 a3 = value.castHelper(2);
        body(a1, a2, a3);
      });
    });
  }

  @override
  void parameterizedTest4<A1, A2, A3, A4>(String description, Function(A1 value, A2 value2, A3 value3, A4 value4) body,
      {String? testOn, Timeout? timeout, skip, tags, Map<String, dynamic>? onPlatform, int? retry}) {
    final testMeta = TestMeta(timeout: timeout, skip: skip, tags: tags, onPlatform: onPlatform, retry: retry);
    _groupMeta.groupTest(description, () {
      _mapTests(_values, 4, testMeta, (value) {
        final A1 a1 = value.castHelper(0);
        final A2 a2 = value.castHelper(1);
        final A3 a3 = value.castHelper(2);
        final A4 a4 = value.castHelper(3);
        body(a1, a2, a3, a4);
      });
    });
  }

  @override
  dynamic parameterizedTest5<A1, A2, A3, A4, A5>(
      String description, Function(A1 value, A2 value2, A3 value3, A4 value4, A5 value5) body,
      {String? testOn, Timeout? timeout, skip, tags, Map<String, dynamic>? onPlatform, int? retry}) {
    final testMeta = TestMeta(timeout: timeout, skip: skip, tags: tags, onPlatform: onPlatform, retry: retry);
    _groupMeta.groupTest(description, () {
      _mapTests(_values, 5, testMeta, (value) {
        final A1 a1 = value.castHelper(0);
        final A2 a2 = value.castHelper(1);
        final A3 a3 = value.castHelper(2);
        final A4 a4 = value.castHelper(3);
        final A5 a5 = value.castHelper(4);
        body(a1, a2, a3, a4, a5);
      });
    });
  }

  void _mapTests(List<List<T>> values, int length, TestMeta testMeta, dynamic Function(List<T>) body) {
    for (final value in values) {
      testMeta.test('[ ${value.join(',')} ]', () {
        _validityCheck(value, length);
        body(value);
      });
    }
  }

  void _validityCheck(List<T> values, int length) {
    if (values.length != length) {
      throw ParameterCountMismatchError('''
          Expected: $length parameters
          Actual: ${values.length} parameters
          Supplied parameter count does not match selected parameterizedTest$length.''');
    }
  }
}

extension on List<dynamic> {
  T castHelper<T>(int index) {
    try {
      return this[index] as T;
    } on TypeError catch (e, s) {
      throw SpecifiedTypeMismatchError('''
        Expected: $T
        Actual: ${this[index].runtimeType}
        Supplied test value type does not match parameter method type.
      ''');
    }
  }
}

class ParameterCountMismatchError extends Error {
  ParameterCountMismatchError(this.message);

  final String message;

  @override
  String toString() => message;
}

class SpecifiedTypeMismatchError extends Error {
  SpecifiedTypeMismatchError(this.message);

  final String message;

  @override
  String toString() => message;
}
