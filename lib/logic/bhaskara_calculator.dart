import 'dart:math';

class BhaskaraResult {
  final double? root1;
  final double? root2;
  final double discriminant;
  final bool hasRealRoots;
  final bool isLinear;

  BhaskaraResult({
    this.root1,
    this.root2,
    required this.discriminant,
    required this.hasRealRoots,
    required this.isLinear,
  });
}

class BhaskaraCalculator {
  /// Calculates roots for a given quadratic equation.
  /// Throws [ArgumentError] if a == 0.
  BhaskaraResult calculateRoots(double a, double b, double c) {
    if (a == 0) {
      throw ArgumentError(
        'Coefficient A cannot be zero in a quadratic equation.',
      );
    }

    final discriminant = (b * b) - (4 * a * c);

    if (discriminant < 0) {
      return BhaskaraResult(
        root1: null,
        root2: null,
        discriminant: discriminant,
        hasRealRoots: false,
        isLinear: false,
      );
    }

    final root1 = (-b + sqrt(discriminant)) / (2 * a);
    final root2 = (-b - sqrt(discriminant)) / (2 * a);

    return BhaskaraResult(
      root1: root1,
      root2: root2,
      discriminant: discriminant,
      hasRealRoots: true,
      isLinear: false,
    );
  }
}
