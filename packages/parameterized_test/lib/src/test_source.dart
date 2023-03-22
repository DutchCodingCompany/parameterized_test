import 'test_options/group_test_options.dart';
import 'test_options/value_with_test_options.dart';

abstract class TestSource<T> {
  abstract final Iterable<ValueWithTestOptions<T>> _values;
  abstract final GroupTestOptions _groupTestOptions;

  void executeTests<A1>(
    void Function(A1 value) body,
  );

  void executeTests2<A1, A2>(
    void Function(A1 value, A2 value2) body,
  );

  void executeTests3<A1, A2, A3>(
    void Function(A1 value, A2 value2, A3 value3) body,
  );

  void executeTests4<A1, A2, A3, A4>(
    void Function(A1 value, A2 value2, A3 value3, A4 value4) body,
  );

  void executeTests5<A1, A2, A3, A4, A5>(
    void Function(A1 value, A2 value2, A3 value3, A4 value4, A5 value5) body,
  );

  void executeTests6<A1, A2, A3, A4, A5, A6>(
    void Function(A1 value, A2 value2, A3 value3, A4 value4, A5 value5, A6 value6) body,
  );
}
