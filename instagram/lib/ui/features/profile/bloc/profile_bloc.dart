import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:instagram/domain/entities/user.dart';
import 'package:instagram/domain/failures/failures.dart';
import 'package:instagram/domain/use_cases/get_user/get_user.dart';
import 'package:instagram/domain/use_cases/get_user/get_user_params.dart';
import 'package:instagram/shared/extensions/extensions.dart';
import 'package:instagram/ui/events/events.dart';
import 'package:instagram/ui/features/auth/bloc/auth_bloc.dart';

part 'profile_bloc.freezed.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({
    required GetUser getUser,
    required AuthBloc authBloc,
  })  : _getUser = getUser,
        _authBloc = authBloc,
        super(ProfileState.initial()) {
    // on<ProfileEvent>((event, emit) async {
    //   if (event is ProfileLoadUser) {
    //     await _onProfileLoadUser(event, emit);
    //   }
    // });

    on<ProfileLoadUser>(_onProfileLoadUser);
    on<ProfileResetUser>(_onProfileResetUser);

    _loggedOutSubscription = EventBus().listen<UserLoggedOutEvent>((_) => _onLoggedOut());
    _loggedInSubscription = EventBus().listen<UserLoggedInEvent>(_onLoggedIn);
  }

  final GetUser _getUser;
  final AuthBloc _authBloc;
  late final StreamSubscription<UserLoggedOutEvent> _loggedOutSubscription;
  late final StreamSubscription<UserLoggedInEvent> _loggedInSubscription;

  @override
  Future<void> close() async {
    await _loggedOutSubscription.cancel();
    await _loggedInSubscription.cancel();
    await super.close();
  }

  Future<void> _onProfileLoadUser(
    ProfileLoadUser event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(status: ProfileStatus.loading));

    final user = await _getUser.call(GetUserParams(userId: event.userId));
    if (user.isLeft) {
      emit(
        state.copyWith(
          status: ProfileStatus.error,
          failure: user.left,
        ),
      );
    }

    final isCurrentUser = user.right.id.isEqualTo(_authBloc.state.user?.uid);
    emit(
      state.copyWith(
        user: user.right,
        isCurrentUser: isCurrentUser,
        status: ProfileStatus.loaded,
      ),
    );
  }

  Future<void> _onProfileResetUser(
    ProfileResetUser event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileState.initial());
  }

  void _onLoggedOut() {
    add(const ProfileResetUser());
  }

  void _onLoggedIn(UserLoggedInEvent event) {
    add(ProfileLoadUser(userId: event.userId));
  }
}
