import 'package:parameterized_test/src/errors/stack_trace_extension.dart';
import 'package:stack_trace/stack_trace.dart';
import 'package:test/test.dart';

void main() {
  test('StackTrace with no other call then core or parameterized_test', () {
    final stackTrace = Trace.parse('''
#0      Object.noSuchMethod (dart:core-patch/object_patch.dart:38:5)
#1      _objectNoSuchMethod (dart:core-patch/object_patch.dart:85:9)
#2      Function._apply (dart:core-patch/function_patch.dart:11:71)
#3      Function.apply (dart:core-patch/function_patch.dart:35:12)
#4      ParameterizedTestImpl.call.<anonymous closure>.<anonymous closure> (package:parameterized_test/src/parameterized_test.dart:162:33)
#5      TestHelper.test (file:///parameterized_test/test/test_helpers.dart:31:9)
#6      ParameterizedTestImpl.call.<anonymous closure> (package:parameterized_test/src/parameterized_test.dart:158:16)
#7      TestHelper.test (file:///parameterized_test/test/test_helpers.dart:31:9)
#8      ParameterizedTestImpl.call (package:parameterized_test/src/parameterized_test.dart:140:11)
#9      main.<anonymous closure>.<anonymous closure>.<anonymous closure> (file:///parameterized_test/test/parameterized_test_test.dart:380:18)
#10     Throws.matchAsync (package:matcher/src/expect/throws_matcher.dart:86:23)
#11     _expect (package:matcher/src/expect/expect.dart:109:26)
#12     expect (package:matcher/src/expect/expect.dart:56:3)
#13     main.<anonymous closure>.<anonymous closure> (file:///parameterized_test/test/parameterized_test_test.dart:378:7)
#14     Declarer.test.<anonymous closure>.<anonymous closure> (package:test_api/src/backend/declarer.dart:215:19)
<asynchronous suspension>
#15     Declarer.test.<anonymous closure> (package:test_api/src/backend/declarer.dart:213:7)
<asynchronous suspension>
#16     Invoker._waitForOutstandingCallbacks.<anonymous closure> (package:test_api/src/backend/invoker.dart:258:9)
<asynchronous suspension>
  ''');

    final result = stackTrace.isInsideTestBody;

    expect(result, isFalse);
  });

  test(
    'StackTrace with multiple no other call then core or parameterized_test',
    () {
      final stackTrace = Trace.parse('''
#0      Object.noSuchMethod (dart:core-patch/object_patch.dart:38:5)
#1      _objectNoSuchMethod (dart:core-patch/object_patch.dart:85:9)
#2      Function._apply (dart:core-patch/function_patch.dart:11:71)
#3      Function.apply (dart:core-patch/function_patch.dart:35:12)
#4      ParameterizedTestImpl.call.<anonymous closure>.<anonymous closure> (package:parameterized_test/src/parameterized_test.dart:162:33)
#5      Object.noSuchMethod (dart:core-patch/object_patch.dart:38:5)
#6      _objectNoSuchMethod (dart:core-patch/object_patch.dart:85:9)
#7      Function._apply (dart:core-patch/function_patch.dart:11:71)
#8      Function.apply (dart:core-patch/function_patch.dart:35:12)
#9      ParameterizedTestImpl.call.<anonymous closure>.<anonymous closure> (package:parameterized_test/src/parameterized_test.dart:162:33)
  ''');

      final result = stackTrace.isInsideTestBody;

      expect(result, isFalse);
    },
  );

  test(
    'StackTrace with no function.apply call',
    () {
      final stackTrace = Trace.parse('''
#0      Object.noSuchMethod (dart:core-patch/object_patch.dart:38:5)
#1      _objectNoSuchMethod (dart:core-patch/object_patch.dart:85:9)
#2      ParameterizedTestImpl.call.<anonymous closure>.<anonymous closure> (package:parameterized_test/src/parameterized_test.dart:162:33)
#3      Object.noSuchMethod (dart:core-patch/object_patch.dart:38:5)
#4      _objectNoSuchMethod (dart:core-patch/object_patch.dart:85:9)
#5      ParameterizedTestImpl.call.<anonymous closure>.<anonymous closure> (package:parameterized_test/src/parameterized_test.dart:162:33)
  ''');

      final result = stackTrace.isInsideTestBody;

      expect(result, isFalse);
    },
  );

  test(
    'StackTrace with no parameterized_test call',
    () {
      final stackTrace = Trace.parse('''
#0      ParameterizedTestImpl.call.<anonymous closure>.<anonymous closure> (package:parameterized_test/src/parameterized_test.dart:162:33)
#1      ParameterizedTestImpl.call.<anonymous closure>.<anonymous closure> (package:parameterized_test/src/parameterized_test.dart:162:33)
''');

      final result = stackTrace.isInsideTestBody;

      expect(result, isFalse);
    },
  );

  test(
    'StackTrace with other call then core or parameterized_test '
    'before function.apply',
    () {
      final stackTrace = Trace.parse('''
#0      Object.noSuchMethod (dart:core-patch/object_patch.dart:38:5)
#1      _objectNoSuchMethod (dart:core-patch/object_patch.dart:85:9)
#2      main.<anonymous closure>.<anonymous closure>.<anonymous closure>.<anonymous closure> (file:///parameterized_test/test/parameterized_test_test.dart:490:31)
#3      Function._apply (dart:core-patch/function_patch.dart:11:71)
#4      Function.apply (dart:core-patch/function_patch.dart:35:12)
#5      ParameterizedTestImpl.call.<anonymous closure>.<anonymous closure> (package:parameterized_test/src/parameterized_test.dart:162:33)
  ''');

      final result = stackTrace.isInsideTestBody;

      expect(result, isTrue);
    },
  );

  test(
    'StackTrace with multiple other call then core or parameterized_test '
    'before function.apply',
    () {
      final stackTrace = Trace.parse('''
#0      Object.noSuchMethod (dart:core-patch/object_patch.dart:38:5)
#1      main.<anonymous closure>.<anonymous closure>.<anonymous closure>.<anonymous closure> (file:///parameterized_test/test/parameterized_test_test.dart:490:31)
#2      _objectNoSuchMethod (dart:core-patch/object_patch.dart:85:9)
#3      main.<anonymous closure>.<anonymous closure>.<anonymous closure>.<anonymous closure> (file:///parameterized_test/test/parameterized_test_test.dart:490:31)
#4      Function._apply (dart:core-patch/function_patch.dart:11:71)
#5      Function.apply (dart:core-patch/function_patch.dart:35:12)
#6      ParameterizedTestImpl.call.<anonymous closure>.<anonymous closure> (package:parameterized_test/src/parameterized_test.dart:162:33)
  ''');

      final result = stackTrace.isInsideTestBody;

      expect(result, isTrue);
    },
  );

  test(
    'StackTrace with multiple other call then core or parameterized_test '
    'before function.apply',
    () {
      final stackTrace = Trace.parse('''
#0      Object.noSuchMethod (dart:core-patch/object_patch.dart:38:5)
#1      main.<anonymous closure>.<anonymous closure>.<anonymous closure>.<anonymous closure> (file:///parameterized_test/test/parameterized_test_test.dart:490:31)
#2      Function._apply (dart:core-patch/function_patch.dart:11:71)
#3      Function.apply (dart:core-patch/function_patch.dart:35:12)
#4      _objectNoSuchMethod (dart:core-patch/object_patch.dart:85:9)
#5      main.<anonymous closure>.<anonymous closure>.<anonymous closure>.<anonymous closure> (file:///parameterized_test/test/parameterized_test_test.dart:490:31)
#6      Function._apply (dart:core-patch/function_patch.dart:11:71)
#7      Function.apply (dart:core-patch/function_patch.dart:35:12)
#8      ParameterizedTestImpl.call.<anonymous closure>.<anonymous closure> (package:parameterized_test/src/parameterized_test.dart:162:33)
  ''');

      final result = stackTrace.isInsideTestBody;

      expect(result, isTrue);
    },
  );

  test(
    'StackTrace with multiple other call then core or parameterized_test '
    'after function.apply',
    () {
      final stackTrace = Trace.parse('''
#0      Object.noSuchMethod (dart:core-patch/object_patch.dart:38:5)
#1      _objectNoSuchMethod (dart:core-patch/object_patch.dart:85:9)
#2      Function._apply (dart:core-patch/function_patch.dart:11:71)
#3      Function.apply (dart:core-patch/function_patch.dart:35:12)
#4      ParameterizedTestImpl.call.<anonymous closure>.<anonymous closure> (package:parameterized_test/src/parameterized_test.dart:162:33)
#5      main.<anonymous closure>.<anonymous closure>.<anonymous closure>.<anonymous closure> (file:///parameterized_test/test/parameterized_test_test.dart:490:31)
#6      main.<anonymous closure>.<anonymous closure>.<anonymous closure>.<anonymous closure> (file:///parameterized_test/test/parameterized_test_test.dart:490:31)
  ''');

      final result = stackTrace.isInsideTestBody;

      expect(result, isFalse);
    },
  );

  test('empty stack trace', () {
    const stackTrace = StackTrace.empty;

    final result = stackTrace.isInsideTestBody;

    expect(result, isFalse);
  });
}
