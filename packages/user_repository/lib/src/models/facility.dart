import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'facility.g.dart';

abstract class Facility implements Built<Facility, FacilityBuilder> {
  static Serializer<Facility> get serializer => _$facilitySerializer;

  // Can never be null.
  int get id;

  String get name;

  Facility._();

  factory Facility([void Function(FacilityBuilder) updates]) = _$Facility;

  Object? toJson() {
    return serializers.serializeWith(Facility.serializer, this);
  }

  static Facility? fromJson(Object json) {
    return serializers.deserializeWith(Facility.serializer, json);
  }

  String toJsonString() {
    return json.encode(toJson());
  }

  static Facility? fromJsonString(String jsonString) {
    return fromJson(json.decode(jsonString));
  }
}
