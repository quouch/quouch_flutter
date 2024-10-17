
import 'package:flutter_test/flutter_test.dart';
import 'package:user_repository/user_repository.dart';

void main() {
  group('User', () {
    test('values should be set correctly in constructor', () {
      final user = User(id: '123', name: 'Test User');
      expect(user.id, '123');
      expect(user.name, 'Test User');
    });

    test('props should return correct values', () {
      final user = User(id: '123', name: 'Test User');
      expect(user.props, ['123', 'Test User']);
    });

    test('fromJson should return correct User', () {
      final user = User.fromJson({
        'id': '123',
        'name': 'Test User',
      });
      expect(user.id, '123');
      expect(user.name, 'Test User');
    });

    test('toJson should return correct json map', () {
      final user = User(id: '123', name: 'Test User');
      expect(user.toJson(), {
        'id': '123',
        'name': 'Test User',
      });
    });
  });
}
