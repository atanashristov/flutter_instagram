import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:instagram/domain/failures/failures.dart';
import 'package:instagram/domain/use_cases/update_user/update_user.dart';
import 'package:instagram/domain/use_cases/update_user/update_user_params.dart';
import 'package:instagram/domain/use_cases/upload_profile_image/upload_profile_image.dart';
import 'package:instagram/domain/use_cases/upload_profile_image/upload_profile_image_params.dart';
import 'package:instagram/ui/features/profile/bloc/profile_bloc.dart';

part 'profile_edit_state.dart';
part 'profile_edit_cubit.freezed.dart';

class ProfileEditCubit extends Cubit<ProfileEditState> {
  ProfileEditCubit({
    required UpdateUser updateUser,
    required UploadProfileImage uploadProfileImage,
    required ProfileBloc profileBloc,
  })  : _updateUser = updateUser,
        _uploadProfileImage = uploadProfileImage,
        _profileBloc = profileBloc,
        super(ProfileEditState.initial()) {
    final user = _profileBloc.state.user;
    emit(state.copyWith(username: user.username, bio: user.bio ?? ''));
  }

  final UpdateUser _updateUser;
  final UploadProfileImage _uploadProfileImage;
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
    final user = _profileBloc.state.user;

    var profileImageUrl = user.profileImageUrl;
    if (state.profileImage != null) {
      final uploadResult = await _uploadProfileImage
          .call(UploadProfileImageParams(state.profileImage!, profileImageUrl: profileImageUrl));
      if (uploadResult.isLeft) {
        emit(
          state.copyWith(
            status: ProfileEditStatus.error,
            failure: uploadResult.left,
          ),
        );
        return;
      }
      profileImageUrl = uploadResult.right;
    }

    final updatedUser = user.copyWith(
      username: state.username,
      bio: state.bio,
      profileImageUrl: profileImageUrl,
    );

    final updateResult = await _updateUser.call(UpdateUserParams(user: updatedUser));
    if (updateResult.isLeft) {
      emit(
        state.copyWith(
          status: ProfileEditStatus.error,
          failure: updateResult.left,
        ),
      );
    }

    _profileBloc.add(ProfileLoadUser(userId: user.id));

    emit(state.copyWith(status: ProfileEditStatus.success));
  }
}
