import 'dart:math';

import 'package:external_dependencies/external_dependencies.dart';
import 'package:random_colors/core/core.dart';

/// Defines the interface for generating a new color.
abstract class GenerateNewColor {
  /// Generates a new color and returns the result as [Either].
  /// Returns [Right] with a hexadecimal string representing the generated color
  /// or [Left] with a [Failure] in case of an error.
  Either<Failure, String> call();
}

/// Concrete implementation of [GenerateNewColor].
class GenerateNewColorImpl implements GenerateNewColor {
  static const int _maxColorValue = 255;
  static const int _hexRadix = 16;
  static const int _hexPadding = 2;
  static const String _hexPrefix = '#';

  /// Generates a new random color and returns it as a hexadecimal string.
  /// Returns [Right] with a string in the format '#RRGGBB' representing the
  /// generated color
  /// or [Left] with a [Failure] of type [ExceptionType.unexpected] in case of
  /// an error.
  @override
  Either<Failure, String> call() {
    try {
      final random = Random();
      final r = _generateRandomColorComponent(random);
      final g = _generateRandomColorComponent(random);
      final b = _generateRandomColorComponent(random);

      final colorHex = '$_hexPrefix${_toHex(r)}${_toHex(g)}${_toHex(b)}';

      return Right(colorHex);
    } catch (e) {
      return Left(Failure(type: ExceptionType.unexpected));
    }
  }

  int _generateRandomColorComponent(Random random) =>
      random.nextInt(_maxColorValue + 1);

  String _toHex(int value) =>
      value.toRadixString(_hexRadix).padLeft(_hexPadding, '0');
}
