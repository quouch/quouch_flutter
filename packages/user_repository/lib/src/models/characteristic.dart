library characteristic;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_repository/src/models/serializers.dart';

part 'characteristic.g.dart';

abstract class Characteristic
    implements Built<Characteristic, CharacteristicBuilder> {
  Characteristic._();

  factory Characteristic([updates(CharacteristicBuilder b)]) = _$Characteristic;

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'name')
  String get name;

  Object? toJson() {
    return serializers.serializeWith(Characteristic.serializer, this);
  }

  static Characteristic? fromJson(Object json) {
    return serializers.deserializeWith(Characteristic.serializer, json);
  }

  String toJsonString() {
    return json.encode(toJson());
  }

  static Characteristic? fromJsonString(String jsonString) {
    return fromJson(json.decode(jsonString));
  }

  static Serializer<Characteristic> get serializer =>
      _$characteristicSerializer;
}
