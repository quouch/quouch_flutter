import 'package:faker/faker.dart';
import 'package:user_repository/user_repository.dart';

var faker = new Faker();

List<User> userList = List.generate(
  10,
  (index) => generateFakeUser(index),
);

User generateFakeUser(int id) {
  return User(
    (b) => b
      ..id = id
      ..createdAt = faker.date.dateTime()
      ..updatedAt = faker.date.dateTime()
      ..firstName = faker.person.firstName()
      ..lastName = faker.person.lastName()
      ..email = faker.internet.email()
      ..dateOfBirth = faker.date.dateTime()
      ..summary = faker.lorem.sentence()
      ..city = faker.address.city()
      ..country = faker.address.country()
      ..address = faker.address.streetAddress()
      ..zipCode = faker.address.zipCode()
      ..offersCouch = false
      ..offersHangout = false
      ..offersCoWork = true
      ..travelling = false
      ..age = faker.randomGenerator.integer(60, min: 18)
      ..photoUrl = faker.image.loremPicsum(),
  );
}
