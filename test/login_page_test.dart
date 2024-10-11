import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quouch_app/pages/login/widgets/widgets.dart';
import 'package:quouch_app/pages/pages.dart';

import 'helpers/test_app.dart';

class TestLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginBloc(
          authenticationRepository: MockAuthenticationRepository(),
        ),
        child: const LoginForm(),
      ),
    );
  }
}

void main() {
  testWidgets('LoginPage widget test', (WidgetTester tester) async {
    // Mock the AuthenticationRepository
    Element context = await initializeWidgetForTest(tester, TestLoginPage());

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

    // Set wrong username and password
    await tester.enterText(usernameInputFinder, 'wrong_username');
    await tester.enterText(passwordInputFinder, 'wrong_password');
    await tester.pump();

    expect(tester.widget<ElevatedButton>(loginInnerBUtton).enabled, true);

    // Tap the login button without entering username and password
    await tester.tap(loginButtonFinder);
    await tester.pump();

    // Verify that error Snackbar is shown when no username and password are entered
    expect(find.byType(SnackBar), findsOneWidget);
  });
}
