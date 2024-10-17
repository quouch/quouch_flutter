import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:cache/cache.dart';
import 'package:mockito/annotations.dart';
import 'package:quouch_app/pages/pages.dart';
import 'package:user_repository/user_repository.dart';

@GenerateNiceMocks([
  MockSpec<CacheClient>(),
  MockSpec<UserRepository>(),
  MockSpec<AuthenticationRepository>()
])
class MockAuthenticationBloc
    extends MockBloc<AuthenticationEvent, AuthenticationState>
    implements AuthenticationBloc {}

class MockLoginBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}
