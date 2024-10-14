import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:quouch_app/main.dart';
import 'package:quouch_app/pages/authentication/authentication.dart';
import 'package:quouch_app/theme/theme.dart';
import 'package:user_repository/user_repository.dart';

part 'initialize_widget.dart';

part 'mocked_repositories.dart';

class TestApp extends StatelessWidget {
  final dynamic home;

  const TestApp({required this.home});

  @override
  Widget build(BuildContext context) {
    initCloudinary();
    var mockAuthenticationRepository = MockAuthenticationRepository();
    var mockUserRepository = MockUserRepository();

    return RepositoryProvider.value(
      value: mockAuthenticationRepository,
      child: BlocProvider(
          lazy: false,
          create: (_) => AuthenticationBloc(
                authenticationRepository: mockAuthenticationRepository,
                userRepository: mockUserRepository,
              )..add(AuthenticationSubscriptionRequested()),
          child: MaterialApp(
            home: home,
            theme: AppThemeData.lightThemeData,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
          )),
    );
  }
}
