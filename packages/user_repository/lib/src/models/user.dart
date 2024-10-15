import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_serailizer.g.dart';

@JsonSerializable()
class User extends Equatable {
  const User({required this.id, this.name = ''});

  final String id;
  final String name;

  @override
  List<Object> get props => [id, name];

  static const empty = User(id: '-');

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
