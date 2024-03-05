import 'package:meta/meta.dart';
import 'package:test/test.dart';

import '../parameterized_test.dart';
import 'test_options/value_with_test_options.dart';

/// Parameterized test with 1 input arguments. See [parameterizedTest] for more info.
@isTestGroup
void parameterizedTest1<A1>(
  /// Test description.
  Object description,

  /// List of test values. For each values in the list a test will be executed.
  Iterable<dynamic> values,

  /// The test body which is executed for each test value.
  /// See [TestParameters] for more info on different bodies.
  dynamic Function(A1) body, {
  /// Provide a custom description builder which will build the description for all the test values test executed.
  CustomDescriptionBuilder? customDescriptionBuilder,
  dynamic Function()? setUp,

  /// Provide a tearDown function to the `group` test.
  dynamic Function()? tearDown,
  String? testOn,
  Timeout? timeout,
  dynamic skip,
  dynamic tags,
  Map<String, dynamic>? onPlatform,
  int? retry,
}) =>
    parameterizedTest(
      description,
      values,
      p1(body),
      customDescriptionBuilder: customDescriptionBuilder,
      setUp: setUp,
      tearDown: tearDown,
      testOn: testOn,
      timeout: timeout,
      skip: skip,
      tags: tags,
      onPlatform: onPlatform,
      retry: retry,
    );

/// Parameterized test with 2 input arguments. See [parameterizedTest] for more info.
@isTestGroup
void parameterizedTest2<A1, A2>(
  /// Test description.
  Object description,

  /// List of test values. For each values in the list a test will be executed.
  Iterable<dynamic> values,

  /// The test body which is executed for each test value.
  /// See [TestParameters] for more info on different bodies.
  dynamic Function(A1, A2) body, {
  /// Provide a custom description builder which will build the description for all the test values test executed.
  CustomDescriptionBuilder? customDescriptionBuilder,
  dynamic Function()? setUp,

  /// Provide a tearDown function to the `group` test.
  dynamic Function()? tearDown,
  String? testOn,
  Timeout? timeout,
  dynamic skip,
  dynamic tags,
  Map<String, dynamic>? onPlatform,
  int? retry,
}) =>
    parameterizedTest(
      description,
      values,
      p2(body),
      customDescriptionBuilder: customDescriptionBuilder,
      setUp: setUp,
      tearDown: tearDown,
      testOn: testOn,
      timeout: timeout,
      skip: skip,
      tags: tags,
      onPlatform: onPlatform,
      retry: retry,
    );

/// Parameterized test with 3 input arguments. See [parameterizedTest] for more info.
@isTestGroup
void parameterizedTest3<A1, A2, A3>(
  /// Test description.
  Object description,

  /// List of test values. For each values in the list a test will be executed.
  Iterable<dynamic> values,

  /// The test body which is executed for each test value.
  /// See [TestParameters] for more info on different bodies.
  dynamic Function(A1, A2, A3) body, {
  /// Provide a custom description builder which will build the description for all the test values test executed.
  CustomDescriptionBuilder? customDescriptionBuilder,
  dynamic Function()? setUp,

  /// Provide a tearDown function to the `group` test.
  dynamic Function()? tearDown,
  String? testOn,
  Timeout? timeout,
  dynamic skip,
  dynamic tags,
  Map<String, dynamic>? onPlatform,
  int? retry,
}) =>
    parameterizedTest(
      description,
      values,
      p3(body),
      customDescriptionBuilder: customDescriptionBuilder,
      setUp: setUp,
      tearDown: tearDown,
      testOn: testOn,
      timeout: timeout,
      skip: skip,
      tags: tags,
      onPlatform: onPlatform,
      retry: retry,
    );

/// Parameterized test with 4 input arguments. See [parameterizedTest] for more info.
@isTestGroup
void parameterizedTest4<A1, A2, A3, A4>(
  /// Test description.
  Object description,

  /// List of test values. For each values in the list a test will be executed.
  Iterable<dynamic> values,

  /// The test body which is executed for each test value.
  /// See [TestParameters] for more info on different bodies.
  dynamic Function(A1, A2, A3, A4) body, {
  /// Provide a custom description builder which will build the description for all the test values test executed.
  CustomDescriptionBuilder? customDescriptionBuilder,
  dynamic Function()? setUp,

  /// Provide a tearDown function to the `group` test.
  dynamic Function()? tearDown,
  String? testOn,
  Timeout? timeout,
  dynamic skip,
  dynamic tags,
  Map<String, dynamic>? onPlatform,
  int? retry,
}) =>
    parameterizedTest(
      description,
      values,
      p4(body),
      customDescriptionBuilder: customDescriptionBuilder,
      setUp: setUp,
      tearDown: tearDown,
      testOn: testOn,
      timeout: timeout,
      skip: skip,
      tags: tags,
      onPlatform: onPlatform,
      retry: retry,
    );

/// Parameterized test with 5 input arguments. See [parameterizedTest] for more info.
@isTestGroup
void parameterizedTest5<A1, A2, A3, A4, A5>(
  /// Test description.
  Object description,

  /// List of test values. For each values in the list a test will be executed.
  Iterable<dynamic> values,

  /// The test body which is executed for each test value.
  /// See [TestParameters] for more info on different bodies.
  dynamic Function(A1, A2, A3, A4, A5) body, {
  /// Provide a custom description builder which will build the description for all the test values test executed.
  CustomDescriptionBuilder? customDescriptionBuilder,
  dynamic Function()? setUp,

  /// Provide a tearDown function to the `group` test.
  dynamic Function()? tearDown,
  String? testOn,
  Timeout? timeout,
  dynamic skip,
  dynamic tags,
  Map<String, dynamic>? onPlatform,
  int? retry,
}) =>
    parameterizedTest(
      description,
      values,
      p5(body),
      customDescriptionBuilder: customDescriptionBuilder,
      setUp: setUp,
      tearDown: tearDown,
      testOn: testOn,
      timeout: timeout,
      skip: skip,
      tags: tags,
      onPlatform: onPlatform,
      retry: retry,
    );

/// Parameterized test with 6 input arguments. See [parameterizedTest] for more info.
@isTestGroup
void parameterizedTest6<A1, A2, A3, A4, A5, A6>(
  /// Test description.
  Object description,

  /// List of test values. For each values in the list a test will be executed.
  Iterable<dynamic> values,

  /// The test body which is executed for each test value.
  /// See [TestParameters] for more info on different bodies.
  dynamic Function(A1, A2, A3, A4, A5, A6) body, {
  /// Provide a custom description builder which will build the description for all the test values test executed.
  CustomDescriptionBuilder? customDescriptionBuilder,
  dynamic Function()? setUp,

  /// Provide a tearDown function to the `group` test.
  dynamic Function()? tearDown,
  String? testOn,
  Timeout? timeout,
  dynamic skip,
  dynamic tags,
  Map<String, dynamic>? onPlatform,
  int? retry,
}) =>
    parameterizedTest(
      description,
      values,
      p6(body),
      customDescriptionBuilder: customDescriptionBuilder,
      setUp: setUp,
      tearDown: tearDown,
      testOn: testOn,
      timeout: timeout,
      skip: skip,
      tags: tags,
      onPlatform: onPlatform,
      retry: retry,
    );

/// Parameterized test with 7 input arguments. See [parameterizedTest] for more info.
@isTestGroup
void parameterizedTest7<A1, A2, A3, A4, A5, A6, A7>(
  /// Test description.
  Object description,

  /// List of test values. For each values in the list a test will be executed.
  Iterable<dynamic> values,

  /// The test body which is executed for each test value.
  /// See [TestParameters] for more info on different bodies.
  dynamic Function(A1, A2, A3, A4, A5, A6, A7) body, {
  /// Provide a custom description builder which will build the description for all the test values test executed.
  CustomDescriptionBuilder? customDescriptionBuilder,
  dynamic Function()? setUp,

  /// Provide a tearDown function to the `group` test.
  dynamic Function()? tearDown,
  String? testOn,
  Timeout? timeout,
  dynamic skip,
  dynamic tags,
  Map<String, dynamic>? onPlatform,
  int? retry,
}) =>
    parameterizedTest(
      description,
      values,
      p7(body),
      customDescriptionBuilder: customDescriptionBuilder,
      setUp: setUp,
      tearDown: tearDown,
      testOn: testOn,
      timeout: timeout,
      skip: skip,
      tags: tags,
      onPlatform: onPlatform,
      retry: retry,
    );

/// Parameterized test with 8 input arguments. See [parameterizedTest] for more info.
@isTestGroup
void parameterizedTest8<A1, A2, A3, A4, A5, A6, A7, A8>(
  /// Test description.
  Object description,

  /// List of test values. For each values in the list a test will be executed.
  Iterable<dynamic> values,

  /// The test body which is executed for each test value.
  /// See [TestParameters] for more info on different bodies.
  dynamic Function(A1, A2, A3, A4, A5, A6, A7, A8) body, {
  /// Provide a custom description builder which will build the description for all the test values test executed.
  CustomDescriptionBuilder? customDescriptionBuilder,
  dynamic Function()? setUp,

  /// Provide a tearDown function to the `group` test.
  dynamic Function()? tearDown,
  String? testOn,
  Timeout? timeout,
  dynamic skip,
  dynamic tags,
  Map<String, dynamic>? onPlatform,
  int? retry,
}) =>
    parameterizedTest(
      description,
      values,
      p8(body),
      customDescriptionBuilder: customDescriptionBuilder,
      setUp: setUp,
      tearDown: tearDown,
      testOn: testOn,
      timeout: timeout,
      skip: skip,
      tags: tags,
      onPlatform: onPlatform,
      retry: retry,
    );

/// Parameterized test with 9 input arguments. See [parameterizedTest] for more info.
@isTestGroup
void parameterizedTest9<A1, A2, A3, A4, A5, A6, A7, A8, A9>(
  /// Test description.
  Object description,

  /// List of test values. For each values in the list a test will be executed.
  Iterable<dynamic> values,

  /// The test body which is executed for each test value.
  /// See [TestParameters] for more info on different bodies.
  dynamic Function(A1, A2, A3, A4, A5, A6, A7, A8, A9) body, {
  /// Provide a custom description builder which will build the description for all the test values test executed.
  CustomDescriptionBuilder? customDescriptionBuilder,
  dynamic Function()? setUp,

  /// Provide a tearDown function to the `group` test.
  dynamic Function()? tearDown,
  String? testOn,
  Timeout? timeout,
  dynamic skip,
  dynamic tags,
  Map<String, dynamic>? onPlatform,
  int? retry,
}) =>
    parameterizedTest(
      description,
      values,
      p9(body),
      customDescriptionBuilder: customDescriptionBuilder,
      setUp: setUp,
      tearDown: tearDown,
      testOn: testOn,
      timeout: timeout,
      skip: skip,
      tags: tags,
      onPlatform: onPlatform,
      retry: retry,
    );

/// Parameterized test with 10 input arguments. See [parameterizedTest] for more info.
@isTestGroup
void parameterizedTest10<A1, A2, A3, A4, A5, A6, A7, A8, A9, A10>(
  /// Test description.
  Object description,

  /// List of test values. For each values in the list a test will be executed.
  Iterable<dynamic> values,

  /// The test body which is executed for each test value.
  /// See [TestParameters] for more info on different bodies.
  dynamic Function(A1, A2, A3, A4, A5, A6, A7, A8, A9, A10) body, {
  /// Provide a custom description builder which will build the description for all the test values test executed.
  CustomDescriptionBuilder? customDescriptionBuilder,
  dynamic Function()? setUp,

  /// Provide a tearDown function to the `group` test.
  dynamic Function()? tearDown,
  String? testOn,
  Timeout? timeout,
  dynamic skip,
  dynamic tags,
  Map<String, dynamic>? onPlatform,
  int? retry,
}) =>
    parameterizedTest(
      description,
      values,
      p10(body),
      customDescriptionBuilder: customDescriptionBuilder,
      setUp: setUp,
      tearDown: tearDown,
      testOn: testOn,
      timeout: timeout,
      skip: skip,
      tags: tags,
      onPlatform: onPlatform,
      retry: retry,
    );
