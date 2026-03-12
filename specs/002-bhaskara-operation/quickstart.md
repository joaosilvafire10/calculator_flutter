# Quickstart: Bhaskara Formula Operation

## High-Level Approach

This feature introduces a new mathematical operation to the extensible calculator: solving the Bhaskara (Quadratic) formula. The implementation follows the core principles laid out in the `constitution.md`: Separation of logic and state, test-first reliability, and a clean, composed UI based on widgets.

## Key Changes

1. **Dart Logic Class** (`lib/logic/bhaskara_calculator.dart`): Pure math function taking three `double` parameters (`a`, `b`, `c`). Returns a tuple/object with two calculated real roots or throws an exception for division-by-zero (`a == 0`) and complex roots (`delta < 0`).
2. **Provider State** (`lib/providers/bhaskara_provider.dart`): Manages the state for the screen. Captures three inputs and surfaces the `BhaskaraResult` or an error string to the UI.
3. **UI Screen** (`lib/ui/screens/bhaskara_screen.dart`): Composed UI with three text fields and a calculate button. Watches the provider to display the outputs below the button.
4. **Integration**: The screen is added to the main navigation menu/switcher of the calculator app.

## Critical Paths & Scenarios

- **Valid Real Roots**: Input `1, -3, 2`. Output should clearly report `X1 = 2` and `X2 = 1`.
- **Identical Real Roots**: Input `2, -8, 8`. Output should report `X1 = 2` and `X2 = 2` (or a single root `X = 2`).
- **No Real Roots**: Input `1, 1, 1`. The UI should inform the user that the equation has no real roots (the delta `b² - 4ac` is negative).
- **Invalid Equation**: Input `0, 2, 3`. The UI should prevent calculation or catch the error generated, warning the user that `A` cannot be zero.

## Verification

The correctness of this feature is verified via:

- **Logic Tests**: `flutter test test/logic/bhaskara_calculator_test.dart` ensures all math and exception paths resolve properly.
- **Widget Tests**: `flutter test test/ui/bhaskara_screen_test.dart` ensures UI responds correctly to the Provider's state transitions, displaying distinct error messages or input field values correctly.
