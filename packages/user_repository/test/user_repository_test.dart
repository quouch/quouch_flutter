import 'dart:convert';
import 'dart:io';

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
    final file = new File('test_resources/user_data.json');
    late final String userDataString;
    late final User expectedUser;

    setUpAll(() async {
      var fileContent = await file.readAsString();
      // Do this to remove the extra escape characters and line jumps
      userDataString = json.encode(json.decode(fileContent));
      mockCacheClient = MockCacheClient();

      userRepository =
          UserRepository(cache: mockCacheClient, apiBaseUrl: 'localhost');
      expectedUser = User.fromJsonString(userDataString)!;
    });

    test('can get the current user', () async {
      when(mockCacheClient.readString(key: anyNamed('key')))
          .thenAnswer((_) async => userDataString);

      var user = await userRepository.currentUser;
      expect(user!.id, expectedUser.id);
      expect(user.firstName, expectedUser.firstName);
    });

    test('can get the user', () async {
      when(mockCacheClient.readString(key: anyNamed('key')))
          .thenAnswer((_) async => userDataString);

      User? user = await userRepository.getUser();
      expect(user!.id, expectedUser.id);
      expect(user.firstName, expectedUser.firstName);
    });
  });
}
