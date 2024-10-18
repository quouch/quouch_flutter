import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:formz/formz.dart';
import 'package:quouch_app/pages/login/login.dart';
import 'package:quouch_app/pages/login/widgets/widgets.dart';
import 'package:quouch_app/theme/theme.dart';
import 'package:quouch_app/widgets/widgets.dart';

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
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    child: Image.asset(
                      'assets/images/login_header.png',
                      width: 300,
                    ),
                  ),
                  AppSpacer(size: SizeKey.xl),
                  Container(
                    child: Text(AppLocalizations.of(context)!.loginTitle,
                        style: AppTextTheme().header5.copyWith(
                            color: Theme.of(context).colorScheme.primary)),
                  ),
                  AppSpacer(size: SizeKey.xl),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      UsernameInput(),
                      AppSpacer(size: SizeKey.sm),
                      PasswordInput(),
                      AppSpacer(size: SizeKey.sm),
                      LoginButton(),
                      AppSpacer(size: SizeKey.thin),
                      ForgotPasswordButton(),
                      AppSpacer(size: SizeKey.thin),
                      SignUpButton(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
