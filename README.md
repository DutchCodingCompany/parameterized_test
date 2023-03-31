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

Simple package that helps with executing parameterized tests. Inspired
by [JUnit ParameterizedTest](https://junit.org/junit5/docs/current/user-guide/#writing-tests-parameterized-tests)
. This package is a wrapper around `groups` and `test`.

## Features

- Run run a test multiple times based on provide parameter list.
- Type cast test parameters used in the tests.
- Include test options parameters

## Getting started

Include `parameterized_test` in
your projects `pubspec.yaml`.

## Usage

Instead of using `groups` or `test` you can now use `parameterizedTest` and supply it with multiple
test parameters.

Example parameterizedTest with 2 parameters:

```dart
parameterizedTest
('Amount of letters',
[
['kiwi', 4],
['apple', 5],
['banana', 6],
],
p2((String word, int length) {
expect(word.length, length);
})
,
);
```

Example parameterizedTest with extra test options for a value:

```dart
parameterizedTest
('Amount of letters',
[
['kiwi', 4],
['apple', 5],
[
'banana
'
,
6
]
    .withTestOptions(skip: true),
],
p2((String word, int length) {
expect(word.length, length);
})
,
);
```

## Additional information

Its just a simple wrapper to easily execute tests multiple times with different values. Feel free to leave some feedback or open an pull request :)