---
name: parameterized-test-write
description: Write parameterized tests using `package:parameterized_test` to run a single test body against multiple data sets. Use when testing functions with multiple inputs/outputs, boundary values, or data-driven scenarios.
---
# Writing Parameterized Tests

## Contents
- [Dependency Setup](#dependency-setup)
- [Core API](#core-api)
- [Value Formats](#value-formats)
- [Test Descriptions](#test-descriptions)
- [Per-Value Test Options](#per-value-test-options)
- [Writing the Test Body](#writing-the-test-body)
- [Workflow](#workflow)
- [Examples](#examples)

## Dependency Setup
Add `parameterized_test` as a dev dependency before writing tests.

- Run `dart pub add dev:parameterized_test` (or `flutter pub add dev:parameterized_test` for Flutter projects).
- Import both `package:parameterized_test/parameterized_test.dart` and `package:test/test.dart` in each test file.
- The package re-exports `CustomDescriptionBuilder` and the `.options()` extensions automatically. No additional imports are needed.

## Core API
The package exposes two top-level getters that serve as the primary entry points.

### `parameterizedTest`
Creates a `group` containing one `test` per entry in `values`. This is the main entry point for most use cases.

```dart
parameterizedTest(
  Object? description,        // Group name displayed in test output
  List<dynamic> values,        // List of parameter sets
  Function body, {             // Test body invoked once per parameter set
  CustomDescriptionBuilder? customDescriptionBuilder,
  dynamic Function()? setUp,   // Runs before each individual test
  dynamic Function()? tearDown,// Runs after each individual test
  String? testOn,              // Platform selector (applied to the group)
  Timeout? timeout,            // Timeout (applied to the group)
  Object? skip,                // Skip reason (applied to the group)
  Object? tags,                // Tags (applied to the group)
  Map<String, dynamic>? onPlatform, // Platform overrides (applied to the group)
  int? retry,                  // Retry count (applied to the group)
});
```

### `parameterizedGroup`
Creates a `group` containing one nested `group` per entry in `values`. Use this when each parameter set needs multiple `test()` calls inside it.

```dart
parameterizedGroup(
  Object? description,
  List<dynamic> values,
  Function body, {             // Body should contain test() or group() calls
  // ... same optional parameters as parameterizedTest
});
```

**Key difference:** `parameterizedTest` runs the body as a test directly. `parameterizedGroup` runs the body as a group, so the body must define its own `test()` calls inside.

## Value Formats
Provide test data in one of three formats. The package automatically detects the format and unpacks values accordingly.

### Single Values
Pass a flat list. Each element becomes a single argument to the test body.

```dart
parameterizedTest('is positive', [1, 2, 3], (int value) {
  expect(value > 0, isTrue);
});
```

### Multiple Values
Pass a list of lists. Each inner list is spread as positional arguments to the test body.

```dart
parameterizedTest('addition', [
  [1, 2, 3],
  [0, 0, 0],
  [-1, 1, 0],
], (int a, int b, int expected) {
  expect(a + b, expected);
});
```

### Enum Values
Pass an enum's `.values` list directly. Each enum variant becomes a single argument.

```dart
parameterizedTest('has valid name', MyEnum.values, (MyEnum value) {
  expect(value.name.isNotEmpty, isTrue);
});
```

### Data Provider Functions
Extract value lists into a separate function for reuse or readability.

```dart
List<dynamic> additionData() => [
  [1, 2, 3],
  [0, 0, 0],
  [-1, 1, 0],
];

parameterizedTest('addition', additionData(), (int a, int b, int expected) {
  expect(a + b, expected);
});
```

### Iterable Sources
Any `Iterable` is accepted for values. The package converts it to a `List` internally. This enables data sources like CSV parsers or generators.

## Test Descriptions
Each individual test within the group receives an auto-generated description. Control the format using two mechanisms.

### Default Description
By default, each test is labeled `[ val1, val2, ... ]`. String values are single-quoted; other types use their `toString()` representation.

```
// Given values: ['kiwi', 4]
// Test label: [ 'kiwi', 4 ]
```

### Custom Description Builder
Pass a `customDescriptionBuilder` to generate custom labels. The builder receives the group description, the 1-based index, and the raw values list.

```dart
parameterizedTest(
  'word length',
  [
    ['kiwi', 4],
    ['apple', 5],
  ],
  (String word, int length) {
    expect(word.length, length);
  },
  customDescriptionBuilder: (groupDescription, index, values) =>
    '#$index $groupDescription: "${values[0]}" has ${values[1]} letters',
);
```

This produces test names like: `#1 word length: "kiwi" has 4 letters`.

## Per-Value Test Options
Attach individual test configuration to specific value sets using the `.options()` extension method. Options set here apply only to that one test, not to the entire group.

### On Multi-Value Entries (List)
Call `.options()` on a `List<dynamic>` to attach options to a multi-value parameter set.

```dart
parameterizedTest('word length', [
  ['kiwi', 4],
  ['apple', 5],
  ['banana', 6].options(skip: 'Known issue: banana is broken'),
], (String word, int length) {
  expect(word.length, length);
});
```

### On Single-Value Entries (Object)
Call `.options()` on any `Object` to attach options to a single-value parameter set.

```dart
parameterizedTest('is even', [
  2,
  4,
  7.options(skip: 'Odd number, expected to fail'),
], (int value) {
  expect(value.isEven, isTrue);
});
```

### Supported Options
All `.options()` parameters mirror the standard `test()` parameters:

| Parameter | Type | Purpose |
|---|---|---|
| `skip` | `dynamic` | Skip this test case. Pass `true` or a `String` reason. |
| `timeout` | `Timeout?` | Override the timeout for this test case. |
| `testOn` | `String?` | Platform selector for this test case. |
| `tags` | `dynamic` | Tags for this test case. |
| `onPlatform` | `Map<String, dynamic>?` | Platform-specific configuration. |
| `retry` | `int?` | Number of retries for this test case. |
| `customDescriptionBuilder` | `CustomDescriptionBuilder?` | Override the description for this specific test case. |

**Precedence:** Per-value options (via `.options()`) take precedence over group-level options passed to `parameterizedTest()`. Group-level `testOn`, `timeout`, `skip`, `tags`, `onPlatform`, and `retry` are applied to the outer group, not to individual tests.

## Writing the Test Body
The test body is a `Function` that receives the unpacked values as positional arguments. Follow these rules when writing it.

### Parameter Count Must Match
The number of parameters in the body must match the number of elements in each value set. A mismatch throws a `ParameterizedError` with a clear message showing the expected vs. provided argument count.

```
// ERROR: 3 arguments provided but body expects 2
// ParameterizedError: Wrong number of arguments.
// Values provided: [1, 2, 3] (3 arguments)
// Function expects: (int, int)
```

### Parameter Types Must Match
Each parameter type must be compatible with the corresponding value. A type mismatch throws a `ParameterizedError` showing the provided types vs. expected types.

```
// ERROR: String provided where int expected
// ParameterizedError: Wrong argument type(s).
// Values provided: ['hello', 'world'] with types [String, String]
// Function expects: (int, int)
```

### Async Test Bodies
The body may be `async`. The test runner automatically waits for the returned `Future` to complete.

```dart
parameterizedTest('fetch user', [1, 2, 3], (int userId) async {
  final user = await api.fetchUser(userId);
  expect(user, isNotNull);
});
```

### Errors From Inside the Test Body
If a `TypeError` or `NoSuchMethodError` originates from inside the test body (not from the parameter application), the package rethrows it unmodified. The package only wraps errors that come from applying the wrong arguments to the body function.

## Workflow

Follow this checklist when writing parameterized tests. Copy it to track progress.

### Task Progress
- [ ] 1. Add `parameterized_test` as a dev dependency (`dart pub add dev:parameterized_test`).
- [ ] 2. Create or open the test file (mirror `lib/` structure, use `_test.dart` suffix).
- [ ] 3. Import `package:parameterized_test/parameterized_test.dart` and `package:test/test.dart`.
- [ ] 4. Identify the function or behavior under test.
- [ ] 5. Define value sets:
    - Include happy-path cases with known correct outputs.
    - Include boundary values (zero, negative, empty string, empty list, max values).
    - Include error cases (null if nullable, invalid input, overflow).
- [ ] 6. Write the `parameterizedTest()` call:
    - Set a descriptive group `description`.
    - Pass the `values` list.
    - Write the `body` with correctly typed parameters matching the value structure.
- [ ] 7. Add per-value `.options()` where needed (skip flaky cases, set timeouts for slow cases).
- [ ] 8. Add a `customDescriptionBuilder` if the default `[ val1, val2 ]` format is unclear.
- [ ] 9. Add `setUp` / `tearDown` if shared state needs initialization or cleanup.
- [ ] 10. Run the test suite using `dart test` or `flutter test`.

### Feedback Loop
1. Run the test suite.
2. If a `ParameterizedError` is thrown, check that value count and types match the body signature.
3. If tests fail on assertions, review the expected values in the data set.
4. Repeat until all tests pass.

## Examples

### Single Values: Simple Validation
Test a single input against a condition.

```dart
import 'package:parameterized_test/parameterized_test.dart';
import 'package:test/test.dart';

void main() {
  parameterizedTest('is less than 10', [1, 5, 9], (int value) {
    expect(value < 10, isTrue);
  });
}
```

### Multiple Values: Input and Expected Output
Test a function with multiple inputs and verify against an expected result.

```dart
import 'package:parameterized_test/parameterized_test.dart';
import 'package:test/test.dart';

void main() {
  parameterizedTest('addition', [
    [2, 3, 5],
    [0, 0, 0],
    [-1, 1, 0],
    [100, 200, 300],
  ], (int a, int b, int expected) {
    expect(a + b, expected);
  });
}
```

### Complex Objects
Pass non-primitive types as values.

```dart
import 'package:parameterized_test/parameterized_test.dart';
import 'package:test/test.dart';

void main() {
  parameterizedTest('weekday check', [
    [DateTime(2024, 4, 12), 5],
    [DateTime(1969, 7, 20), 7],
  ], (DateTime dateTime, int expectedWeekday) {
    expect(dateTime.weekday, expectedWeekday);
  });
}
```

### Enum Values
Iterate over all variants of an enum.

```dart
import 'package:parameterized_test/parameterized_test.dart';
import 'package:test/test.dart';

enum Fruit {
  kiwi(4),
  apple(5),
  banana(6);

  const Fruit(this.nameLength);
  final int nameLength;
}

void main() {
  parameterizedTest('name length matches', Fruit.values, (Fruit fruit) {
    expect(fruit.name.length, fruit.nameLength);
  });
}
```

### Data Provider Function
Extract test data into a reusable function.

```dart
import 'package:parameterized_test/parameterized_test.dart';
import 'package:test/test.dart';

List<dynamic> multiplicationData() => [
  [2, 3, 6],
  [0, 100, 0],
  [-2, 3, -6],
  [7, 7, 49],
];

void main() {
  parameterizedTest('multiplication', multiplicationData(), (
    int a,
    int b,
    int expected,
  ) {
    expect(a * b, expected);
  });
}
```

### setUp and tearDown
Run shared setup and cleanup logic around each individual test.

```dart
import 'package:parameterized_test/parameterized_test.dart';
import 'package:test/test.dart';

void main() {
  late List<String> log;

  parameterizedTest(
    'word length',
    [
      ['kiwi', 4],
      ['apple', 5],
      ['banana', 6],
    ],
    (String word, int length) {
      log.add(word);
      expect(word.length, length);
    },
    setUp: () {
      log = [];
    },
    tearDown: () {
      log.clear();
    },
  );
}
```

### Async Test Body
Test asynchronous operations with each parameter set.

```dart
import 'package:parameterized_test/parameterized_test.dart';
import 'package:test/test.dart';

void main() {
  parameterizedTest('delayed value resolves', [10, 20, 30], (int ms) async {
    final future = Future<int>.delayed(
      Duration(milliseconds: ms),
      () => ms,
    );
    expect(await future, ms);
  });
}
```

### Per-Value Options: Skipping Specific Cases
Skip individual test cases while keeping the rest active.

```dart
import 'package:parameterized_test/parameterized_test.dart';
import 'package:test/test.dart';

void main() {
  parameterizedTest('division', [
    [10, 2, 5],
    [9, 3, 3],
    [10, 0, 0].options(skip: 'Division by zero not yet handled'),
  ], (int a, int b, int expected) {
    expect(a ~/ b, expected);
  });
}
```

### Per-Value Options: Timeout and Retry
Configure timeout and retry on specific slow or flaky cases.

```dart
import 'package:parameterized_test/parameterized_test.dart';
import 'package:test/test.dart';

void main() {
  parameterizedTest('api response', [
    ['fast-endpoint', 200],
    ['slow-endpoint', 200].options(
      timeout: const Timeout(Duration(seconds: 30)),
      retry: 3,
    ),
  ], (String endpoint, int expectedStatus) async {
    final status = await fetchStatus(endpoint);
    expect(status, expectedStatus);
  });
}
```

### Custom Description Builder
Generate readable test names instead of the default `[ val1, val2 ]` format.

```dart
import 'package:parameterized_test/parameterized_test.dart';
import 'package:test/test.dart';

void main() {
  parameterizedTest(
    'string length',
    [
      ['hello', 5],
      ['', 0],
      ['dart', 4],
    ],
    (String input, int expected) {
      expect(input.length, expected);
    },
    customDescriptionBuilder: (group, index, values) =>
      '#$index "$group": "${values[0]}" should have length ${values[1]}',
  );
}
```

This produces test names like:
```
#1 "string length": "hello" should have length 5
#2 "string length": "" should have length 0
#3 "string length": "dart" should have length 4
```

### parameterizedGroup: Nested Test Structure
Use `parameterizedGroup` when each parameter set needs multiple assertions in separate `test()` calls.

```dart
import 'package:parameterized_test/parameterized_test.dart';
import 'package:test/test.dart';

void main() {
  parameterizedGroup('String operations', [
    ['hello', 5],
    ['dart', 4],
    ['parameterized', 13],
  ], (String word, int length) {
    test('has correct length', () {
      expect(word.length, length);
    });

    test('is not empty', () {
      expect(word.isNotEmpty, isTrue);
    });

    test('lowercased equals itself', () {
      expect(word.toLowerCase(), word);
    });
  });
}
```

### Per-Value Custom Description
Override the description for a specific test case using `.options()`.

```dart
import 'package:parameterized_test/parameterized_test.dart';
import 'package:test/test.dart';

void main() {
  parameterizedTest('boundary check', [
    [0, true].options(
      customDescriptionBuilder: (group, index, values) => 'zero is boundary',
    ),
    [1, true],
    [-1, false],
  ], (int value, bool expected) {
    expect(value >= 0, expected);
  });
}
```
