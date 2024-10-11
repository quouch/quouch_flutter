import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quouch_app/pages/login/view/sign_up_page.dart';
import 'package:quouch_app/theme/theme.dart';

class SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      key: const Key('loginForm_signUp_textButton'),
      onPressed: () => Navigator.of(context).push<void>(SignUpPage.route()),
      child: Text(
        AppLocalizations.of(context)!.loginSignUpButton,
        style: AppTextTheme().body3,
      ),
      style: AppButtonsTheme().primaryLink,
    );
  }
}
