import 'dart:async';

import 'package:cache/cache.dart';
import 'package:user_repository/src/models/models.dart';

class UserRepository {
  UserRepository({CacheClient? cache, required this.apiBaseUrl})
      : _cache = cache ?? CacheClient();
  final String apiBaseUrl;
  final CacheClient _cache;

  static const userCacheKey = '__user_cache_key__';

  User? _user;

  /// Returns the current cached user.
  /// Defaults to [User.empty] if there is no cached user.
  Future<User> get currentUser async {
    var userData = await _cache.readObject(key: userCacheKey);
    return User.fromJson(userData);
  }

  Future<User?> getUser() async {
    if (_user != null) return _user;
    _user = await currentUser;
    return Future.value(_user);
  }
}
