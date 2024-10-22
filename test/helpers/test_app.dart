import 'package:authentication_repository/authentication_repository.dart';
import 'package:cache/cache.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:quouch_app/main.dart';
import 'package:quouch_app/pages/authentication/authentication.dart';
import 'package:quouch_app/pages/profile/cubit/profile_cubit.dart';
import 'package:quouch_app/theme/theme.dart';
import 'package:user_repository/user_repository.dart';

import 'mocked_repositories.mocks.dart';

part 'initialize_widget.dart';

final getIt = GetIt.instance;

void testSetup() async {
  AuthenticationRepository authenticationRepository =
      MockAuthenticationRepository();
  UserRepository userRepository = MockUserRepository();
  CacheClient cacheClient = MockCacheClient();
  Dio dio = Dio();
  getIt.registerLazySingleton(() => dio);
  getIt.registerLazySingleton(() => cacheClient);
  getIt.registerLazySingleton(() => authenticationRepository);
  getIt.registerLazySingleton(() => userRepository);
}

void testTearDown() {
  getIt.reset();
}

class TestApp extends StatelessWidget {
  final dynamic home;

  TestApp({required this.home});

  @override
  Widget build(BuildContext context) {
    initCloudinary();
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<AuthenticationRepository>(
            create: (BuildContext context) => getIt<AuthenticationRepository>(),
          ),
          RepositoryProvider<UserRepository>(
            create: (BuildContext context) => getIt<UserRepository>(),
          ),
        ],
        child: MultiBlocProvider(
            providers: [
              BlocProvider<AuthenticationBloc>(
                  lazy: false,
                  create: (context) => AuthenticationBloc(
                      authenticationRepository:
                          getIt<AuthenticationRepository>())
                    ..add(AuthenticationSubscriptionRequested())),
              BlocProvider<ProfileCubit>(
                lazy: false,
                create: (context) => ProfileCubit(getIt<UserRepository>()),
              ),
            ],
            child: MaterialApp(
              home: home,
              theme: AppThemeData.lightThemeData,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
            )));
  }
}
