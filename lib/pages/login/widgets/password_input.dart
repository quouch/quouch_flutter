import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quouch_app/pages/login/login.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({Key? key}) : super(key: key);

  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  final textFieldFocusNode = FocusNode();
  bool _obscured = true;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus)
        return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus =
          false; // Prevents focus if tap on eye
    });
  }

  @override
  Widget build(BuildContext context) {
    final displayError = context.select(
      (LoginBloc bloc) => bloc.state.password.displayError,
    );
    var localizations = AppLocalizations.of(context)!;
    return TextField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: _obscured,
      focusNode: textFieldFocusNode,
      key: const Key('loginForm_passwordInput_textField'),
      onChanged: (password) {
        context.read<LoginBloc>().add(LoginPasswordChanged(password));
      },
      decoration: InputDecoration(
        labelText: localizations.userPassword,
        errorText:
            displayError != null ? localizations.userPasswordInvalid : null,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
          child: GestureDetector(
            onTap: _toggleObscured,
            child: Icon(
              _obscured
                  ? Icons.visibility_rounded
                  : Icons.visibility_off_rounded,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}
