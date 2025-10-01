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
- [Features](#features-)
- [Installation](#installation-)
- [Usage](#usage-)
- [Examples](#examples-)
- [Additional information](#additional-information-)

## Features ✨

- ✅ Run a test multiple times based on provided parameter list.
- ✅ Built on top of [dart test package](https://pub.dev/packages/test).
- ✅ Type cast test parameters used in the tests.
- ✅ Include test options for parameter_test.
- ✅ Include test options per parameter.

## Installation 🛠

```yaml
dev_dependencies:
  parameterized_test: [latest-version]
```

## Usage ⚡️

Instead of creating a `group` test with multiple of the same `test` and different parameters, you can now use `parameterizedTest` and supply it list of test parameters to run the same test with multiple times.
Specifying a parameterized test is almost the same as normal test. It has all the same parameters as a normal test like: `skip` or `testOn` etc. 
The only difference is that you need to provide a list of test values and a function that takes the same amount of arguments as the test values.

For example:
```dart
parameterizedTest(
  'Fruit name matches length',
  // List of values to test
  [
  // parameters for the test
    ['kiwi', 4],
    ['apple', 5],
    ['banana', 6],
    ['pineapple', 9],
  ],
  // Test function accepting the provided parameters
  (String fruit, int length) {
    expect(fruit.length, length);
  },
);
```
This `parameterizedTest` will create a `group` with 4 `test` inside it. Each test will run the test function with the provided parameters.
```
- Fruit name matches length     (group)
    - [ 'kiwi', 4 ]             (test)
    - [ 'apple', 5 ]            (test)
    - [ 'banana', 6 ]           (test)
    - [ 'pineapple', 9 ]        (test)
```

There is also a `parameterizedGroup` which is basically the same as `parameterizedTest` but instead of creating a `group` that runs a `test` multiple times, it creates a `group` that runs a `group` multiple times.
Here you still need to provide a `test`. This can be useful if you want to have nested groups of tests.

Besides accepting a list of test values, you can also provide a `setUp` and `tearDown` function to run before and after each test.

### Add test options to parameter 🔩
If you want to add test options to a specific parameter you can do so by using the `options` extension on `List`. This will allow you to add test options like `skip` or `testOn` to a specific parameter.

For example:
```dart
parameterizedTest(
  'Fruit name matches length',
  // List of values to test
  [
  // parameters for the test
    ['kiwi', 4],
    ['apple', 5].options(skip: 'Apple is not ripe yet'),
    ['banana', 6],
    ['pineapple', 9],
  ],
  // Test function accepting the provided parameters
  (String fruit, int length) {
    expect(fruit.length, length);
  },
);
```

This will create a `group` with 4 `test` inside it. The second test will receive the provided test options and will be skipped in this case.

### Changing test description output 📝
By default, the test description contains the test value used within the tests. you can override this by using `customDescriptionBuilder`.

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

## Examples 📦
### Simple test containing a list of single values
```dart
parameterizedTest(
  'Example of list of single values',
  [
    1,
    2,
    3,
  ],
  (int value) {
    final result = value < 4;
    expect(result, true);
  },
);
```

### Simple test containing a list of multiple values
```dart
parameterizedTest('Example of list of multiple values', [
    [0, 1, 1],
    [1, 1, 2],
    [1, 2, 3],
    [2, 2, 4],
  ], (int value1, int value2, int sum) {
    expect(value1 + value2, sum);
});
```
### Test containing a list with complex objects
```dart
parameterizedTest('Example of a list with complex object', [
    [DateTime(2024, 4, 12), 5],
    [DateTime(1969, 07, 20), 7],
  ], (DateTime dateTime, int expectedWeekday) {
    expect(dateTime.weekday, expectedWeekday);
});
```

### Test containing a list of enums
```dart
enum TestEnum {
  one(3),
  two(3),
  three(5);

  const TestEnum(this.myLength);

  final int myLength;
}

parameterizedTest(
  'Example using enum as value',
  TestEnum.values,
  (TestEnum testEnum) {
    expect(testEnum.name.length, testEnum.myLength);
  },
);
```
### Test retreiving the list of values from a function
```dart
List<dynamic> provideData() {
  return [
          [0, 1, 1],
          [1, 1, 2],
          [1, 2, 3],
          [2, 2, 4],
         ];
}

parameterizedTest(
  'Example of list of values from function',
  provideData(),
  (int value1, int value2, int sum) {
    expect(value1 + value2, sum);
  },
);
```

### Simple test with setup and teardown
```dart
parameterizedTest(
  'Example with setup and teardown ',
  [
    ['kiwi', 4],
    ['apple', 5],
    ['banana', 6],
  ],
  (String word, int length) {
    expect(word.length, length);
  },
  setUp: () {
    print('Setup everything I need for testing');
  },
  tearDown: () {
    print('tear it down again');
  },
);
```

 ### Test which is an async test
 ```dart
parameterizedTest(
  'Example using a async test',
  [
    100,
    200,
    300,
  ],
  (int value) async {
    final millis = DateTime.now().millisecondsSinceEpoch;
    await Future<void>.delayed(Duration(milliseconds: value));
    final passed = DateTime.now().millisecondsSinceEpoch - millis;
  
    expect(passed >= value, true);
  },
);
```
> Note: This is a example test to showcase async tests are also possible.
> But this is not a good practice to use a delay like
> this in a test. Running this test will take longer. This could be
> fixed by using a package like [fake_async](https://pub.dev/packages/fake_async).

### Test with CSV data
Its also possible to combine parameterizedTest for example with the [csv](https://pub.dev/packages/csv) package.

```dart
parameterizedTest('Example of CSV data',
  const CsvToListConverter().convert('kiwi,4\r\napple,5\r\nbanana,6'),
  (String fruit, int length) {
    expect(fruit.length, length);
});
```

### Testing with `Future.error` values
When using `Future.error` directly in your parameterized test values, this might lead to not executing tests at all. In order to handle this correctly your can provide the `Future` as a callback function.  
But also need to make sure that the when the future is awaited its also catch. `Future.error` will throw the provided object. See [23](https://github.com/DutchCodingCompany/parameterized_test/issues/23) for more information.

## Additional information 💡

It's just a simple wrapper to easily execute tests multiple times with different values. Feel free to
leave some feedback or open a pull request :)
