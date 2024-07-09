// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:quouch_app/main.dart';
import 'package:quouch_app/widgets/big_card.dart';

void main() {
  testWidgets('Next shows a different word', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const QuouchApp());

    // Verify that we are in the main page
    expect(find.textContaining('AWESOME'), findsOneWidget);

    // Save the last word
    final keyForBigCard = Key('WordPairCard');
    final lastWordFinder = find.byKey(keyForBigCard);
    final lastWord = tester.widget<BigCard>(lastWordFinder);
    print(lastWord.pair);

    // Tap the 'Next' icon and trigger a frame.
    await tester.tap(find.text('Next'));
    await tester.pump();

    // Verify that our word has changed.

    expect(find.text(lastWord.pair.asLowerCase), findsNothing);
    final newWord = tester.widget<BigCard>(lastWordFinder);

    expect(newWord.pair, isNot(equals(lastWord.pair)));
  });
}
