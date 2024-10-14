import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quouch_app/pages/pages.dart';

import 'helpers/test_app.dart';

void main() {
  testWidgets('tab navigation', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    Element context = await initializeWidgetForTest(tester, HomePage());

    // Verify all icons exist
    expect(find.byIcon(Icons.explore), findsOneWidget);
    expect(find.byIcon(Icons.favorite), findsOneWidget);
    expect(find.byIcon(Icons.all_inclusive), findsOneWidget);
    expect(find.byIcon(Icons.chat_bubble), findsOneWidget);
    expect(find.byIcon(Icons.account_circle), findsOneWidget);

    // Verify that we are in the main page
    expect(find.text('Where are you going?'), findsOneWidget);
    expect(find.byIcon(Icons.search), findsOneWidget);
    // Verify that the Tab is selected
    var exploreIcon =
        tester.widget<IconButton>(find.byKey(Key('home_tab_button_explore')));
    expect(exploreIcon.color, Theme.of(context).colorScheme.secondary);

    // Tap the 'Saved' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.favorite));
    await tester.pump();

    // Verify that our page has changed.
    expect(find.text('Saved'), findsOneWidget);

    // Verify that the Tab is selected
    exploreIcon =
        tester.widget<IconButton>(find.byKey(Key('home_tab_button_explore')));
    expect(exploreIcon.color, null);
    var savedIcon =
        tester.widget<IconButton>(find.byKey(Key('home_tab_button_saved')));
    expect(savedIcon.color, Theme.of(context).colorScheme.secondary);
  });
}
