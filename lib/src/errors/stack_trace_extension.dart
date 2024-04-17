import 'package:stack_trace/stack_trace.dart';

/// Extension for [StackTrace] to determine if the stack trace is from within
/// a test
extension StackTraceExtension on StackTrace {
  /// Returns `true` if the stack trace is from within a test body
  bool get isInsideTestBody {
    final trace = Trace.from(this);

    // We are looking frames from within side Function.apply
    final frames = trace.frames.take(
      trace.frames.indexWhere(
        (f) => f.member == 'Function._apply',
      ),
    );

    return !frames.every(
      (f) =>
          f.package == 'parameterized_test' ||
          f.package == 'test_api' ||
          f.isCore,
    );
  }
}
