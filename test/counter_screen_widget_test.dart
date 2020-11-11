import 'package:flutter/material.dart';
import 'package:flutter_bloc_counter/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Find counter screen title', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Flutter BLoC Counter'), findsOneWidget);
  });

  testWidgets('Increase counter value', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('1'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('2'), findsOneWidget);
  });

  testWidgets('Decrease counter value', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();

    expect(find.text('-1'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();

    expect(find.text('-2'), findsOneWidget);
  });

  testWidgets('Increase counter value and reset it', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('1'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('2'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.refresh));
    await tester.pump();

    expect(find.text('0'), findsOneWidget);
  });
}
