import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:quouch_app/app.dart';

void main() {
  testWidgets('tab navigation', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const App());

    // Verify all icons exist
    expect(find.byIcon(Icons.search), findsOneWidget);
    expect(find.byIcon(Icons.favorite), findsOneWidget);
    expect(find.byIcon(Icons.all_inclusive), findsOneWidget);
    expect(find.byIcon(Icons.chat_bubble), findsOneWidget);
    expect(find.byIcon(Icons.account_circle), findsOneWidget);

    // Verify that we are in the main page
    expect(find.textContaining('Explore'), findsOneWidget);
    // Verify that the Tab is selected
    expect(find.byIcon(Icons.search), findsOneWidget);

    // Tap the 'Saved' icon and trigger a frame.
    await tester.tap(find.text('Saved'));
    await tester.pump();

    // Verify that our page has changed.
    expect(find.text('You have no favorites'), findsOneWidget);    // Verify that the Tab is selected
  });
}
