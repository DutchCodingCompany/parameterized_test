class ParameterTypeError extends Error {
  ParameterTypeError(this.expected, this.actual);

  final Type expected;
  final Type actual;

  @override
  String toString() => '''
        Expected: $expected
        Actual: $actual
        Supplied test value type does not match parameter method type.
      ''';
}
