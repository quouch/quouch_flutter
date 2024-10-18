import 'package:flutter_test/flutter_test.dart';
import 'package:user_repository/user_repository.dart';

void main() {
  final facilityData = '{\"id\":111,\"name\":\"Bed\"}';

  group('Facility', () {
    test('fromJson should return correct Facility', () async {
      final characteristic = Facility.fromJsonString(facilityData)!;
      expect(characteristic.id, 111);
      expect(characteristic.name, 'Bed');
    });

    test('toJson should return correct json map', () {
      final facility = Facility((b) => b
        ..id = 111
        ..name = 'Bed');

      expect(facility.toJsonString(), facilityData);
    });
  });
}
