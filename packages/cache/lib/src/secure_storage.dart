import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageClient {
  SecureStorageClient({FlutterSecureStorage? storage})
      : storage = storage ?? FlutterSecureStorage();

  final FlutterSecureStorage storage;

  Future<void> write({required String key, required String value}) async {
    await storage.write(key: key, value: value);
  }

  Future<String?> read({required String key}) async {
    return await storage.read(key: key);
  }

  Future<void> delete({required String key}) async {
    await storage.delete(key: key);
  }

}
