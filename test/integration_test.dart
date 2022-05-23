import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:ukodus/main.dart' as app;
import 'package:ukodus/user_interface/screens/game/tile.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Leave game', _leaveTest);
}

Future<void> _leaveTest(WidgetTester tester) async {
  app.main();
  await tester.pumpAndSettle();

  await _newGame(tester);
  await _startGame(tester);
  await _tapNumber(tester);

  // Verify the counter increments by 1.
  expect(find.text('1'), findsOneWidget);
}

Future<void> _newGame(WidgetTester tester) async {
  final startButton = find.byIcon(Icons.play_arrow);

  await tester.tap(startButton);

  await tester.pumpAndSettle();
}

Future<void> _startGame(WidgetTester tester) async {
  const key = Key('play-UkodusType.classic-Classic 01');

  final startButton = find.byKey(key);

  await tester.tap(startButton);

  await tester.pumpAndSettle();
}

Future<void> _tapNumber(WidgetTester tester) async {
  final numberButton = find.byType(Tile);

  await tester.tap(numberButton.first);

  await tester.pumpAndSettle();
}

Future<void> _goBack(WidgetTester tester) async {}
