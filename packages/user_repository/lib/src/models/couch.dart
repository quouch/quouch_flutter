import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'models.dart';

part 'couch.g.dart';

abstract class Couch implements Built<Couch, CouchBuilder> {
  static Serializer<Couch> get serializer => _$couchSerializer;

  // Can never be null.
  int get id;

  @BuiltValueField(wireName: 'user_id')
  int? get userId;

  int? get capacity;

  bool? get active;

  double? get rating;

  User? get user;

  BuiltList<Facility> get facilities;

  get isEmpty => id == -1;

  static var empty = Couch((b) => b..id = -1);

  Couch._();

  factory Couch([void Function(CouchBuilder) updates]) = _$Couch;

  Object? toJson() {
    return serializers.serializeWith(Couch.serializer, this);
  }

  static Couch? fromJson(dynamic json) {
    return serializers.deserializeWith(Couch.serializer, json);
  }

  String toJsonString() {
    return json.encode(toJson());
  }

  static Couch? fromJsonString(String jsonString) {
    return fromJson(json.decode(jsonString));
  }
}
