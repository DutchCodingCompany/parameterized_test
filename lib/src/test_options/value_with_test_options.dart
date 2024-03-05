import 'group_test_options.dart';
import 'test_options.dart';

typedef CustomDescriptionBuilder = String Function(
    Object groupDescription, int index, Iterable<dynamic> values);

class ValueWithTestOptions extends Iterable<dynamic> {
  ValueWithTestOptions(
    this.value,
    this.testOptions, {
    this.groupDescription = '',
    this.index = 0,
    this.customDiscriptionBuilder,
  });

  final Iterable<dynamic> value;
  final TestOptions testOptions;
  final int index;
  final Object groupDescription;
  final CustomDescriptionBuilder? customDiscriptionBuilder;

  String get description =>
      customDiscriptionBuilder?.call(groupDescription, index, value) ??
      '[ ${value.map((e) => e is String ? '\'$e\'' : e.toString()).join(', ')} ]';

  @override
  Iterator<dynamic> get iterator => value.iterator;

  GroupTestOptions get toGroupOptions => GroupTestOptions(
        description: description,
        skip: testOptions.skip,
        onPlatform: testOptions.onPlatform,
        retry: testOptions.retry,
        tags: testOptions.tags,
        timeout: testOptions.timeout,
      );

  ValueWithTestOptions copyWith({
    Iterable<dynamic>? value,
    TestOptions? testOptions,
    int? index,
    Object? groupDescription,
    CustomDescriptionBuilder? customDiscriptionBuilder,
  }) {
    return ValueWithTestOptions(
      value ?? this.value,
      testOptions ?? this.testOptions,
      groupDescription: groupDescription ?? this.groupDescription,
      index: index ?? this.index,
      customDiscriptionBuilder:
          customDiscriptionBuilder ?? this.customDiscriptionBuilder,
    );
  }
}
