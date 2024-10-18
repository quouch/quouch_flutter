// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Facility> _$facilitySerializer = new _$FacilitySerializer();

class _$FacilitySerializer implements StructuredSerializer<Facility> {
  @override
  final Iterable<Type> types = const [Facility, _$Facility];
  @override
  final String wireName = 'Facility';

  @override
  Iterable<Object?> serialize(Serializers serializers, Facility object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Facility deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FacilityBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Facility extends Facility {
  @override
  final int id;
  @override
  final String name;

  factory _$Facility([void Function(FacilityBuilder)? updates]) =>
      (new FacilityBuilder()..update(updates))._build();

  _$Facility._({required this.id, required this.name}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'Facility', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'Facility', 'name');
  }

  @override
  Facility rebuild(void Function(FacilityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FacilityBuilder toBuilder() => new FacilityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Facility && id == other.id && name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Facility')
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class FacilityBuilder implements Builder<Facility, FacilityBuilder> {
  _$Facility? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  FacilityBuilder();

  FacilityBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Facility other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Facility;
  }

  @override
  void update(void Function(FacilityBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Facility build() => _build();

  _$Facility _build() {
    final _$result = _$v ??
        new _$Facility._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'Facility', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'Facility', 'name'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
