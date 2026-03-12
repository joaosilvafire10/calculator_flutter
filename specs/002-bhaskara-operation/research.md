# Phase 0: Research & Decisions

## Technical Context Unknowns Resolved

Everything is currently straightforward for a Flutter project. The primary unknowns centered around the exact architecture used in the existing extensible calculator app.

**Decision**: We will use a standard Flutter Provider pattern coupled with a clean Logic class.
**Rationale**: Provider is already listed in the `pubspec.yaml` (version `^6.1.2`), making it the canonical state management solution for this project.
**Alternatives considered**: BLoC or Riverpod were considered but rejected since they are not present in the dependencies, and introducing a new state management library for one feature violates standard practices.

## Validation & Edge Cases

The Bhaskara formula has specific mathematical edge cases that must be handled gracefully:

1. **A = 0**: The equation is not quadratic (it becomes linear: Bx + C = 0). We must validate and prevent calculation.
2. **Discriminant (Δ) < 0**: The roots are complex numbers. Given the context (a standard calculator app), we assume the requirement is to find real roots or display a "No real roots" message.
3. **Discriminant (Δ) = 0**: There is exactly one unique real root (or two identical real roots). The UI should ideally display this clearly, or just show X1 = X2.

**Decision**: The `BhaskaraCalculator` class will handle these mathematically and throw specific exceptions or return a distinct state object that the UI can consume and display friendly errors for.
**Rationale**: Keeps the math pure and UI dumb (aligns with Constitution Principle III).

## Testing Strategy

**Decision**: 
1. `test/logic/bhaskara_calculator_test.dart` for pure Dart unit tests verifying the math (positive delta, zero delta, negative delta, division by zero).
2. `test/ui/bhaskara_screen_test.dart` for widget tests ensuring the UI shows the right inputs and error messages.
**Rationale**: Aligns directly with Constitution Principle II (Test-First Reliability).
