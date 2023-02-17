import 'package:test/test.dart';

import 'meta_data.dart';
import 'test_source.dart';

abstract class CsvSource implements TestSource<String>, MutliArgs {
  factory CsvSource(List<String> values, GroupMeta groupMeta) => _CsvSourceImpl(values, groupMeta);
}

class _CsvSourceImpl implements CsvSource {
  _CsvSourceImpl(this._values, this._groupMeta);

  final List<String> _values;

  final GroupMeta _groupMeta;

  @override
  void parameterizedTest(String description, Function(String value) body,
      {String? testOn, Timeout? timeout, skip, tags, Map<String, dynamic>? onPlatform, int? retry}) {
    // TODO: implement parameterizedTest
    throw UnimplementedError();
  }

  @override
  void parameterizedTest2<A1, A2>(String description, Function(A1 value, A2 value2) body,
      {String? testOn, Timeout? timeout, skip, tags, Map<String, dynamic>? onPlatform, int? retry}) {
    // TODO: implement parameterizedTest2
    throw UnimplementedError();
  }

  @override
  void parameterizedTest3<A1, A2, A3>(String description, Function(A1 value, A2 value2, A3 value3) body,
      {String? testOn, Timeout? timeout, skip, tags, Map<String, dynamic>? onPlatform, int? retry}) {
    // TODO: implement parameterizedTest3
    throw UnimplementedError();
  }

  @override
  void parameterizedTest4<A1, A2, A3, A4>(String description, Function(A1 value, A2 value2, A3 value3, A4 value4) body,
      {String? testOn, Timeout? timeout, skip, tags, Map<String, dynamic>? onPlatform, int? retry}) {
    // TODO: implement parameterizedTest4
    throw UnimplementedError();
  }

  @override
  void parameterizedTest5<A1, A2, A3, A4, A5>(
      String description, Function(A1 value, A2 value2, A3 value3, A4 value4, A5 value5) body,
      {String? testOn, Timeout? timeout, skip, tags, Map<String, dynamic>? onPlatform, int? retry}) {
    // TODO: implement parameterizedTest5
    throw UnimplementedError();
  }
}
