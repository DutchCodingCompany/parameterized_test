class ParameterizedError extends Error {
  final String message;

  ParameterizedError(this.message);

  factory ParameterizedError.fromTypeError(
    TypeError e,
    List<dynamic> value,
    Function body,
  ) {
    final bodyClosure = _extractFunctionArgumentsSignature(body.toString());

    return ParameterizedError(
        "Provided value(s) didn't match the function arguments types.\n"
        'Test values: $value\n'
        'Provided types: '
        '(${value.map((e) => e.runtimeType).join(', ')})\n'
        'Expected types: ($bodyClosure)');
  }

  factory ParameterizedError.fromNoSuchMethodError(
      NoSuchMethodError e, List<dynamic> value, Function body) {
    final bodyClosure = _extractFunctionArgumentsSignature(e.toString());
    final positionalArgumentsCount = ','.allMatches(bodyClosure).length + 1;

    return ParameterizedError(
        "Provided value(s) didn't match the function arguments count.\n"
        'Amount of provided values: ${value.length}\n'
        'Expected function arguments: $positionalArgumentsCount\n'
        'Test values: $value\n'
        'Provided types: '
        '(${value.map((e) => e.runtimeType).join(', ')})\n'
        'Expected types: ($bodyClosure)');
  }

  static String _extractFunctionArgumentsSignature(String body) {
    const closure = 'Closure: (';
    final closureIndex = body.indexOf(closure);
    final endIndex = body.indexOf(')', closureIndex);

    final bodyClosure = body.substring(
      closureIndex + closure.length,
      endIndex,
    );

    return bodyClosure.replaceAll(RegExp(r'<(.*)>'), '');
  }

  @override
  String toString() {
    return message;
  }
}
