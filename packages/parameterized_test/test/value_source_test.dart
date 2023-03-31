// import 'package:parameterized_test/src/test_options/group_test_options.dart';
// import 'package:parameterized_test/src/value_source.dart';
// import 'package:test/test.dart';
//
// import 'test_helpers.dart';
//
// void main() {
//   group('ValueSource tests', () {
//     late GroupTestOptions mockOptions;
//
//     setUp(() {
//       mockOptions = MockGroupOptions('mockOptions');
//     });
//
//     test('body gets executed with value', () {
//       bool isExecuted = false;
//       final source = ValueSource([MockValueWithOptions([1]),2,3], mockOptions, MockTestOptions());
//
//       List<int> resulValues = [];
//
//       source.executeTests((value) {
//         resulValues.add(value);
//         isExecuted = true;
//       });
//
//       expect(resulValues, [1,2,3]);
//       expect(isExecuted, true);
//     });
//   });
// }
//
