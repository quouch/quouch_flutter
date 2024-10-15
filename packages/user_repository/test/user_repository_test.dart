import 'package:cache/cache.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:user_repository/user_repository.dart';

@GenerateNiceMocks([MockSpec<CacheClient>()])
import 'user_repository_test.mocks.dart';

void main() {
  group('UserRepository', () {
    late UserRepository userRepository;
    late MockCacheClient mockCacheClient;

    setUp(() async {
      mockCacheClient = MockCacheClient();

      userRepository =
          UserRepository(cache: mockCacheClient, apiBaseUrl: 'localhost');
    });

    test('can get the current user', () async {
      const value = {'id': '1', 'name': 'Test User'};

      when(mockCacheClient.readObject(key: anyNamed('key')))
          .thenAnswer((_) async => value);

      var user = await userRepository.currentUser;
      expect(user.id, equals(value['id']));
      expect(user.name, equals(value['name']));
    });

    test('can get the user', () async {
      const value = {'id': '1', 'name': 'Test User'};

      when(mockCacheClient.readObject(key: anyNamed('key')))
          .thenAnswer((_) async => value);

      User? user = await userRepository.getUser();
      expect(user!.id, equals(value['id']));
      expect(user.name, equals(value['name']));
    });
  });
}
