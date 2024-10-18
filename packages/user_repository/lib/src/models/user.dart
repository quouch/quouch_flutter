import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'models.dart';

part 'user.g.dart';

abstract class User implements Built<User, UserBuilder> {
  static Serializer<User> get serializer => _$userSerializer;

  // Can never be null.
  int get id;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: 'updated_at')
  DateTime? get updatedAt;

  @BuiltValueField(wireName: 'email')
  String? get email;

  @BuiltValueField(wireName: 'first_name')
  String? get firstName;

  @BuiltValueField(wireName: 'last_name')
  String? get lastName;

  @BuiltValueField(wireName: 'date_of_birth')
  DateTime? get dateOfBirth;

  int? get age;

  String? get summary;

  String? get city;

  String? get country;

  String? get address;

  @BuiltValueField(wireName: 'zipcode')
  String? get zipCode;

  @BuiltValueField(wireName: 'offers_couch')
  bool? get offersCouch;

  @BuiltValueField(wireName: 'offers_hang_out')
  bool? get offersHangout;

  @BuiltValueField(wireName: 'offers_co_work')
  bool? get offersCoWork;

  bool? get travelling;

  @BuiltValueField(wireName: 'photo')
  String? get photoUrl;

  BuiltList<Characteristic> get characteristics;

  Couch? get couch;

  User._();

  get isEmpty => id == -1;

  static User empty = User((b) => b..id = -1);

  factory User([void Function(UserBuilder) updates]) = _$User;

  Object? toJson() {
    return serializers.serializeWith(User.serializer, this);
  }

  static User? fromJson(dynamic json) {
    return serializers.deserializeWith(User.serializer, json);
  }

  String toJsonString() {
    return json.encode(toJson());
  }

  static User? fromJsonString(String jsonString) {
    return fromJson(json.decode(jsonString));
  }
}
