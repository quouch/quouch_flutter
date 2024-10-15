import 'package:cache/cache.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';

void main() {
  group('CacheClient', () {
    late CacheClient cache;

    setUp(() async {
      SharedPreferencesAsyncPlatform.instance =
          InMemorySharedPreferencesAsync.empty();

      final SharedPreferencesAsync sharedPreferences = SharedPreferencesAsync();
      cache = CacheClient(prefs: sharedPreferences);
    });

    test('can write and read a bool value for a given key', () async {
      const key = '__key__';
      const value = true;
      await cache.writeBool(key: key, value: value);
      expect(await cache.readBool(key: key), equals(value));
    });

    test('can write and read an int value for a given key', () async {
      const key = '__key__';
      const value = 123;
      await cache.writeInt(key: key, value: value);
      expect(await cache.readInt(key: key), equals(value));
    });

    test('can write and read a string value for a given key', () async {
      const key = '__key__';
      const value = '__value__';
      await cache.writeString(key: key, value: value);
      expect(await cache.readString(key: key), equals(value));
    });

    test('can write and read an object for a given key', () async {
      const key = '__key__';
      const value = {'field': 'value'};
      await cache.writeObject(key: key, value: value);
      expect(await cache.readObject(key: key), equals(value));
    });

    test(
        'throws an exception when trying to read an object that is not a valid JSON object',
        () async {
      const key = '__key__';
      const value = '__value__';
      await cache.writeString(key: key, value: value);
      expect(() => cache.readObject(key: key), throwsException);
    });

    test('returns an empty map when trying to read an object that is null',
        () async {
      const key = '__key__';
      var readObject = await cache.readObject(key: key);
      expect(readObject.isEmpty, isTrue);
    });

    test('can remove a value for a given key', () async {
      const key = '__key__';
      const value = '__value__';
      await cache.writeString(key: key, value: value);
      cache.remove(key: key);
      expect(await cache.readString(key: key), isNull);
    });
  });
}
