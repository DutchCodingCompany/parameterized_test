/// Error thrown when TestParameters parameter count doesn't match amount of test values supplied for the test.
class ParameterCountError extends Error {
  ParameterCountError(this.expected, this.actual);

  final int expected;
  final int actual;

  @override
  String toString() => '''
          Expected: $expected parameters
          Actual: $actual parameters
          Supplied parameter count does not match selected parameterizedTest$expected.''';
}
