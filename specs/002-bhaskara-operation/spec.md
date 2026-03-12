# Feature Specification: Bhaskara Formula Operation

**Feature Branch**: `002-bhaskara-operation`  
**Created**: 2026-02-27  
**Status**: Draft  
**Input**: User description: "quero que vc me ajude a usar o spec-kit para criar a formula de baskara para adicionar na calculadora como uma nova operacao."

## User Scenarios & Testing *(mandatory)*

### User Story 1 - Calculate Two Distinct Real Roots (Priority: P1)

As a user, I want to input the coefficients A, B, and C of a quadratic equation with a positive discriminant so that I can see the two distinct real roots (X1 and X2).

**Why this priority**: Calculating real roots is the primary use case of the Bhaskara formula and delivers the core value of the feature.

**Independent Test**: Can be fully tested by entering `A=1`, `B=-3`, `C=2` and verifying the output correctly shows `X1=2` and `X2=1`.

**Acceptance Scenarios**:

1. **Given** the calculator is in Bhaskara mode, **When** the user inputs `A=1`, `B=-3`, `C=2` and requests calculation, **Then** the system displays `X1=2` and `X2=1`.
2. **Given** the calculator is in Bhaskara mode, **When** the user inputs `A=2`, `B=-8`, `C=8` and requests calculation, **Then** the system displays `X1=2` and `X2=2`.

---

### User Story 2 - Handle Equation with No Real Roots (Priority: P2)

As a user, I want to be informed when the quadratic equation I entered has no real roots (negative discriminant), so that I understand why the calculation cannot produce a standard real number result.

**Why this priority**: It is a mathematically common scenario that the system must handle gracefully to avoid confusing the user or causing a crash.

**Independent Test**: Can be fully tested by entering coefficients that yield a negative discriminant (e.g. `A=1`, `B=1`, `C=1`) and checking the error message.

**Acceptance Scenarios**:

1. **Given** the calculator is in Bhaskara mode, **When** the user inputs `A=1`, `B=1`, `C=1` and requests calculation, **Then** the system displays a message indicating "No real roots".

---

### User Story 3 - Prevent Invalid Equations (A=0) (Priority: P1)

As a user, I want the calculator to prevent me from calculating the roots if coefficient A is zero, because the equation is no longer quadratic.

**Why this priority**: Attempting to divide by zero in the Bhaskara formula will crash the application or yield undefined behavior.

**Independent Test**: Can be fully tested by entering `A=0` and ensuring the calculation does not proceed and a validation error is shown.

**Acceptance Scenarios**:

1. **Given** the calculator is in Bhaskara mode, **When** the user inputs `A=0`, `B=5`, `C=2` and attempts to calculate, **Then** the system displays an error message stating "Coefficient A cannot be zero".

---

### Edge Cases

- What happens when users enter extremely large coefficients? (System should correctly calculate displaying scientific notation if needed, without overflowing)
- What happens if the user leaves one or more coefficients blank? (System should treat them as `0` if it's B or C, but show validation error if A is blank)
- How does the system handle decimal or fractional coefficients? (System should calculate with standard floating-point precision)

## Requirements *(mandatory)*

### Functional Requirements

- **FR-001**: System MUST allow users to select "Bhaskara" (or Quadratic Equation) as an operation mode.
- **FR-002**: System MUST provide three distinct input fields for coefficients A, B, and C.
- **FR-003**: System MUST calculate the discriminant (Delta = B² - 4AC) internally.
- **FR-004**: System MUST display the roots (X1, X2) if the discriminant is greater than or equal to 0.
- **FR-005**: System MUST display an informative message (e.g., "No real roots") if the discriminant is strictly less than 0.
- **FR-006**: System MUST validate that coefficient A is not equal to 0, and display a validation error message if it is.
- **FR-007**: System MUST allow clear/resetting the input fields for a new calculation.

### Assumptions

- The app operates on real numbers, so complex number evaluation is not strictly required.
- Standard double-precision floating-point arithmetic is sufficient for normal use cases.

### Key Entities

- **QuadraticEquation**: Represents the mathematical state, containing coefficients A, B, C, the computed Discriminant, and resulting Roots.

## Success Criteria *(mandatory)*

### Measurable Outcomes

- **SC-001**: Users can successfully calculate the roots of `x² - 5x + 6 = 0` and see the correct output on their first attempt without any errors.
- **SC-002**: System gracefully catches 100% of division-by-zero attempts when `A=0` without an application crash.
- **SC-003**: The UI accommodates reading both roots simultaneously without requiring the user to scroll or toggle views.
