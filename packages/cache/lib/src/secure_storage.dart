import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageClient {
  SecureStorageClient({FlutterSecureStorage? storage})
      : storage = storage ?? FlutterSecureStorage();

  final FlutterSecureStorage storage;

  final _jwtKey = 'jwt';

  Future<void> write({required String key, required String value}) async {
    await storage.write(key: key, value: value);
  }

  Future<String?> read({required String key}) async {
    return await storage.read(key: key);
  }

  Future<void> delete({required String key}) async {
    await storage.delete(key: key);
  }

  Future<void> writeJwt({required String value}) async {
    await write(key: _jwtKey, value: value);
  }

  Future<String?> readJwt() async {
    return await read(key: _jwtKey);
  }

  Future<void> deleteJwt() async {
    await delete(key: _jwtKey);
  }
}
