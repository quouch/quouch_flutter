import 'package:cache/cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  group('SecureStorageClient', () {
    late final SecureStorageClient secureStorageClient;

    setUpAll(() {
      FlutterSecureStorage.setMockInitialValues({});
      secureStorageClient = SecureStorageClient();
    });

    test('write and read jwt', () async {
      await secureStorageClient.writeJwt(value: 'test_jwt');
      final jwt = await secureStorageClient.readJwt();

      expect(jwt, 'test_jwt');
    });

    test('delete jwt', () async {
      await secureStorageClient.deleteJwt();
      final jwt = await secureStorageClient.readJwt();

      expect(jwt, null);
    });

    test('write and change jwt', () async {
      await secureStorageClient.writeJwt(value: 'test_jwt');
      await secureStorageClient.writeJwt(value: 'new_jwt');

      final jwt = await secureStorageClient.readJwt();
      expect(jwt, 'new_jwt');
    });
  });
}
