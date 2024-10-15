import 'dart:async';
import 'dart:convert';

import 'package:cache/cache.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:user_repository/user_repository.dart';

part 'authentication_failure.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  AuthenticationRepository(
      {CacheClient? cache, http.Client? httpClient, required this.apiBaseUrl})
      : _cache = cache ?? CacheClient(),
        _httpClient = httpClient ?? http.Client();
  final CacheClient _cache;
  final http.Client _httpClient;
  final _controller = StreamController<AuthenticationStatus>();

  final String apiBaseUrl;

  /// Whether or not the current environment is web
  /// Should only be overridden for testing purposes. Otherwise,
  /// defaults to [kIsWeb]
  @visibleForTesting
  bool isWeb = kIsWeb;

  /// User cache key.
  /// Should only be used for testing purposes.
  @visibleForTesting
  static const userCacheKey = '__user_cache_key__';

  @visibleForTesting
  StreamController<AuthenticationStatus> get controller => _controller;

  /// Returns the current cached user.
  /// Defaults to [User.empty] if there is no cached user.
  Future<User> get currentUser async {
    var user = await _cache.readObject(key: userCacheKey);
    if (user.isEmpty) {
      return User.empty;
    }
    return User.fromJson(user);
  }

  Stream<AuthenticationStatus> get status async* {
    var cachedUser = await currentUser;
    if (cachedUser.id != '-') {
      yield AuthenticationStatus.authenticated;
    } else {
      yield AuthenticationStatus.unauthenticated;

      yield* _controller.stream;
    }
  }

  Future<void> _saveUser({required User user}) async {
    _cache.writeObject(key: userCacheKey, value: user.toJson());
  }

  Future<void> _clearUser() async {
    _cache.remove(key: userCacheKey);
  }

  get _headers {
    return {
      'Content-Type': 'application/json',
    };
  }

  Future<void> logIn({
    required String email,
    required String password,
  }) {
    var body = {
      'user': {'email': email, 'password': password}
    };
    return _httpClient
        .post(Uri.parse('${this.apiBaseUrl}/login'),
            body: jsonEncode(body), headers: _headers)
        .then((response) {
      if (response.statusCode != 200) {
        throw AuthenticationFailure.fromCode(response.statusCode);
      } else {
        var userData = jsonDecode(response.body)['data'];
        _saveUser(user: User.fromJson(userData));
        _controller.add(AuthenticationStatus.authenticated);
      }
    });
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
    _clearUser();
  }

  void dispose() => _controller.close();
}
