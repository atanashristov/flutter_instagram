part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.loadUser({
    required String userId,
  }) = ProfileLoadUser;
  const factory ProfileEvent.resetUser() = ProfileResetUser;
}
