/// Error thrown when TestParameters parameter type doesn't match type of test value supplied for the test.
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
