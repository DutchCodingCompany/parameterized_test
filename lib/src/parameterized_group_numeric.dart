import 'package:meta/meta.dart';
import 'package:test/test.dart';

import '../parameterized_test.dart';
import 'parameterized_group_base.dart';

/// Parameterized group with 1 input arguments. See [parameterizedGroup] for more info.
@isTestGroup
void parameterizedGroup1<A1>(
  /// Group description.
  Object description,

  /// List of group values. For each values in the list a group test will be executed.
  Iterable<dynamic> values,

  /// The test body which is executed for each group value.
  /// See [TestParameters] for more info on different bodies.
  dynamic Function(A1) body, {
  dynamic Function()? setUp,

  /// Provide a tearDown function to the `group` test.
  dynamic Function()? tearDown,
  String? testOn,
  Timeout? timeout,
  dynamic skip,
  dynamic tags,
  Map<String, dynamic>? onPlatform,
  int? retry,
})=>
    parameterizedGroup(
      description,
      values,
      p1(body),
      setUp: setUp,
      tearDown: tearDown,
      testOn: testOn,
      timeout: timeout,
      skip: skip,
      tags: tags,
      onPlatform: onPlatform,
      retry: retry,
    );


/// Parameterized group with 2 input arguments. See [parameterizedGroup] for more info.
@isTestGroup
void parameterizedGroup2<A1, A2>(
  /// Group description.
  Object description,

  /// List of group values. For each values in the list a group test will be executed.
  Iterable<dynamic> values,

  /// The test body which is executed for each group value.
  /// See [TestParameters] for more info on different bodies.
  dynamic Function(A1, A2) body, {
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
    parameterizedGroup(
      description,
      values,
      p2(body),
      setUp: setUp,
      tearDown: tearDown,
      testOn: testOn,
      timeout: timeout,
      skip: skip,
      tags: tags,
      onPlatform: onPlatform,
      retry: retry,
    );

/// Parameterized group with 3 input arguments. See [parameterizedGroup] for more info.
@isTestGroup
void parameterizedGroup3<A1, A2, A3>(
  /// Group description.
  Object description,

  /// List of group values. For each values in the list a group test will be executed.
  Iterable<dynamic> values,

  /// The test body which is executed for each group value.
  /// See [TestParameters] for more info on different bodies.
  dynamic Function(A1, A2, A3) body, {
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
    parameterizedGroup(
      description,
      values,
      p3(body),
      setUp: setUp,
      tearDown: tearDown,
      testOn: testOn,
      timeout: timeout,
      skip: skip,
      tags: tags,
      onPlatform: onPlatform,
      retry: retry,
    );


/// Parameterized group with 4 input arguments. See [parameterizedGroup] for more info.
@isTestGroup
void parameterizedGroup4<A1, A2, A3, A4>(
  /// Group description.
  Object description,

  /// List of group values. For each values in the list a group test will be executed.
  Iterable<dynamic> values,

  /// The test body which is executed for each group value.
  /// See [TestParameters] for more info on different bodies.
  dynamic Function(A1, A2, A3, A4) body, {
  dynamic Function()? setUp,

  /// Provide a tearDown function to the `group` test.
  dynamic Function()? tearDown,
  String? testOn,
  Timeout? timeout,
  dynamic skip,
  dynamic tags,
  Map<String, dynamic>? onPlatform,
  int? retry,
})=>
    parameterizedGroup(
      description,
      values,
      p4(body),
      setUp: setUp,
      tearDown: tearDown,
      testOn: testOn,
      timeout: timeout,
      skip: skip,
      tags: tags,
      onPlatform: onPlatform,
      retry: retry,
    );


/// Parameterized group with 5 input arguments. See [parameterizedGroup] for more info.
@isTestGroup
void parameterizedGroup5<A1, A2, A3, A4, A5>(
  /// Group description.
  Object description,

  /// List of group values. For each values in the list a group test will be executed.
  Iterable<dynamic> values,

  /// The test body which is executed for each group value.
  /// See [TestParameters] for more info on different bodies.
  dynamic Function(A1, A2, A3, A4, A5) body, {
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
    parameterizedGroup(
      description,
      values,
      p5(body),
      setUp: setUp,
      tearDown: tearDown,
      testOn: testOn,
      timeout: timeout,
      skip: skip,
      tags: tags,
      onPlatform: onPlatform,
      retry: retry,
    );


/// Parameterized group with 6 input arguments. See [parameterizedGroup] for more info.
@isTestGroup
void parameterizedGroup6<A1, A2, A3, A4, A5, A6>(
  /// Group description.
  Object description,

  /// List of group values. For each values in the list a group test will be executed.
  Iterable<dynamic> values,

  /// The test body which is executed for each group value.
  /// See [TestParameters] for more info on different bodies.
  dynamic Function(A1, A2, A3, A4, A5, A6) body, {
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
    parameterizedGroup(
      description,
      values,
      p6(body),
      setUp: setUp,
      tearDown: tearDown,
      testOn: testOn,
      timeout: timeout,
      skip: skip,
      tags: tags,
      onPlatform: onPlatform,
      retry: retry,
    );


/// Parameterized group with 7 input arguments. See [parameterizedGroup] for more info.
@isTestGroup
void parameterizedGroup7<A1, A2, A3, A4, A5, A6, A7>(
  /// Group description.
  Object description,

  /// List of group values. For each values in the list a group test will be executed.
  Iterable<dynamic> values,

  /// The test body which is executed for each group value.
  /// See [TestParameters] for more info on different bodies.
  dynamic Function(A1, A2, A3, A4, A5, A6, A7) body, {
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
    parameterizedGroup(
      description,
      values,
      p7(body),
      setUp: setUp,
      tearDown: tearDown,
      testOn: testOn,
      timeout: timeout,
      skip: skip,
      tags: tags,
      onPlatform: onPlatform,
      retry: retry,
    );

/// Parameterized group with 8 input arguments. See [parameterizedGroup] for more info.
@isTestGroup
void parameterizedGroup8<A1, A2, A3, A4, A5, A6, A7, A8>(
    /// Group description.
    Object description,

    /// List of group values. For each values in the list a group test will be executed.
    Iterable<dynamic> values,

    /// The test body which is executed for each group value.
    /// See [TestParameters] for more info on different bodies.
    dynamic Function(A1, A2, A3, A4, A5, A6, A7, A8) body, {
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
    parameterizedGroup(
      description,
      values,
      p8(body),
      setUp: setUp,
      tearDown: tearDown,
      testOn: testOn,
      timeout: timeout,
      skip: skip,
      tags: tags,
      onPlatform: onPlatform,
      retry: retry,
    );

/// Parameterized group with 9 input arguments. See [parameterizedGroup] for more info.
@isTestGroup
void parameterizedGroup9<A1, A2, A3, A4, A5, A6, A7, A8, A9>(
    /// Group description.
    Object description,

    /// List of group values. For each values in the list a group test will be executed.
    Iterable<dynamic> values,

    /// The test body which is executed for each group value.
    /// See [TestParameters] for more info on different bodies.
    dynamic Function(A1, A2, A3, A4, A5, A6, A7, A8, A9) body, {
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
    parameterizedGroup(
      description,
      values,
      p9(body),
      setUp: setUp,
      tearDown: tearDown,
      testOn: testOn,
      timeout: timeout,
      skip: skip,
      tags: tags,
      onPlatform: onPlatform,
      retry: retry,
    );

/// Parameterized group with 10 input arguments. See [parameterizedGroup] for more info.
@isTestGroup
void parameterizedGroup10<A1, A2, A3, A4, A5, A6, A7, A8, A9, A10>(
    /// Group description.
    Object description,

    /// List of group values. For each values in the list a group test will be executed.
    Iterable<dynamic> values,

    /// The test body which is executed for each group value.
    /// See [TestParameters] for more info on different bodies.
    dynamic Function(A1, A2, A3, A4, A5, A6, A7, A8, A9, A10) body, {
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
    parameterizedGroup(
      description,
      values,
      p10(body),
      setUp: setUp,
      tearDown: tearDown,
      testOn: testOn,
      timeout: timeout,
      skip: skip,
      tags: tags,
      onPlatform: onPlatform,
      retry: retry,
    );