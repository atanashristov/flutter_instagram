part of 'profile_edit_cubit.dart';

enum ProfileEditStatus {
  initial,
  submitting,
  success,
  error,
  ;

  bool get isInitial => this == ProfileEditStatus.initial;
  bool get isSubmitting => this == ProfileEditStatus.submitting;
  bool get isSuccess => this == ProfileEditStatus.success;
  bool get isError => this == ProfileEditStatus.error;
}

@freezed
class ProfileEditState with _$ProfileEditState {
  const factory ProfileEditState._({
    @Default(ProfileEditStatus.initial) ProfileEditStatus status,
    @Default('') String username,
    @Default('') String bio,
    Failure? failure,
    File? profileImage,
  }) = _ProfileEditState;
  factory ProfileEditState.initial() => const ProfileEditState._();
}
