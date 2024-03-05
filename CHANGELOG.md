## 1.1.3
 - Added `CustomDescriptionBuilder` to build custom test description for all executed tests.
   For example:
   ```dart
   parameterizedTest2(
     'Test with custom description',
     [
      [1, 2],
      [3, 4],
     ],
     (int a, int b) => expect(a+b, isPositive),
     customDiscriptionBuilder: (groupDescription, index, values) => '🚀[$index] $groupDescription: <<${values.join('|')}>>',
   );
   ```
   
  Prints:
```
Test with custom description 🚀[1] Test with custom description: <<1|2>>
Test with custom description 🚀[2] Test with custom description: <<3|4>>
```

## 1.1.2
 - Added #13: String values are wrapped with quotes in test output. This makes it easier to see if a string value is empty or contains spaces.
 - Updated lints package
 - Fixed small lint issue

## 1.1.1
- Exported parameterizedGroup base and numeric and parameterizedTest from parameterized_test numeric functions.

## 1.1.0
 - Added separate numbered functions for `parameterizedTest` and `parameterizedGroup` specifying the number of arguments.
 - Fixes bug where async test weren't properly passed to the test framework.
 - Update to dart 3.

## 1.0.0

Major rework on `paramterized_test` which includes:

- DISCONTINUED `parameterized_source` package
    - DEPRECATED `ParameterizedSource.csv`
    - DEPRECATED `ParameterizedSource.value`
    - DEPRECATED `ParameterizedSource.values`
- DISCONTINUED `flutter_parameterized_test` package
- Added new TestParameters class for providing the test body to execute.The package has
  implementation for TestParameters support up to 10 arguments.
- Added extensions `withTestOptions` for providing test options to test values.
- Added `parameterizedGroup`.

## 1.0.0-rc2

- Added `parameterizedGroup`.

## 1.0.0-rc1

- DISCONTINUED `parameterized_source` package
    - DEPRECATED `ParameterizedSource.csv`
    - DEPRECATED `ParameterizedSource.value`
    - DEPRECATED `ParameterizedSource.values`
- DISCONTINUED `flutter_parameterized_test` package
- Added new TestParameters class for providing the test body to execute.The package has
  implementation for TestParameters support up to 10 arguments.
- Added extensions `withTestOptions` for providing test options to test values.

## 0.2.1

- Fixed issues with wrong dependencies

## 0.2.0

- Fixed some issues with seperate parameterized_test variances

## 0.1.0

- Created flutter variance of parameterized_test

## 0.0.5

- Updated some dependencies

## 0.0.4

- Fixed some formatting

## 0.0.3

- Fixed README markdown formatting for pub.dev

## 0.0.2

- Fixed dependency warnings for publishing

## 0.0.1

- Initial version.
