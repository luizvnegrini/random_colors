// ignore_for_file: avoid_late_keyword, prefer_match_file_name
import 'package:external_dependencies/external_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:random_colors/domain/usecases/generate_new_color.dart';
import 'package:random_colors/presentation/presentation.dart';

class GenerateNewColorMock extends Mock implements GenerateNewColor {}

void main() {
  late GenerateNewColorMock generateNewColorMock;
  late ProviderScope providerScope;

  setUp(() {
    generateNewColorMock = GenerateNewColorMock();
    providerScope = ProviderScope(
      overrides: [
        generateNewColor.overrideWithValue(generateNewColorMock),
      ],
      child: const MaterialApp(home: HomePage()),
    );
  });

  testWidgets('HomePage should display initial text',
      (WidgetTester tester) async {
    await tester.pumpWidget(providerScope);

    expect(find.text('Tap to change color'), findsOneWidget);
  });

  testWidgets('HomePage should change color when tapping the screen',
      (WidgetTester tester) async {
    when(() => generateNewColorMock.call()).thenAnswer((_) => right('#1eceda'));
    await tester.pumpWidget(providerScope);

    final initialColor = (tester
            .widget<AnimatedContainer>(find.byType(AnimatedContainer))
            .decoration as BoxDecoration?)
        ?.color;

    await tester.tap(find.byType(GestureDetector));
    await tester.pump();

    final newColor = (tester
            .widget<AnimatedContainer>(find.byType(AnimatedContainer))
            .decoration as BoxDecoration?)
        ?.color;

    expect(newColor, isNot(equals(initialColor)));
  });
}
