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

# 🧪 Parameterized test

Supercharge your Dart testing with **parameterized_test**! Built on top of the [dart test package](https://pub.dev/packages/test), this [JUnit ParameterizedTest](https://junit.org/junit5/docs/current/user-guide/#writing-tests-parameterized-tests) inspired package wrap around `group` and `test` to take your testing to the next level!

## Table of contents
* [Features](#features-)
* [Installation](#installation)
* [Usage](#usage)
* [Examples](#examples)
* [How it works](#how-it-works)
* [Additional information](#additional-information)

## Features ✨

- ✅ Run a test multiple times based on provide parameter list.
- ✅ Uses [dart test package](https://pub.dev/packages/test) under the hood.
- ✅ Type cast test parameters used in the tests.
- ✅ Include test options for parameter_test.
- ✅ Include test options per parameters.

- ❌ No CSV parsing is supported. Its only possible to use Lists with actual values.

## Installation

```yaml
dev_dependencies:
  parameterized_test: [latest-version]
```

## Usage

Instead of using `groups` or `test` you can now use `parameterizedTest` and supply it list of test parameters to use in the same test.
To specify the test body use `TestParametersX` that matches the same amount of test parameters for 1 test. For example when the test has 2 parameters `actual` and `expected` use `TestParameters2` for supplying the test body.
The package offers `TestParameters` classes up to 10 parameters. Instead of writing `TestParameters` completely it also possible to use `typedef`'s `p1`..`p10`.

## Examples

Example parameterizedTest with 1 parameter:

```dart
parameterizedTest(
  'Number are less than 4 tests',
  [
    1,
    2,
    3,
  ],
  p1((int number) {
    final result = number < 4;
    expect(result, true);
  }),
);
```

Example parameterizedTest with 2 parameters:

```dart
parameterizedTest(
  'Amount of letters tests',
  [
    ['kiwi', 4],
    ['apple', 5],
    ['banana', 6],
  ],
  p2((String word, int length) {
    expect(word.length, length);
  }),
);
```

or

```dart
parameterizedTest2(
  'Amount of letters tests',
  [
    ['kiwi', 4],
    ['apple', 5],
    ['banana', 6],
  ],
  (String word, int length) {
    expect(word.length, length);
  },
);
```

Example parameterizedTest with extra test options for a value:

```dart
parameterizedTest(
  'Amount of letters',
  [
    ['kiwi', 4],
    ['apple', 5],
    ['banana', 6].withTestOptions(skip: true),
  ],
  p2((String word, int length) {
    expect(word.length, length);
  }),
);
```

Example parameterizedTest with test enum values:

```dart
enum AwesomeEnum { such, woow, much, skill}

parameterizedTest(
  'Doge enum tests',
  AwesomeEnum.values,
  p1((AwesomeEnum doge) {
    final result = doge.name.length >= 4;
    expect(result, true);
  }),
);
```

## How it works

`parameterized_test` is basically a wrapper that executes a `group` test and loops over the provide `List` of test values. Each set of values is cast to the specified type inside the body. Which is wrapped inside a `test`.

```dart
parameterizedTest(
  'Amount of letters',
  [
    ['kiwi', 4],
    ['apple', 5],
    ['banana', 6],
  ],
  p2((String word, int length) {
    expect(word.length, length);
  }),
);
```

The above example roughly translates to:
```dart
group('Amount of letter', () {
  final testValues = [
    ['kiwi', 4],
    ['apple', 5],
    ['banana', 6],
  ];

  for (final testValue in testValues) {
    test(testValue.toString(), () {
      final String word = testValue[0] as String;
      final int length = testValue[1] as int;

      expect(word.length, length);
    });
  }
});
```

## Changing test description output
By default the test description contains the test value used within the tests. This can be override by using `customDescriptionBuilder`.

When normally running parameterized tests with description 'My parameterized test' and the values `[['first', 'second', true], ['third', 'fourth', false]]` the test description output looks something like this:
```
My parameterized test [ 'first', 'second', true ]
My parameterized test [ 'third', 'fourth', false ]
```

When defining a `customDescriptionBuilder` like this:
```dart
...
customDiscriptionBuilder: (groupDescription, index, values) => '🚀[$index] $groupDescription: <<${values.join('|')}>>',
...
```

The output will look like this:
```
My parameterized test 🚀[1] My parameterized test: <<first|second|true>>
My parameterized test 🚀[2] My parameterized test: <<third|fourth|false>>
```

>Note: the first 'My parameterized test' is because parameterized tests make use of a group test. Most IDE's will group this for you and only show the second part.

## Extending parameters

Currently the package supports `TestParameters` classes up to 10 arguments. If need to more arguments within a test than this is possible by implementing the `TestParameters` class.

For example:
```dart
class MyParameters<A1, A2> implements TestParameters {
  const MyParameters(this.body);

  @override
  final dynamic Function(A1, A2) body;

  @override
  final int count = 2;

  @override
  dynamic mapBody<R>(Iterable<R> values) {
    final A1 a1 = values.elementAt(0) as A1;
    final A2 a2 = values.elementAt(1) as A2;
    return body(a1, a2);
  }
}
```

## Additional information

Its just a simple wrapper to easily execute tests multiple times with different values. Feel free to
leave some feedback or open an pull request :)
