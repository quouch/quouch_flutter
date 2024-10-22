import 'package:cache/cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  group('SecureStorageClient', () {
    late final SecureStorageClient secureStorageClient;

    final testKey = 'test_key';
    setUpAll(() {
      FlutterSecureStorage.setMockInitialValues({});
      secureStorageClient = SecureStorageClient();
    });

    test('write and read by key', () async {
      await secureStorageClient.write(key: testKey, value: 'test_jwt');
      final jwt = await secureStorageClient.read(key: testKey);

      expect(jwt, 'test_jwt');
    });

    test('delete by key', () async {
      await secureStorageClient.delete(key: testKey);
      final jwt = await secureStorageClient.read(key: testKey);

      expect(jwt, null);
    });

    test('write and change by key', () async {
      await secureStorageClient.write(key: testKey, value: 'test_jwt');
      await secureStorageClient.write(key: testKey, value: 'new_jwt');

      final jwt = await secureStorageClient.read(key: testKey);
      expect(jwt, 'new_jwt');
    });
  });
}
