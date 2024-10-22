import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:quouch_app/pages/login/widgets/widgets.dart';
import 'package:quouch_app/pages/pages.dart';

import 'helpers/factories/user.dart';
import 'helpers/test_app.dart';

void main() {
  group("Log in with credentials", () {
    setUpAll(() {
      testSetup();
    });
    tearDownAll(() {
      testTearDown();
    });
    testWidgets('wrong credentials', (WidgetTester tester) async {
      await initializeWidgetForTest(tester, LoginPage());

      // Find widgets
      final usernameInputFinder = find.byType(UsernameInput);
      final passwordInputFinder = find.byType(PasswordInput);
      final loginButtonFinder = find.byType(LoginButton);

      // Verify the widgets exist
      expect(usernameInputFinder, findsOneWidget);
      expect(passwordInputFinder, findsOneWidget);
      expect(loginButtonFinder, findsOneWidget);

      // Get elevated button within the login button
      var loginInnerButton = find.descendant(
          of: loginButtonFinder, matching: find.byType(ElevatedButton));
      expect(tester.widget<ElevatedButton>(loginInnerButton).enabled, false);

      // Set wrong username and password
      await tester.enterText(usernameInputFinder, 'wrong_username');
      await tester.enterText(passwordInputFinder, 'wrong_password');
      await tester.pump();

      expect(tester.widget<ElevatedButton>(loginInnerButton).enabled, true);

      // Mock the login method to throw an exception
      var authRepo = getIt<AuthenticationRepository>();
      when(authRepo.logIn(email: 'wrong_username', password: 'wrong_password'))
          .thenThrow(Exception('Some error'));

      // Tap the login button without entering username and password
      await tester.tap(loginButtonFinder);
      await tester.pump();

      // Verify that error Snackbar is shown when no username and password are entered
      expect(find.byType(SnackBar), findsOneWidget);
    });

    testWidgets('correct credentials', (WidgetTester tester) async {
      await initializeWidgetForTest(tester, LoginPage());

      // Mock the login method to be successful
      var authRepo = getIt<AuthenticationRepository>();
      when(authRepo.logIn(
              email: 'correct_username', password: 'correct_password'))
          .thenAnswer((_) async => generateFakeUser(1));
      when(authRepo.status)
          .thenAnswer((_) => Stream.value(AuthenticationStatus.authenticated));

      // Find widgets
      final usernameInputFinder = find.byType(UsernameInput);
      final passwordInputFinder = find.byType(PasswordInput);
      final loginButtonFinder = find.byType(LoginButton);

      // Verify the widgets exist
      expect(usernameInputFinder, findsOneWidget);
      expect(passwordInputFinder, findsOneWidget);
      expect(loginButtonFinder, findsOneWidget);

      // Get elevated button within the login button
      var loginInnerBUtton = find.descendant(
          of: loginButtonFinder, matching: find.byType(ElevatedButton));
      expect(tester.widget<ElevatedButton>(loginInnerBUtton).enabled, false);

      // Set correct username and password
      await tester.enterText(usernameInputFinder, 'correct_username');
      await tester.enterText(passwordInputFinder, 'correct_password');
      await tester.pump();

      expect(tester.widget<ElevatedButton>(loginInnerBUtton).enabled, true);

      // Tap the login button without entering username and password
      await tester.tap(loginButtonFinder);
      await tester.pump();

      // Verify that error Snackbar is shown when no username and password are entered
      expect(find.byType(SnackBar), findsNothing);
    });
  });
}
