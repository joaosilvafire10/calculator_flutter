# Data Model: Bhaskara Formula Operation

## Entities

### `BhaskaraEquation`

A core domain entity representing the coefficients of a quadratic equation and its calculated results, isolated from any user interface logic.

**Fields**:
- `a` (double): Coefficient of x² (must be non-zero)
- `b` (double): Coefficient of x
- `c` (double): Constant term
- `discriminant` (double) - *Computed*: `b * b - 4 * a * c`
- `root1` (double?) - *Computed*: First real root (if discriminant >= 0).
- `root2` (double?) - *Computed*: Second real root (if discriminant >= 0).
- `hasRealRoots` (bool) - *Computed*: True if discriminant >= 0.
- `isLinear` (bool) - *Computed*: True if `a == 0`.

**Validation Rules**:
1. If `a == 0`, the equation is linear, and quadratic root calculation should fail or return an error state.
2. If `discriminant < 0`, `root1` and `root2` must be null or throw an error upon access if strictly typed real roots are required.

## Contracts / Interfaces

### `BhaskaraCalculatorService`

Provides pure math evaluation logic.

```dart
abstract class BhaskaraCalculatorService {
  /// Calculates roots for a given quadratic equation.
  /// Throws [ArgumentError] if a == 0.
  BhaskaraResult calculateRoots(double a, double b, double c);
}

class BhaskaraResult {
  final double? x1;
  final double? x2;
  final double delta;
  final bool hasRealRoots;
  final String? errorMessage;
  // ... constructor ...
}
```

### State Management (`BhaskaraProvider`)

Manages the UI state for the Bhaskara calculator screen.

```dart
class BhaskaraProvider extends ChangeNotifier {
  // Input tracking
  double? get a;
  double? get b;
  double? get c;

  void setA(String value);
  void setB(String value);
  void setC(String value);

  // Trigger calculation
  void calculate();
  
  // Output and Error states
  BhaskaraResult? get currentResult;
  String? get currentError;

  void reset();
}
```
