import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quouch_app/pages/login/view/forgot_password_page.dart';
import 'package:quouch_app/theme/theme.dart';

class ForgotPasswordButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      key: const Key('loginForm_forgotPassword_textButton'),
      onPressed: () =>
          Navigator.of(context).push<void>(ForgotPasswordPage.route()),
      child: Text(
        AppLocalizations.of(context)!.loginForgotPasswordButton,
        style: AppTextTheme().buttonExtraSmall,
      ),
      style: AppButtonsTheme().neutralLink,
    );
  }
}
