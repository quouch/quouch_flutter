import 'package:flutter_test/flutter_test.dart';
import 'package:user_repository/user_repository.dart';

void main() {
  final characteristicData = '{\"id\":123,\"name\":\"Test\"}';

  group('Characteristic', () {
    test('fromJson should return correct Characteristic', () async {
      final characteristic = Characteristic.fromJsonString(characteristicData)!;
      expect(characteristic.id, 123);
      expect(characteristic.name, 'Test');
    });

    test('toJson should return correct json map', () {
      final characteristic = Characteristic((b) => b
        ..id = 123
        ..name = 'Test');

      expect(characteristic.toJsonString(), characteristicData);
    });
  });
}
