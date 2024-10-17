import 'package:authentication_repository/authentication_repository.dart';
import 'package:cache/cache.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<CacheClient>()])
import 'authentication_test.mocks.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  group('AuthenticationRepository', () {
    late AuthenticationRepository authenticationRepository;
    late MockCacheClient mockCacheClient;

    String baseUrl = 'http://localhost:3000';
    String loginUrl = '$baseUrl/login';
    Map<String, String> user = {'id': '1', 'name': 'Test User'};
    var returnedData = {'data': user};
    DioException dioError = DioException(
      error: {'message': 'Some beautiful error!'},
      requestOptions: RequestOptions(path: '/login'),
      response: Response(
        statusCode: 401,
        requestOptions: RequestOptions(path: '/login'),
      ),
    );

    Map<String, String> userCredentials = <String, String>{
      'email': 'test@example.com',
      'password': 'password',
    };

    setUp(() {
      mockCacheClient = MockCacheClient();
      dio = Dio();

      dioAdapter = DioAdapter(dio: dio);
      dio.httpClientAdapter = dioAdapter;

      authenticationRepository = AuthenticationRepository(
        cache: mockCacheClient,
        dio: dio,
        apiBaseUrl: baseUrl,
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
      dioAdapter.onPost(
        loginUrl,
        (request) => request.reply(200, returnedData),
        data: {"user": userCredentials},
      );

      await authenticationRepository.logIn(
          email: userCredentials['email'] as String,
          password: userCredentials['password'] as String);
      verify(mockCacheClient.writeObject(
              key: anyNamed('key'), value: anyNamed('value')))
          .called(1);
      var newStatus = await authenticationRepository.controller.stream.first;
      expect(newStatus, AuthenticationStatus.authenticated);
    });

    test('logIn throws error if authentication does not work', () async {
      dioError.response?.statusCode = 401;

      dioAdapter.onPost(
        loginUrl,
        (request) => request.throws(401, dioError),
        data: {"user": userCredentials},
      );
      expect(
          () async => await authenticationRepository.logIn(
              email: userCredentials['email'] as String,
              password: userCredentials['password'] as String),
          throwsA(isA<AuthenticationFailure>()));
      // Check that the message is 'Unauthorized'
      expect(
          () async => await authenticationRepository.logIn(
              email: userCredentials['email'] as String,
              password: userCredentials['password'] as String),
          throwsA(
              predicate((e) => e.toString() == 'Login error: Unauthorized')));
    });

    test('logIn throws error if credentials are wrong', () async {
      dioError.response?.statusCode = 422;
      dioAdapter.onPost(
        '$baseUrl/login',
        (request) => request.throws(422, dioError),
        data: {"user": userCredentials},
      );
      expect(
          () async => await authenticationRepository.logIn(
              email: userCredentials['email'] as String,
              password: userCredentials['password'] as String),
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
