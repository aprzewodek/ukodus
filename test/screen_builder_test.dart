import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ukodus/user_interface/shared/screen_builder.dart';

void main() {
  testWidgets('Portrait', _portrait);
  testWidgets('Landscape', _landscape);
  testWidgets('No landscape', _noLandscape);
}

Future<void> _portrait(WidgetTester tester) async {
  const text = 'A';

  const widget = ScreenBuilder(
    portraitWidget: Text(
      text,
      textDirection: TextDirection.ltr, // needed for test
    ),
  );

  await tester.pumpWidget(widget);

  final widgetFinder = find.text(text);

  expect(widgetFinder, findsOneWidget);
}

Future<void> _landscape(WidgetTester tester) async {
  const text1 = 'A';
  const text2 = 'B';

  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft])
      .then((_) async {
    const widget = MaterialApp(
      home: ScreenBuilder(
        portraitWidget: Text(
          text1,
          textDirection: TextDirection.ltr, // needed for test
        ),
        landscapeWidget: Text(
          text2,
          textDirection: TextDirection.ltr, // needed for test
        ),
      ),
    );

    await tester.pumpWidget(widget);

    final widgetPortrait = find.text(text1);
    final widgetLandscape = find.text(text2);

    expect(widgetPortrait, findsNothing);
    expect(widgetLandscape, findsOneWidget);
  });
}

Future<void> _noLandscape(WidgetTester tester) async {
  const text1 = 'A';
  const text2 = 'B';

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown])
      .then((_) async {
    const widget = MaterialApp(
      home: ScreenBuilder(
        portraitWidget: Text(
          text1,
          textDirection: TextDirection.ltr, // needed for test
        ),
        landscapeWidget: Text(
          text2,
          textDirection: TextDirection.ltr, // needed for test
        ),
      ),
    );

    await tester.pumpWidget(widget);

    final widgetPortrait = find.text(text1);
    final widgetLandscape = find.text(text2);

    expect(widgetPortrait, findsOneWidget);
    expect(widgetLandscape, findsNothing);
  });
}
