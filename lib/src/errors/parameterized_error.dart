/// {@template ParameterizedError}
/// Error for when the provided value(s) didn't match the function arguments
/// types or count.
/// {@endtemplate}
class ParameterizedError extends Error {
  /// {@macro ParameterizedError}
  ParameterizedError(this.message);

  /// Creates a [ParameterizedError] from a [TypeError].
  /// When arguments types don't match the function arguments types.
  factory ParameterizedError.forTypeError(List<dynamic> value, Function body) {
    final bodyClosure = extractFunctionArgumentsSignature(body.toString());

    return ParameterizedError(
      "Provided value(s) didn't match the function arguments types.\n"
      'Test values: $value\n'
      'Provided types: '
      '(${value.map((e) => e.runtimeType).join(', ')})\n'
      'Expected types: ($bodyClosure)',
    );
  }

  /// Creates a [ParameterizedError] from a [TypeError].
  /// When arguments count don't match the function arguments count.
  factory ParameterizedError.fromNoSuchMethodError(
    NoSuchMethodError e,
    List<dynamic> value,
  ) {
    final bodyClosure = extractFunctionArgumentsSignature(e.toString());
    final positionalArgumentsCount = ','.allMatches(bodyClosure).length + 1;

    return ParameterizedError(
      "Provided value(s) didn't match the function arguments count.\n"
      'Amount of provided values: ${value.length}\n'
      'Expected function arguments: $positionalArgumentsCount\n'
      'Test values: $value\n'
      'Provided types: '
      '(${value.map((e) => e.runtimeType).join(', ')})\n'
      'Expected types: ($bodyClosure)',
    );
  }

  /// Error message.
  final String message;

  /// Helper function to extract the function arguments signature from
  /// Exception string.
  static String extractFunctionArgumentsSignature(String body) {
    const closure = 'Closure: (';
    final closureIndex = body.indexOf(closure);
    final endIndex = body.indexOf(')', closureIndex);

    final bodyClosure = body.substring(closureIndex + closure.length, endIndex);

    return bodyClosure.replaceAll(RegExp('<(.*)>'), '');
  }

  @override
  String toString() {
    return message;
  }
}
