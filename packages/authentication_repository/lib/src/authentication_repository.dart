import 'dart:async';

import 'package:cache/cache.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:user_repository/user_repository.dart';

part 'authentication_failure.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  AuthenticationRepository(
      {Dio? dio, required this.cache, required this.apiBaseUrl}) {
    _dio = dio ?? Dio();
  }

  final CacheClient cache;
  late final Dio _dio;
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
    var user = await cache.readObject(key: userCacheKey);
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
    var json = user.toJson();
    cache.writeObject(key: userCacheKey, value: json);
  }

  Future<void> _clearUser() async {
    cache.remove(key: userCacheKey);
  }

  get _headers {
    return {
      'Content-Type': 'application/json',
    };
  }

  get _options {
    return Options(headers: _headers);
  }

  Future<void> logIn({
    required String email,
    required String password,
  }) async {
    var body = {
      'user': {'email': email, 'password': password}
    };
    try {
      var response = await _dio.post('${this.apiBaseUrl}/login',
          data: body, options: _options);
      var userData = response.data?['data'];
      _saveUser(user: User.fromJson(userData));
      _controller.add(AuthenticationStatus.authenticated);
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        int statusCode = e.response?.statusCode ?? 500;
        throw AuthenticationFailure.fromCode(statusCode);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        throw AuthenticationFailure();
      }
    }
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
    _clearUser();
  }

  void dispose() => _controller.close();
}
