import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:formz/formz.dart';
import 'package:quouch_app/pages/login/login.dart';
import 'package:quouch_app/pages/login/view/sign_up_page.dart';
import 'package:quouch_app/theme/theme.dart';

import 'forgot_password_page.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final spacing = Theme.of(context).extension<AppSpacing>()!;

    return BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.status.isFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(content: Text(state.error)),
              );
          }
        },
        child: Align(
          child: Padding(
            padding: EdgeInsets.all(spacing.lg),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  flex: 3,
                  child: Image.asset(
                    'assets/images/login_header.png',
                    width: 300,
                  ),
                ),
                Spacer(flex: 1),
                Flexible(
                  flex: 2,
                  child: Text('Welcome back!',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(
                              color: Theme.of(context).colorScheme.primary)),
                ),
                Spacer(flex: 1),
                Flexible(
                    flex: 5,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _UsernameInput(),
                        const Padding(padding: EdgeInsets.all(12)),
                        _PasswordInput(),
                        const Padding(padding: EdgeInsets.all(12)),
                        _LoginButton(),
                        _ForgotPasswordButton(),
                        _SignUpButton(),
                      ],
                    )),
              ],
            ),
          ),
        ));
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final displayError = context.select(
      (LoginBloc bloc) => bloc.state.username.displayError,
    );

    var localizations = AppLocalizations.of(context)!;
    return TextField(
      key: const Key('loginForm_usernameInput_textField'),
      onChanged: (username) {
        context.read<LoginBloc>().add(LoginUsernameChanged(username));
      },
      decoration: InputDecoration(
        labelText: localizations.userEmail,
        errorText: displayError != null ? localizations.userEmailInvalid : null,
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final displayError = context.select(
      (LoginBloc bloc) => bloc.state.password.displayError,
    );
    var localizations = AppLocalizations.of(context)!;

    return TextField(
      key: const Key('loginForm_passwordInput_textField'),
      onChanged: (password) {
        context.read<LoginBloc>().add(LoginPasswordChanged(password));
      },
      obscureText: true,
      decoration: InputDecoration(
        labelText: localizations.userPassword,
        errorText:
            displayError != null ? localizations.userPasswordInvalid : null,
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isInProgressOrSuccess = context.select(
      (LoginBloc bloc) => bloc.state.status.isInProgressOrSuccess,
    );

    if (isInProgressOrSuccess) return const CircularProgressIndicator();

    final isValid = context.select((LoginBloc bloc) => bloc.state.isValid);

    return ElevatedButton(
      key: const Key('loginForm_continue_raisedButton'),
      onPressed: isValid
          ? () => context.read<LoginBloc>().add(const LoginSubmitted())
          : null,
      child: const Text('Login'),
    );
  }
}

class _ForgotPasswordButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      key: const Key('loginForm_forgotPassword_textButton'),
      onPressed: () =>
          Navigator.of(context).push<void>(ForgotPasswordPage.route()),
      child:
          const Text('Forgot password?', style: TextStyle(color: Colors.grey)),
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      key: const Key('loginForm_signUp_textButton'),
      onPressed: () => Navigator.of(context).push<void>(SignUpPage.route()),
      child: const Text('Sign Up'),
    );
  }
}
