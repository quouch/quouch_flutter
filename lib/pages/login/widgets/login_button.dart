import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:formz/formz.dart';
import 'package:quouch_app/pages/login/login.dart';
import 'package:quouch_app/theme/theme.dart';

class LoginButton extends StatelessWidget {
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
        child: Text(AppLocalizations.of(context)!.loginButton.toUpperCase(),
            style: AppTextTheme().buttonLarge));
  }
}
