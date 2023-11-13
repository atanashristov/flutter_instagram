import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:instagram/feature/profile/bloc/profile_bloc.dart';
import 'package:instagram/feature/profile/data/profile_repo.dart';
import 'package:instagram/feature/user/data/user_repo.dart';
import 'package:instagram/shared/model/model.dart';

part 'profile_edit_state.dart';
part 'profile_edit_cubit.freezed.dart';

class ProfileEditCubit extends Cubit<ProfileEditState> {
  ProfileEditCubit({
    required UserRepo userRepo,
    required ProfileRepo profileRepo,
    required ProfileBloc profileBloc,
  })  : _userRepo = userRepo,
        _profileRepo = profileRepo,
        _profileBloc = profileBloc,
        super(ProfileEditState.initial()) {
    final user = _profileBloc.state.user;
    emit(state.copyWith(username: user.username, bio: user.bio ?? ''));
  }

  final UserRepo _userRepo;
  final ProfileRepo _profileRepo;
  final ProfileBloc _profileBloc;

  void profileImageChanged(File image) {
    emit(state.copyWith(profileImage: image, status: ProfileEditStatus.initial));
  }

  void usernameChanged(String username) {
    emit(state.copyWith(username: username, status: ProfileEditStatus.initial));
  }

  void bioChanged(String bio) {
    emit(state.copyWith(bio: bio, status: ProfileEditStatus.initial));
  }

  Future<void> submit() async {
    emit(state.copyWith(status: ProfileEditStatus.submitting));
    try {
      final user = _profileBloc.state.user;

      var profileImageUrl = user.profileImageUrl;
      if (state.profileImage != null) {
        profileImageUrl = await _profileRepo.uploadProfileImage(
          state.profileImage!,
          url: profileImageUrl,
        );
      }

      final updatedUser = user.copyWith(
        username: state.username,
        bio: state.bio,
        profileImageUrl: profileImageUrl,
      );

      await _userRepo.updateUser(user: updatedUser);

      _profileBloc.add(ProfileLoadUser(userId: user.id));

      emit(state.copyWith(status: ProfileEditStatus.success));
    } catch (err) {
      emit(
        state.copyWith(
          status: ProfileEditStatus.error,
          failure: Failure(
            code: '',
            message: 'We were unable to update your profile',
          ),
        ),
      );
    }
  }
}
