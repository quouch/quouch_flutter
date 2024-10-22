import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._userRepository) : super(ProfileState());

  final UserRepository _userRepository;

  Future<void> fetchUser() async {
    emit(state.copyWith(status: ProfileStatus.loading));

    try {
      final user = await _userRepository.getUser();

      emit(
        state.copyWith(
          status: ProfileStatus.success,
          user: user,
        ),
      );
    } on Exception {
      emit(state.copyWith(status: ProfileStatus.failure));
    }
  }
}
