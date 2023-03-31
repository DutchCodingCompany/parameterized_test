/// This class contains the parameters which will be supplied to the parameterizedTests.
///
/// Current options are:
/// - [ParameterizedSource.csv]
/// - [ParameterizedSource.value]
/// - [ParameterizedSource.values]
@Deprecated('Removed in v1.0.0')
class ParameterizedSource {
  final List<List<dynamic>> params;

  const ParameterizedSource._(this.params);

  /// Creates a [ParameterizedSource] from supplied list of csv values (strings).
  ///
  /// Csv values are split based on the supplied [pattern]. By default [pattern] is ','.
  ///
  /// After splitting the values the library try to parse each value to the following types: int, double, bool or nullable string.
  /// If parsing is unsuccessful the initial string value is returned.
  ///
  /// For example:
  /// ```dart
  ///ParameterizedSource.csv([
  ///   'kiwi, 4'
  ///   'apple, 5'
  ///   'banana, 6'
  ///]);
  ///```
  factory ParameterizedSource.csv(List<String> csvValues, {String pattern = ','}) =>
      ParameterizedSource._(csvValues.map((value) => value.split(pattern).map((e) => _tryParse(e)).toList()).toList());

  /// Creates a [ParameterizedSource] from supplied 2 dimensional list of dynamic values.
  ///
  /// For example:
  /// ```dart
  /// parameterizedTest(
  ///     'Amount of letters',
  ///     ParameterizedSource.values([
  ///       ['kiwi', 4],
  ///       ['apple', 5],
  ///       ['banana', 6],
  ///     ]),
  ///     (List<dynamic> values) {
  ///       final String input = values[0];
  ///       final expected = values[1];
  ///
  ///       final actual = input.length;
  ///
  ///       expect(actual, expected);
  ///     },
  ///   );
  ///```
  factory ParameterizedSource.values(List<List<dynamic>> csvValues) =>
      ParameterizedSource._(csvValues);

  /// Creates a [ParameterizedSource] from supplied list of values.
  ///
  /// For example:
  /// ```dart
  ///  parameterizedTest(
  ///     'Words with 4 letters',
  ///     ParameterizedSource.value([
  ///       'kiwi',
  ///       'bike',
  ///       'four',
  ///     ]),
  ///     (List<dynamic> values) {
  ///       final String input = values[0];
  ///
  ///       final actual = input.length;
  ///
  ///       expect(actual, 4);
  ///     },
  ///   );
  ///```
  factory ParameterizedSource.value(List<dynamic> values) =>
      ParameterizedSource._(values.map((e) => [e]).toList());

  static dynamic _tryParse(String input) {
    final source = input.trim();
    final emptyNullString = source.isEmpty ? null : source.replaceAll('\'', '').replaceAll('"', '');

    return int.tryParse(source) ?? double.tryParse(source) ?? _tryParseBool(source) ?? emptyNullString;
  }

  static bool? _tryParseBool(String input) {
    final source = input.toLowerCase();
    if (source == 'true') {
      return true;
    } else if (source == 'false') {
      return false;
    }
    return null;
  }
}
