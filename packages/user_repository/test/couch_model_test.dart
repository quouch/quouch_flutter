import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:user_repository/user_repository.dart';

void main() {
  group('Couch', () {
    final file = new File('test_resources/couch_data.json');
    late final String couchData;

    setUpAll(() async {
      var fileContent = await file.readAsString();
      couchData = json.encode(json.decode(fileContent));
    });

    test('should create an empty couch', () {
      final couch = Couch.empty;
      expect(couch.isEmpty, true);
      expect(couch.id, -1);
    });

    test('fromJson should return correct Couch', () async {
      final couch = Couch.fromJsonString(couchData)!;
      expect(couch.id, 10);
      expect(couch.capacity, 1);
      expect(couch.active, true);
      expect(couch.userId, 1);
      expect(couch.user!.id, 1);
    });

    test('toJson should return correct json map', () {
      final couch = Couch.fromJsonString(couchData)!;

      expect(couch.toJsonString(), couchData);
    });
  });
}
