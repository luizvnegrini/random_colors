import 'package:flutter_test/flutter_test.dart';
import 'package:random_colors/domain/usecases/generate_new_color.dart';

void main() {
  // ignore: avoid_late_keyword
  late GenerateNewColor generateNewColor;

  setUp(() {
    generateNewColor = GenerateNewColorImpl();
  });

  test('should return a valid hexadecimal color', () {
    // Arrange
    final RegExp hexColorRegex = RegExp(r'^#[0-9A-Fa-f]{6}$');

    // Act
    final result = generateNewColor();

    // Assert
    expect(result.isRight(), true);
    result.fold(
      (_) => fail('Should not return failure'),
      (colorHex) {
        expect(hexColorRegex.hasMatch(colorHex), true);
      },
    );
  });

  test('should generate different colors in consecutive calls', () {
    // Act
    final result1 = generateNewColor();
    final result2 = generateNewColor();

    // Assert
    expect(result1.isRight(), true);
    expect(result2.isRight(), true);

    String? color1;
    String? color2;

    result1.fold(
      (_) => fail('Should not return failure'),
      (colorHex) => color1 = colorHex,
    );

    result2.fold(
      (_) => fail('Should not return failure'),
      (colorHex) => color2 = colorHex,
    );

    expect(color1, isNot(equals(color2)));
  });
}
