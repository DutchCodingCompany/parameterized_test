import 'package:test/test.dart';

import 'csv_source.dart';
import 'meta_data.dart';
import 'value_source.dart';

extension ValueTestExt<T> on List<T> {
  ValueSource<T> get testSource => TestSource();

  ValueSource<T> TestSource({
    String? testOn,
    Timeout? timeout,
    skip,
    tags,
    Map<String, dynamic>? onPlatform,
    int? retry,
  }) {
    final groupMeta = GroupMeta(
      testOn: testOn,
      timeout: timeout,
      skip: skip,
      tags: tags,
      onPlatform: onPlatform,
      retry: retry,
    );
    return ValueSource(this, groupMeta);
  }
}

extension ValuesTestExt<T> on List<List<T>> {
  ValuesSource<T> get testSource => TestSource();

  ValuesSource<T> TestSource({
    String? testOn,
    Timeout? timeout,
    skip,
    tags,
    Map<String, dynamic>? onPlatform,
    int? retry,
  }) {
    final groupMeta = GroupMeta(
      testOn: testOn,
      timeout: timeout,
      skip: skip,
      tags: tags,
      onPlatform: onPlatform,
      retry: retry,
    );
    return ValuesSource(this, groupMeta);
  }
}

extension CsvTestExt on List<String> {
  CsvSource get testSource => TestSource();

  CsvSource TestSource({
    String? testOn,
    Timeout? timeout,
    skip,
    tags,
    Map<String, dynamic>? onPlatform,
    int? retry,
  }) {
    final groupMeta = GroupMeta(
      testOn: testOn,
      timeout: timeout,
      skip: skip,
      tags: tags,
      onPlatform: onPlatform,
      retry: retry,
    );
    return CsvSource(this, groupMeta);
  }
}
