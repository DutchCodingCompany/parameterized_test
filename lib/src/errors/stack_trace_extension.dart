import 'package:stack_trace/stack_trace.dart';

/// Extension for [StackTrace] to determine if the stack trace is from within
/// a test
extension StackTraceExtension on StackTrace {
  /// Returns `true` if the stack trace is from within a test body
  bool get isInsideTestBody {
    final trace = Trace.from(this);

    // We are looking for frames from the body of the supplied test function.
    int index = 0;
    bool found = false;
    while (!found) {
      index = trace.frames.indexWhere(
        (f) => f.package == 'parameterized_test',
        index + 1,
      );
      if (index <= 0) {
        // If we can't find the parameterized_test package,
        // something went really wrong ;)
        // But we can't determine if it's from a test body
        return false;
      } else {
        found = trace.frames[index - 1].member == 'Function.apply';
      }
    }

    final frames = trace.frames.take(index).toList();

    return !frames.every(
      (f) => f.package == 'parameterized_test' || f.isCore,
    );
  }
}
