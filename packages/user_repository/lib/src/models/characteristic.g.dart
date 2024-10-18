// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characteristic.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Characteristic> _$characteristicSerializer =
    new _$CharacteristicSerializer();

class _$CharacteristicSerializer
    implements StructuredSerializer<Characteristic> {
  @override
  final Iterable<Type> types = const [Characteristic, _$Characteristic];
  @override
  final String wireName = 'Characteristic';

  @override
  Iterable<Object?> serialize(Serializers serializers, Characteristic object,
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
  Characteristic deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CharacteristicBuilder();

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

class _$Characteristic extends Characteristic {
  @override
  final int id;
  @override
  final String name;

  factory _$Characteristic([void Function(CharacteristicBuilder)? updates]) =>
      (new CharacteristicBuilder()..update(updates))._build();

  _$Characteristic._({required this.id, required this.name}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'Characteristic', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'Characteristic', 'name');
  }

  @override
  Characteristic rebuild(void Function(CharacteristicBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CharacteristicBuilder toBuilder() =>
      new CharacteristicBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Characteristic && id == other.id && name == other.name;
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
    return (newBuiltValueToStringHelper(r'Characteristic')
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class CharacteristicBuilder
    implements Builder<Characteristic, CharacteristicBuilder> {
  _$Characteristic? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  CharacteristicBuilder();

  CharacteristicBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Characteristic other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Characteristic;
  }

  @override
  void update(void Function(CharacteristicBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Characteristic build() => _build();

  _$Characteristic _build() {
    final _$result = _$v ??
        new _$Characteristic._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'Characteristic', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'Characteristic', 'name'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
