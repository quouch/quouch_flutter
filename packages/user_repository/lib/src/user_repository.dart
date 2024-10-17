import 'dart:async';

import 'package:cache/cache.dart';
import 'package:user_repository/src/models/models.dart';

class UserRepository {
  UserRepository({required this.cache, required this.apiBaseUrl});

  final String apiBaseUrl;
  final CacheClient cache;

  static const userCacheKey = '__user_cache_key__';

  User? _user;

  /// Returns the current cached user.
  /// Defaults to [User.empty] if there is no cached user.
  Future<User> get currentUser async {
    var userData = await cache.readObject(key: userCacheKey);
    return User.fromJson(userData);
  }

  Future<User?> getUser() async {
    if (_user != null) return _user;
    _user = await currentUser;
    return Future.value(_user);
  }
}
