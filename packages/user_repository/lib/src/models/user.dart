import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_serailizer.g.dart';

@JsonSerializable()
class User extends Equatable {
  const User(this.id);

  final String id;

  @override
  List<Object> get props => [id];

  static const empty = User('-');

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
