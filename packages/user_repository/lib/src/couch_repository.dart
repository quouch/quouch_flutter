import 'dart:async';

import 'package:cache/cache.dart';
import 'package:dio/dio.dart';
import 'package:user_repository/src/models/models.dart';

class CouchRepository {
  CouchRepository({Dio? dio, required this.cache, required this.apiBaseUrl}) {
    _dio = dio ?? Dio();
  }

  late final Dio _dio;
  final String apiBaseUrl;
  final CacheClient cache;

  static const couch_cache_key = '__couch_cache_key__';

  get _jwtToken {
    return cache.readJwt();
  }

  get _headers {
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_jwtToken}'
    };
  }

  get _options {
    return Options(headers: _headers);
  }

  Future<List<Couch>> getAvailableCouches() async {
    // Fetch available couches from the API
    var response =
        await _dio.post('${this.apiBaseUrl}/couches', options: _options);
    var couchesData = response.data?['data'];

    return couchesData.map<Couch>((couchData) {
      return Couch.fromJson(couchData['attributes'])!;
    }).toList();
  }

  Future<Couch> getCouchById(int id) async {
    // Fetch couch by id from the API
    var response =
        await _dio.get('${this.apiBaseUrl}/couches/${id}', options: _options);
    var couchData = response.data?['data'];

    return Couch.fromJson(couchData['attributes'])!;
  }
}
