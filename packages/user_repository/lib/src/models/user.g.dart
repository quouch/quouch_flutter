// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<User> _$userSerializer = new _$UserSerializer();

class _$UserSerializer implements StructuredSerializer<User> {
  @override
  final Iterable<Type> types = const [User, _$User];
  @override
  final String wireName = 'User';

  @override
  Iterable<Object?> serialize(Serializers serializers, User object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'characteristics',
      serializers.serialize(object.characteristics,
          specifiedType: const FullType(
              BuiltList, const [const FullType(Characteristic)])),
    ];
    Object? value;
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.updatedAt;
    if (value != null) {
      result
        ..add('updated_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.firstName;
    if (value != null) {
      result
        ..add('first_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lastName;
    if (value != null) {
      result
        ..add('last_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dateOfBirth;
    if (value != null) {
      result
        ..add('date_of_birth')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.age;
    if (value != null) {
      result
        ..add('age')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.summary;
    if (value != null) {
      result
        ..add('summary')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.city;
    if (value != null) {
      result
        ..add('city')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.country;
    if (value != null) {
      result
        ..add('country')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.zipCode;
    if (value != null) {
      result
        ..add('zipcode')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.offersCouch;
    if (value != null) {
      result
        ..add('offers_couch')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.offersHangout;
    if (value != null) {
      result
        ..add('offers_hang_out')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.offersCoWork;
    if (value != null) {
      result
        ..add('offers_co_work')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.travelling;
    if (value != null) {
      result
        ..add('travelling')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.couch;
    if (value != null) {
      result
        ..add('couch')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(Couch)));
    }
    return result;
  }

  @override
  User deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserBuilder();

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
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'updated_at':
          result.updatedAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'first_name':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'last_name':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'date_of_birth':
          result.dateOfBirth = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'age':
          result.age = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'summary':
          result.summary = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'city':
          result.city = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'country':
          result.country = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'zipcode':
          result.zipCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'offers_couch':
          result.offersCouch = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'offers_hang_out':
          result.offersHangout = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'offers_co_work':
          result.offersCoWork = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'travelling':
          result.travelling = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'photo':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'characteristics':
          result.characteristics.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Characteristic)]))!
              as BuiltList<Object?>);
          break;
        case 'couch':
          result.couch.replace(serializers.deserialize(value,
              specifiedType: const FullType(Couch))! as Couch);
          break;
      }
    }

    return result.build();
  }
}

class _$User extends User {
  @override
  final int id;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final String? email;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final DateTime? dateOfBirth;
  @override
  final int? age;
  @override
  final String? summary;
  @override
  final String? city;
  @override
  final String? country;
  @override
  final String? address;
  @override
  final String? zipCode;
  @override
  final bool? offersCouch;
  @override
  final bool? offersHangout;
  @override
  final bool? offersCoWork;
  @override
  final bool? travelling;
  @override
  final String? photoUrl;
  @override
  final BuiltList<Characteristic> characteristics;
  @override
  final Couch? couch;

  factory _$User([void Function(UserBuilder)? updates]) =>
      (new UserBuilder()..update(updates))._build();

  _$User._(
      {required this.id,
      this.createdAt,
      this.updatedAt,
      this.email,
      this.firstName,
      this.lastName,
      this.dateOfBirth,
      this.age,
      this.summary,
      this.city,
      this.country,
      this.address,
      this.zipCode,
      this.offersCouch,
      this.offersHangout,
      this.offersCoWork,
      this.travelling,
      this.photoUrl,
      required this.characteristics,
      this.couch})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'User', 'id');
    BuiltValueNullFieldError.checkNotNull(
        characteristics, r'User', 'characteristics');
  }

  @override
  User rebuild(void Function(UserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserBuilder toBuilder() => new UserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
        id == other.id &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        email == other.email &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        dateOfBirth == other.dateOfBirth &&
        age == other.age &&
        summary == other.summary &&
        city == other.city &&
        country == other.country &&
        address == other.address &&
        zipCode == other.zipCode &&
        offersCouch == other.offersCouch &&
        offersHangout == other.offersHangout &&
        offersCoWork == other.offersCoWork &&
        travelling == other.travelling &&
        photoUrl == other.photoUrl &&
        characteristics == other.characteristics &&
        couch == other.couch;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, firstName.hashCode);
    _$hash = $jc(_$hash, lastName.hashCode);
    _$hash = $jc(_$hash, dateOfBirth.hashCode);
    _$hash = $jc(_$hash, age.hashCode);
    _$hash = $jc(_$hash, summary.hashCode);
    _$hash = $jc(_$hash, city.hashCode);
    _$hash = $jc(_$hash, country.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, zipCode.hashCode);
    _$hash = $jc(_$hash, offersCouch.hashCode);
    _$hash = $jc(_$hash, offersHangout.hashCode);
    _$hash = $jc(_$hash, offersCoWork.hashCode);
    _$hash = $jc(_$hash, travelling.hashCode);
    _$hash = $jc(_$hash, photoUrl.hashCode);
    _$hash = $jc(_$hash, characteristics.hashCode);
    _$hash = $jc(_$hash, couch.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'User')
          ..add('id', id)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('email', email)
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('dateOfBirth', dateOfBirth)
          ..add('age', age)
          ..add('summary', summary)
          ..add('city', city)
          ..add('country', country)
          ..add('address', address)
          ..add('zipCode', zipCode)
          ..add('offersCouch', offersCouch)
          ..add('offersHangout', offersHangout)
          ..add('offersCoWork', offersCoWork)
          ..add('travelling', travelling)
          ..add('photoUrl', photoUrl)
          ..add('characteristics', characteristics)
          ..add('couch', couch))
        .toString();
  }
}

class UserBuilder implements Builder<User, UserBuilder> {
  _$User? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  DateTime? _dateOfBirth;
  DateTime? get dateOfBirth => _$this._dateOfBirth;
  set dateOfBirth(DateTime? dateOfBirth) => _$this._dateOfBirth = dateOfBirth;

  int? _age;
  int? get age => _$this._age;
  set age(int? age) => _$this._age = age;

  String? _summary;
  String? get summary => _$this._summary;
  set summary(String? summary) => _$this._summary = summary;

  String? _city;
  String? get city => _$this._city;
  set city(String? city) => _$this._city = city;

  String? _country;
  String? get country => _$this._country;
  set country(String? country) => _$this._country = country;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  String? _zipCode;
  String? get zipCode => _$this._zipCode;
  set zipCode(String? zipCode) => _$this._zipCode = zipCode;

  bool? _offersCouch;
  bool? get offersCouch => _$this._offersCouch;
  set offersCouch(bool? offersCouch) => _$this._offersCouch = offersCouch;

  bool? _offersHangout;
  bool? get offersHangout => _$this._offersHangout;
  set offersHangout(bool? offersHangout) =>
      _$this._offersHangout = offersHangout;

  bool? _offersCoWork;
  bool? get offersCoWork => _$this._offersCoWork;
  set offersCoWork(bool? offersCoWork) => _$this._offersCoWork = offersCoWork;

  bool? _travelling;
  bool? get travelling => _$this._travelling;
  set travelling(bool? travelling) => _$this._travelling = travelling;

  String? _photoUrl;
  String? get photoUrl => _$this._photoUrl;
  set photoUrl(String? photoUrl) => _$this._photoUrl = photoUrl;

  ListBuilder<Characteristic>? _characteristics;
  ListBuilder<Characteristic> get characteristics =>
      _$this._characteristics ??= new ListBuilder<Characteristic>();
  set characteristics(ListBuilder<Characteristic>? characteristics) =>
      _$this._characteristics = characteristics;

  CouchBuilder? _couch;
  CouchBuilder get couch => _$this._couch ??= new CouchBuilder();
  set couch(CouchBuilder? couch) => _$this._couch = couch;

  UserBuilder();

  UserBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _email = $v.email;
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _dateOfBirth = $v.dateOfBirth;
      _age = $v.age;
      _summary = $v.summary;
      _city = $v.city;
      _country = $v.country;
      _address = $v.address;
      _zipCode = $v.zipCode;
      _offersCouch = $v.offersCouch;
      _offersHangout = $v.offersHangout;
      _offersCoWork = $v.offersCoWork;
      _travelling = $v.travelling;
      _photoUrl = $v.photoUrl;
      _characteristics = $v.characteristics.toBuilder();
      _couch = $v.couch?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(User other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$User;
  }

  @override
  void update(void Function(UserBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  User build() => _build();

  _$User _build() {
    _$User _$result;
    try {
      _$result = _$v ??
          new _$User._(
              id: BuiltValueNullFieldError.checkNotNull(id, r'User', 'id'),
              createdAt: createdAt,
              updatedAt: updatedAt,
              email: email,
              firstName: firstName,
              lastName: lastName,
              dateOfBirth: dateOfBirth,
              age: age,
              summary: summary,
              city: city,
              country: country,
              address: address,
              zipCode: zipCode,
              offersCouch: offersCouch,
              offersHangout: offersHangout,
              offersCoWork: offersCoWork,
              travelling: travelling,
              photoUrl: photoUrl,
              characteristics: characteristics.build(),
              couch: _couch?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'characteristics';
        characteristics.build();
        _$failedField = 'couch';
        _couch?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'User', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
