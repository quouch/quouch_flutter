part of 'profile_cubit.dart';

enum ProfileStatus { initial, loading, success, failure }

extension ProfileStatusX on ProfileStatus {
  bool get isInitial => this == ProfileStatus.initial;

  bool get isLoading => this == ProfileStatus.loading;

  bool get isSuccess => this == ProfileStatus.success;

  bool get isFailure => this == ProfileStatus.failure;
}

final class ProfileState extends Equatable {
  final User? user;
  final ProfileStatus status;

  const ProfileState({this.status = ProfileStatus.initial, this.user});

  ProfileState copyWith({
    ProfileStatus? status,
    User? user,
  }) {
    return ProfileState(
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }

  @override
  List<Object> get props => [user ?? User.empty, status];
}
