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
    try {
      var userData = await cache.readString(key: userCacheKey);
      var user = User.fromJsonString(userData!)!;
      return user;
    } catch (e) {
      return User.empty;
    }
  }

  Stream<AuthenticationStatus> get status async* {
    var cachedUser = await currentUser;
    if (cachedUser.isEmpty) {
      yield AuthenticationStatus.unauthenticated;

      yield* _controller.stream;
    } else {
      yield AuthenticationStatus.authenticated;
    }
  }

  Future<void> _saveUser({required User user}) async {
    var json = user.toJsonString();
    cache.writeString(key: userCacheKey, value: json);
  }

  Future<void> _clearUser() async {
    cache.remove(key: userCacheKey);
    cache.deleteJwt();
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
      var user = User.fromJson(userData['attributes']);

      if (user == null) {
        throw AuthenticationFailure.fromCode(500);
      }
      _saveUser(user: user);
      extractAndSaveJwtToken(response);
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

  @visibleForTesting
  void extractAndSaveJwtToken(Response response) {
    var jwtToken = response.headers.map['authorization']?.first;
    if (jwtToken != null) {
      _saveJwtToken(jwtToken: jwtToken);
    }
  }

  Future<void> _saveJwtToken({required String jwtToken}) async {
    cache.writeJwt(value: jwtToken);
  }
}
