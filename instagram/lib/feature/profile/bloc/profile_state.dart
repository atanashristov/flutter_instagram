part of 'profile_bloc.dart';

enum ProfileStatus {
  initial,
  loading,
  loaded,
  error,
  ;

  bool get isInitial => this == ProfileStatus.initial;
  bool get isLoading => this == ProfileStatus.loading;
  bool get isLoaded => this == ProfileStatus.loaded;
  bool get isError => this == ProfileStatus.error;
}

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState._({
    @Default(UserModel.empty) UserModel user,
    @Default(false) bool isCurrentUser,
    @Default(false) bool isGridView,
    @Default(false) bool isFollowing,
    @Default(ProfileStatus.initial) ProfileStatus status,
    @Default(null) Failure? failure,
  }) = _ProfileState;
  factory ProfileState.initial() => const ProfileState._();
}
