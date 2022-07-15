<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

# Parameterized test

Simple package that helps with executing parameterized tests. Inspired by [JUnit ParameterizedTest CsvValues](https://junit.org/junit5/docs/current/user-guide/#writing-tests-parameterized-tests-sources-CsvSource). This package is a wrapper around `groups` and `test`.

## Features

This package helps executing a test multiple times with different parameters.
Currently parameters can be specified as:
 - ParameterizedSource.csv
 - ParameterizedSource.value
 - ParameterizedSource.values

When using `ParameterizedSource.csv` the library tries to parse the values to `int`, `double`, `bool` or `String?`. If the csv value contains a empty string it will be parsed to null.
This parsing can be escaped by wrapping in the values in `'` or `"`.

For example: 

|Input | Output|
|------|-------|
|`'banana, 4, apple'`|`'banana'`, `4`, `'apple'`|
|`'banana, 4, '`|`'banana'`, `4`, `null`|
|`'banana, "4", apple'`|`'banana'`, `'4'`, `'apple'`|
|`'banana, 4, ""'`|`'banana'`, `4`, `''`|

## Getting started

Include `parameterized_test` or when using `flutter_test` include `flutter_parameterized_test`  in
your projects `pubspec.yaml`.

## Usage

Instead of using `groups` or `test` you can now use `parameterizedTest` and supply it with multiple test parameters.

Csv source example:
```dart
parameterizedTest(
  'Amount of letters',
  ParameterizedSource.csv([
    'kiwi, 4',
    'apple, 5',
    'banana, 6',
  ]),
  (List<dynamic> values) {
    final String input = values[0];
    final expected = values[1];

    final actual = input.length;

    expect(actual, expected);
  },
);
```

Values source example:
```dart
  parameterizedTest(
    'Amount of letters',
    ParameterizedSource.values([
      ['kiwi', 4],
      ['apple', 5],
      ['banana', 6],
    ]),
    (List<dynamic> values) {
      final String input = values[0];
      final expected = values[1];

      final actual = input.length;

      expect(actual, expected);
    },
  );
```

## Additional information

Its just a simple wrapper to easily execute tests multiple times with different values. Feel free to leave some feedback or open an pull request :)