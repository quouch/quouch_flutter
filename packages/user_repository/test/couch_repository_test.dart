import 'dart:convert';
import 'dart:io';

import 'package:cache/cache.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:user_repository/user_repository.dart';

@GenerateNiceMocks([MockSpec<CacheClient>()])
import 'user_repository_test.mocks.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  group('CouchRepository', () {
    late CouchRepository couchRepository;
    late MockCacheClient mockCacheClient;

    File couchesResponseFile = File('test_resources/couches_response.json');
    File singleCouchResponseFile = File('test_resources/couch_response.json');
    late String couchesResponseData;
    late String singleCouchResponseData;

    setUpAll(() async {
      var fileContent = await couchesResponseFile.readAsString();
      // Do this to remove the extra escape characters and line jumps
      couchesResponseData = json.encode(json.decode(fileContent));

      fileContent = await singleCouchResponseFile.readAsString();
      singleCouchResponseData = json.encode(json.decode(fileContent));
    });
    setUp(() async {
      mockCacheClient = MockCacheClient();
      dio = Dio();

      dioAdapter = DioAdapter(dio: dio);
      dio.httpClientAdapter = dioAdapter;
      couchRepository = CouchRepository(
          dio: dio, cache: mockCacheClient, apiBaseUrl: 'localhost');
    });

    test('can get all couches', () async {
      dioAdapter.onPost(
        'localhost/couches',
        (server) => server.reply(200, jsonDecode(couchesResponseData)),
      );

      var couches = await couchRepository.getAvailableCouches();
      expect(couches.length, 15);
      Couch firstCouch = couches.first;
      expect(firstCouch.id, 0);
      expect(firstCouch.userId, 0);
      expect(firstCouch.user?.firstName, 'Ben');
    });

    test('should throw an error when fetching couches', () async {
      dioAdapter.onPost(
        'localhost/couches',
        (server) => server.reply(401, 'Unauthorized'),
      );

      expect(couchRepository.getAvailableCouches(), throwsException);
    });

    test('should get couch by id', () async {
      dioAdapter.onGet(
        'localhost/couches/1',
        (server) => server.reply(200, jsonDecode(singleCouchResponseData)),
      );

      var couch = await couchRepository.getCouchById(1);
      expect(couch.id, 1);
    });

    test('request should include JWT token', () async {
      dioAdapter.onGet(
        'localhost/couches/1',
        (server) => server.reply(200, jsonDecode(singleCouchResponseData)),
      );

      await couchRepository.getCouchById(1);
      verify(mockCacheClient.readJwt()).called(1);
    });
  });
}
