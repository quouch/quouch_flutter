import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quouch_app/pages/login/login.dart';


class UsernameInput extends StatelessWidget {
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

