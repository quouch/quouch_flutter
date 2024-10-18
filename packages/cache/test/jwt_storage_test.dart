import 'package:cache/cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  group('CacheClient secure storage', () {
    late final CacheClient cacheClient;

    setUpAll(() {
      SharedPreferences.setMockInitialValues({});
      FlutterSecureStorage.setMockInitialValues({});
      SharedPreferencesAsyncPlatform.instance =
          InMemorySharedPreferencesAsync.empty();

      final SharedPreferencesAsync sharedPreferences = SharedPreferencesAsync();
      cacheClient = CacheClient(prefs: sharedPreferences);
    });

    test('write and read jwt', () async {
      await cacheClient.writeJwt(value: 'test_jwt');
      final jwt = await cacheClient.readJwt();

      expect(jwt, 'test_jwt');
    });

    test('delete jwt', () async {
      await cacheClient.deleteJwt();
      final jwt = await cacheClient.readJwt();

      expect(jwt, null);
    });

    test('write and change jwt', () async {
      await cacheClient.writeJwt(value: 'test_jwt');
      await cacheClient.writeJwt(value: 'new_jwt');

      final jwt = await cacheClient.readJwt();
      expect(jwt, 'new_jwt');
    });
  });
}
