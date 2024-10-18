import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:user_repository/user_repository.dart';

void main() {
  group('User', () {
    final file = new File('test_resources/user_data.json');
    late final String userData;

    setUpAll(() async {
      var fileContent = await file.readAsString();
      // Do this to remove the extra escape characters and line jumps
      userData = json.encode(json.decode(fileContent));
    });

    test('should create an empty user', () {
      final user = User.empty;
      expect(user.isEmpty, true);
      expect(user.id, -1);
    });

    test('fromJson should return correct User', () async {
      final User user = User.fromJsonString(userData)!;
      expect(user.id, 1);
      expect(user.firstName, 'Malcolm');
      expect(user.lastName, 'Reynolds');
      expect(user.email, 'mreynolds@verse.com');
      expect(user.dateOfBirth, DateTime.utc(1999, 10, 18));
    });

    test('toJson should return correct json map', () {
      final user = User.fromJsonString(userData)!;

      expect(user.toJsonString(), userData);
    });
  });
}
