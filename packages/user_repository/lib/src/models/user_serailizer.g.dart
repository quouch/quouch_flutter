part of 'user.dart';

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['id'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
    };
