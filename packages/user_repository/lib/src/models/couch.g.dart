// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'couch.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Couch> _$couchSerializer = new _$CouchSerializer();

class _$CouchSerializer implements StructuredSerializer<Couch> {
  @override
  final Iterable<Type> types = const [Couch, _$Couch];
  @override
  final String wireName = 'Couch';

  @override
  Iterable<Object?> serialize(Serializers serializers, Couch object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'facilities',
      serializers.serialize(object.facilities,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Facility)])),
    ];
    Object? value;
    value = object.userId;
    if (value != null) {
      result
        ..add('user_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.capacity;
    if (value != null) {
      result
        ..add('capacity')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.active;
    if (value != null) {
      result
        ..add('active')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.rating;
    if (value != null) {
      result
        ..add('rating')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(User)));
    }
    return result;
  }

  @override
  Couch deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CouchBuilder();

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
        case 'user_id':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'capacity':
          result.capacity = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'active':
          result.active = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'rating':
          result.rating = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
              specifiedType: const FullType(User))! as User);
          break;
        case 'facilities':
          result.facilities.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Facility)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$Couch extends Couch {
  @override
  final int id;
  @override
  final int? userId;
  @override
  final int? capacity;
  @override
  final bool? active;
  @override
  final double? rating;
  @override
  final User? user;
  @override
  final BuiltList<Facility> facilities;

  factory _$Couch([void Function(CouchBuilder)? updates]) =>
      (new CouchBuilder()..update(updates))._build();

  _$Couch._(
      {required this.id,
      this.userId,
      this.capacity,
      this.active,
      this.rating,
      this.user,
      required this.facilities})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'Couch', 'id');
    BuiltValueNullFieldError.checkNotNull(facilities, r'Couch', 'facilities');
  }

  @override
  Couch rebuild(void Function(CouchBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CouchBuilder toBuilder() => new CouchBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Couch &&
        id == other.id &&
        userId == other.userId &&
        capacity == other.capacity &&
        active == other.active &&
        rating == other.rating &&
        user == other.user &&
        facilities == other.facilities;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, capacity.hashCode);
    _$hash = $jc(_$hash, active.hashCode);
    _$hash = $jc(_$hash, rating.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, facilities.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Couch')
          ..add('id', id)
          ..add('userId', userId)
          ..add('capacity', capacity)
          ..add('active', active)
          ..add('rating', rating)
          ..add('user', user)
          ..add('facilities', facilities))
        .toString();
  }
}

class CouchBuilder implements Builder<Couch, CouchBuilder> {
  _$Couch? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _userId;
  int? get userId => _$this._userId;
  set userId(int? userId) => _$this._userId = userId;

  int? _capacity;
  int? get capacity => _$this._capacity;
  set capacity(int? capacity) => _$this._capacity = capacity;

  bool? _active;
  bool? get active => _$this._active;
  set active(bool? active) => _$this._active = active;

  double? _rating;
  double? get rating => _$this._rating;
  set rating(double? rating) => _$this._rating = rating;

  UserBuilder? _user;
  UserBuilder get user => _$this._user ??= new UserBuilder();
  set user(UserBuilder? user) => _$this._user = user;

  ListBuilder<Facility>? _facilities;
  ListBuilder<Facility> get facilities =>
      _$this._facilities ??= new ListBuilder<Facility>();
  set facilities(ListBuilder<Facility>? facilities) =>
      _$this._facilities = facilities;

  CouchBuilder();

  CouchBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _userId = $v.userId;
      _capacity = $v.capacity;
      _active = $v.active;
      _rating = $v.rating;
      _user = $v.user?.toBuilder();
      _facilities = $v.facilities.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Couch other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Couch;
  }

  @override
  void update(void Function(CouchBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Couch build() => _build();

  _$Couch _build() {
    _$Couch _$result;
    try {
      _$result = _$v ??
          new _$Couch._(
              id: BuiltValueNullFieldError.checkNotNull(id, r'Couch', 'id'),
              userId: userId,
              capacity: capacity,
              active: active,
              rating: rating,
              user: _user?.build(),
              facilities: facilities.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
        _$failedField = 'facilities';
        facilities.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Couch', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
