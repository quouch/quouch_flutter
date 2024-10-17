import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mockito/mockito.dart';
import 'package:quouch_app/pages/authentication/bloc/authentication_bloc.dart';
import 'package:test/test.dart';
import 'package:user_repository/user_repository.dart';

import '../helpers/mocked_repositories.mocks.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  group('AuthenticationBloc Success Scenarios', () {
    AuthenticationRepository authenticationRepository;
    UserRepository userRepository;
    late AuthenticationBloc authenticationBloc;
    late Dio dio;
    late DioAdapter dioAdapter;
    late MockCacheClient cache;
    String baseUrl = 'http://localhost:3000';
    String loginUrl = '$baseUrl/login';

    setUp(() {
      dio = Dio();
      dioAdapter = DioAdapter(dio: dio);
      dio.httpClientAdapter = dioAdapter;
      cache = MockCacheClient();
      userRepository = UserRepository(cache: cache, apiBaseUrl: baseUrl);
      authenticationRepository =
          AuthenticationRepository(cache: cache, apiBaseUrl: baseUrl, dio: dio);
      authenticationBloc = AuthenticationBloc(
        authenticationRepository: authenticationRepository,
        userRepository: userRepository,
      );
    });

    blocTest<AuthenticationBloc, AuthenticationState>(
      'When data is empty',
      setUp: (() {
        return dioAdapter.onGet(
          loginUrl,
          (request) => request.reply(200, []),
        );
      }),
      build: () => authenticationBloc,
      act: (bloc) => bloc.add(AuthenticationSubscriptionRequested()),
      expect: () => [AuthenticationState.unauthenticated()],
    );

    blocTest<AuthenticationBloc, AuthenticationState>(
      'When data is not empty',
      setUp: (() {
        when(cache.readObject(key: anyNamed('key')))
            .thenAnswer((_) async => {'id': '1', 'name': 'Test User'});
      }),
      build: () => authenticationBloc,
      act: (bloc) => bloc.add(AuthenticationSubscriptionRequested()),
      expect: () =>
          [AuthenticationState.authenticated(User(id: '1', name: 'Test User'))],
    );

    blocTest<AuthenticationBloc, AuthenticationState>(
      'When user logs out',
      build: () => authenticationBloc,
      act: (bloc) => bloc.add(AuthenticationLogoutPressed()),
      expect: () => [AuthenticationState.unauthenticated()],
    );
  });
}
