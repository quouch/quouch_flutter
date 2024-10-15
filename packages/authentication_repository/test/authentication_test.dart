import 'dart:convert';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:cache/cache.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<CacheClient>(), MockSpec<http.Client>()])
import 'authentication_test.mocks.dart';

void main() {
  group('AuthenticationRepository', () {
    late AuthenticationRepository authenticationRepository;
    late MockCacheClient mockCacheClient;
    late MockClient mockHttpClient;

    setUp(() {
      mockCacheClient = MockCacheClient();
      mockHttpClient = MockClient();
      authenticationRepository = AuthenticationRepository(
        cache: mockCacheClient,
        httpClient: mockHttpClient,
        apiBaseUrl: 'http://localhost:3000',
      );
    });

    test('returns AuthenticationStatus.unauthenticated when user is not cached',
        () async {
      when(mockCacheClient.readObject(key: anyNamed("key")))
          .thenAnswer((_) async => {});

      expect(await authenticationRepository.status.first,
          AuthenticationStatus.unauthenticated);
    });

    test('returns AuthenticationStatus.authenticated when user is cached',
        () async {
      when(mockCacheClient.readObject(key: anyNamed('key')))
          .thenAnswer((_) async => {'id': '1'});

      expect(await authenticationRepository.status.first,
          AuthenticationStatus.authenticated);
    });

    test('logIn makes a POST request and updates the status', () async {
      var user = {'id': '1'};
      var returnedData = jsonEncode({'data': user});
      when(mockHttpClient.post(any,
              body: anyNamed('body'), headers: anyNamed('headers')))
          .thenAnswer((_) => Future.value(http.Response(returnedData, 200)));

      await authenticationRepository.logIn(
          email: 'test@test.com', password: 'password');
      verify(mockHttpClient.post(any,
              body: anyNamed('body'), headers: anyNamed('headers')))
          .called(1);
      verify(mockCacheClient.writeObject(key: anyNamed('key'), value: user))
          .called(1);
      var newStatus = await authenticationRepository.controller.stream.first;
      expect(newStatus, AuthenticationStatus.authenticated);
    });

    test('logIn throws error if authentication does not work', () async {
      when(mockHttpClient.post(any,
              body: anyNamed('body'), headers: anyNamed('headers')))
          .thenAnswer((_) => Future.value(http.Response('', 401)));

      expect(
          () => authenticationRepository.logIn(
              email: 'test', password: 'password'),
          throwsA(isA<AuthenticationFailure>()));
      // Check that the message is 'Unauthorized'
      expect(
          () => authenticationRepository.logIn(
              email: 'test', password: 'password'),
          throwsA(
              predicate((e) => e.toString() == 'Login error: Unauthorized')));
    });

    test('logIn throws error if credentials are wrong', () async {
      when(mockHttpClient.post(any,
              body: anyNamed('body'), headers: anyNamed('headers')))
          .thenAnswer((_) => Future.value(http.Response('', 422)));
      expect(
          () => authenticationRepository.logIn(
              email: 'test', password: 'password'),
          throwsA(predicate(
              (e) => e.toString() == 'Login error: Invalid credentials')));
    });

    test('logOut clears the user cache and updates the status', () async {
      authenticationRepository.logOut();

      verify(mockCacheClient.remove(key: anyNamed('key'))).called(1);
      expect(await authenticationRepository.status.first,
          AuthenticationStatus.unauthenticated);
    });
  });
}
