import 'package:test/test.dart';

import 'meta_data.dart';

abstract class TestSource<T> {
  abstract final List<T> _values;
  abstract final GroupMeta? _groupMeta;

  void parameterizedTest(
    String description,
    dynamic Function(T value) body, {
    String? testOn,
    Timeout? timeout,
    skip,
    tags,
    Map<String, dynamic>? onPlatform,
    int? retry,
  });
}

abstract class MutliArgs {
  dynamic parameterizedTest2<A1, A2>(
    String description,
    dynamic Function(A1 value, A2 value2) body, {
    String? testOn,
    Timeout? timeout,
    skip,
    tags,
    Map<String, dynamic>? onPlatform,
    int? retry,
  });

  dynamic parameterizedTest3<A1, A2, A3>(
    String description,
    dynamic Function(A1 value, A2 value2, A3 value3) body, {
    String? testOn,
    Timeout? timeout,
    skip,
    tags,
    Map<String, dynamic>? onPlatform,
    int? retry,
  });

  dynamic parameterizedTest4<A1, A2, A3, A4>(
    String description,
    dynamic Function(A1 value, A2 value2, A3 value3, A4 value4) body, {
    String? testOn,
    Timeout? timeout,
    skip,
    tags,
    Map<String, dynamic>? onPlatform,
    int? retry,
  });

  dynamic parameterizedTest5<A1, A2, A3, A4, A5>(
    String description,
    dynamic Function(A1 value, A2 value2, A3 value3, A4 value4, A5 value5) body, {
    String? testOn,
    Timeout? timeout,
    skip,
    tags,
    Map<String, dynamic>? onPlatform,
    int? retry,
  });
}
