part of 'test_app.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {
  @override
  get status => Stream<AuthenticationStatus>.empty();
}

class MockUserRepository extends Mock implements UserRepository {}

class MockAuthenticationBloc
    extends MockBloc<AuthenticationEvent, AuthenticationState>
    implements AuthenticationBloc {}

class MockLoginBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}

class MockCacheClient extends Mock implements CacheClient {}
