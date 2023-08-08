//ignore_for_file: camel_case_types

import 'util/cast_helpers.dart';

/// alias for [TestParameters1].
typedef p1<A1> = TestParameters1<A1>;

/// alias for [TestParameters2].
typedef p2<A1, A2> = TestParameters2<A1, A2>;

/// alias for [TestParameters3].
typedef p3<A1, A2, A3> = TestParameters3<A1, A2, A3>;

/// alias for [TestParameters4].
typedef p4<A1, A2, A3, A4> = TestParameters4<A1, A2, A3, A4>;

/// alias for [TestParameters5].
typedef p5<A1, A2, A3, A4, A5> = TestParameters5<A1, A2, A3, A4, A5>;

/// alias for [TestParameters6].
typedef p6<A1, A2, A3, A4, A5, A6> = TestParameters6<A1, A2, A3, A4, A5, A6>;

/// alias for [TestParameters7].
typedef p7<A1, A2, A3, A4, A5, A6, A7>
    = TestParameters7<A1, A2, A3, A4, A5, A6, A7>;

/// alias for [TestParameters8].
typedef p8<A1, A2, A3, A4, A5, A6, A7, A8>
    = TestParameters8<A1, A2, A3, A4, A5, A6, A7, A8>;

/// alias for [TestParameters9].
typedef p9<A1, A2, A3, A4, A5, A6, A7, A8, A9>
    = TestParameters9<A1, A2, A3, A4, A5, A6, A7, A8, A9>;

/// alias for [TestParameters10].
typedef p10<A1, A2, A3, A4, A5, A6, A7, A8, A9, A10>
    = TestParameters10<A1, A2, A3, A4, A5, A6, A7, A8, A9, A10>;

/// Provides a interface for implementing test body classes.
abstract interface class TestParameters {
  abstract final Function body;
  abstract final int count;

  void mapBody<R>(Iterable<R> values);
}

/// Test body class that handles 1 test parameter value.
/// For example:
/// ```dart
/// TestParameter1((int number){
///   // Do some test logic here.
/// });
/// ```
class TestParameters1<A1> implements TestParameters {
  const TestParameters1(this.body);

  @override
  final dynamic Function(A1) body;

  @override
  final int count = 1;

  @override
  void mapBody<R>(Iterable<R> values) {
    final A1 a1 = castElementAt(values, 0);
    body(a1);
  }
}

/// Test body class that handles 2 test parameter values.
/// For example:
/// ```dart
/// TestParameter2((int number, String word){
///   // Do some test logic here.
/// });
/// ```
class TestParameters2<A1, A2> implements TestParameters {
  const TestParameters2(this.body);

  @override
  final dynamic Function(A1 a1, A2 a2) body;

  @override
  final int count = 2;

  @override
  void mapBody<R>(Iterable<R> values) {
    final A1 a1 = castElementAt(values, 0);
    final A2 a2 = castElementAt(values, 1);
    body(a1, a2);
  }
}

/// Test body class that handles 3 test parameter values.
/// For example:
/// ```dart
/// TestParameter1((int number, String word, bool isRight){
///   // Do some test logic here.
/// });
/// ```
class TestParameters3<A1, A2, A3> implements TestParameters {
  const TestParameters3(this.body);

  @override
  final dynamic Function(A1, A2, A3) body;

  @override
  final int count = 3;

  @override
  void mapBody<R>(Iterable<R> values) {
    final A1 a1 = castElementAt(values, 0);
    final A2 a2 = castElementAt(values, 1);
    final A3 a3 = castElementAt(values, 2);
    body(a1, a2, a3);
  }
}

/// Test body class that handles 4 test parameter values.
/// For example:
/// ```dart
/// TestParameter1((int number, String word, bool isRight, double decimal){
///   // Do some test logic here.
/// });
/// ```
class TestParameters4<A1, A2, A3, A4> implements TestParameters {
  const TestParameters4(this.body);

  @override
  final dynamic Function(A1, A2, A3, A4) body;

  @override
  final int count = 4;

  @override
  void mapBody<R>(Iterable<R> values) {
    final A1 a1 = castElementAt(values, 0);
    final A2 a2 = castElementAt(values, 1);
    final A3 a3 = castElementAt(values, 2);
    final A4 a4 = castElementAt(values, 3);
    body(a1, a2, a3, a4);
  }
}

/// Test body class that handles 5 test parameter values.
/// For example:
/// ```dart
/// TestParameter1((int number, String word, bool isRight, double decimal, MyClass myClass){
///   // Do some test logic here.
/// });
/// ```
class TestParameters5<A1, A2, A3, A4, A5> implements TestParameters {
  const TestParameters5(this.body);

  @override
  final dynamic Function(A1, A2, A3, A4, A5) body;

  @override
  final int count = 5;

  @override
  void mapBody<R>(Iterable<R> values) {
    final A1 a1 = castElementAt(values, 0);
    final A2 a2 = castElementAt(values, 1);
    final A3 a3 = castElementAt(values, 2);
    final A4 a4 = castElementAt(values, 3);
    final A5 a5 = castElementAt(values, 4);
    body(a1, a2, a3, a4, a5);
  }
}

/// Test body class that handles 6 test parameter values.
/// For example:
/// ```dart
/// TestParameter1((int number, String word, bool isRight, double decimal, MyClass myClass, MyClass myClass2){
///   // Do some test logic here.
/// });
/// ```
class TestParameters6<A1, A2, A3, A4, A5, A6> implements TestParameters {
  const TestParameters6(this.body);

  @override
  final dynamic Function(A1, A2, A3, A4, A5, A6) body;

  @override
  final int count = 6;

  @override
  void mapBody<R>(Iterable<R> values) {
    final A1 a1 = castElementAt(values, 0);
    final A2 a2 = castElementAt(values, 1);
    final A3 a3 = castElementAt(values, 2);
    final A4 a4 = castElementAt(values, 3);
    final A5 a5 = castElementAt(values, 4);
    final A6 a6 = castElementAt(values, 5);
    body(a1, a2, a3, a4, a5, a6);
  }
}

/// Test body class that handles 7 test parameter values.
/// For example:
/// ```dart
/// TestParameter1((int number, String word, bool isRight, double decimal, MyClass myClass, MyClass myClass2, MyClass myClass3){
///   // Do some test logic here.
/// });
/// ```
class TestParameters7<A1, A2, A3, A4, A5, A6, A7> implements TestParameters {
  const TestParameters7(this.body);

  @override
  final dynamic Function(A1, A2, A3, A4, A5, A6, A7) body;

  @override
  final int count = 7;

  @override
  void mapBody<R>(Iterable<R> values) {
    final A1 a1 = castElementAt(values, 0);
    final A2 a2 = castElementAt(values, 1);
    final A3 a3 = castElementAt(values, 2);
    final A4 a4 = castElementAt(values, 3);
    final A5 a5 = castElementAt(values, 4);
    final A6 a6 = castElementAt(values, 5);
    final A7 a7 = castElementAt(values, 6);
    body(a1, a2, a3, a4, a5, a6, a7);
  }
}

/// Test body class that handles 8 test parameter values.
/// For example:
/// ```dart
/// TestParameter1((int number, String word, bool isRight, double decimal, MyClass myClass, MyClass myClass2, MyClass myClass3, MyClass myClass4){
///   // Do some test logic here.
/// });
/// ```
class TestParameters8<A1, A2, A3, A4, A5, A6, A7, A8>
    implements TestParameters {
  const TestParameters8(this.body);

  @override
  final dynamic Function(A1, A2, A3, A4, A5, A6, A7, A8) body;

  @override
  final int count = 8;

  @override
  void mapBody<R>(Iterable<R> values) {
    final A1 a1 = castElementAt(values, 0);
    final A2 a2 = castElementAt(values, 1);
    final A3 a3 = castElementAt(values, 2);
    final A4 a4 = castElementAt(values, 3);
    final A5 a5 = castElementAt(values, 4);
    final A6 a6 = castElementAt(values, 5);
    final A7 a7 = castElementAt(values, 6);
    final A8 a8 = castElementAt(values, 7);
    body(a1, a2, a3, a4, a5, a6, a7, a8);
  }
}

/// Test body class that handles 9 test parameter values.
/// For example:
/// ```dart
/// TestParameter1((int number, String word, bool isRight, double decimal, MyClass myClass, MyClass myClass2, MyClass myClass3, MyClass myClass4, MyClass myClass5){
///   // Do some test logic here.
/// });
/// ```
class TestParameters9<A1, A2, A3, A4, A5, A6, A7, A8, A9>
    implements TestParameters {
  const TestParameters9(this.body);

  @override
  final dynamic Function(A1, A2, A3, A4, A5, A6, A7, A8, A9) body;

  @override
  final int count = 9;

  @override
  void mapBody<R>(Iterable<R> values) {
    final A1 a1 = castElementAt(values, 0);
    final A2 a2 = castElementAt(values, 1);
    final A3 a3 = castElementAt(values, 2);
    final A4 a4 = castElementAt(values, 3);
    final A5 a5 = castElementAt(values, 4);
    final A6 a6 = castElementAt(values, 5);
    final A7 a7 = castElementAt(values, 6);
    final A8 a8 = castElementAt(values, 7);
    final A9 a9 = castElementAt(values, 8);
    body(a1, a2, a3, a4, a5, a6, a7, a8, a9);
  }
}

/// Test body class that handles 10 test parameter values.
/// For example:
/// ```dart
/// TestParameter1((int number, String word, bool isRight, double decimal, MyClass myClass, MyClass myClass2, MyClass myClass3, MyClass myClass4, MyClass myClass5, MyClass myClass6){
///   // Do some test logic here.
/// });
/// ```
class TestParameters10<A1, A2, A3, A4, A5, A6, A7, A8, A9, A10>
    implements TestParameters {
  const TestParameters10(this.body);

  @override
  final dynamic Function(A1, A2, A3, A4, A5, A6, A7, A8, A9, A10) body;

  @override
  final int count = 10;

  @override
  void mapBody<R>(Iterable<R> values) {
    final A1 a1 = castElementAt(values, 0);
    final A2 a2 = castElementAt(values, 1);
    final A3 a3 = castElementAt(values, 2);
    final A4 a4 = castElementAt(values, 3);
    final A5 a5 = castElementAt(values, 4);
    final A6 a6 = castElementAt(values, 5);
    final A7 a7 = castElementAt(values, 6);
    final A8 a8 = castElementAt(values, 7);
    final A9 a9 = castElementAt(values, 8);
    final A10 a10 = castElementAt(values, 9);
    body(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
  }
}
