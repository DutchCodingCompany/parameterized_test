import 'package:parameterized_test/src/test_options/test_options.dart';

/// {@template CustomDescriptionBuilder}
/// Custom description builder. Enable the user to customize the description
/// for each test.
///
/// For example:
/// ```dart
/// customDiscriptionBuilder: (groupDescription, index, values) =>
/// '🚀[$index] $groupDescription: <<${values.join('|')}>>',
/// ```
/// {@endtemplate}
typedef CustomDescriptionBuilder =
    Object? Function(Object? groupDescription, int index, List<dynamic> values);

/// {@template ValueWithTestOptions}
/// Wrapper for test values and associated test options.
/// {@endtemplate}
typedef ValueWithTestOptions = ({
  List<dynamic> values,
  TestOptions? testOptions,
});
