import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:instagram/feature/auth/bloc/auth_bloc.dart';
import 'package:instagram/feature/user/data/user_repo.dart';
import 'package:instagram/feature/user/models/user_model.dart';
import 'package:instagram/shared/extension/extension.dart';
import 'package:instagram/shared/model/model.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({
    required UserRepo userRepo,
    required AuthBloc authBloc,
  })  : _userRepo = userRepo,
        _authBloc = authBloc,
        super(ProfileState.initial()) {
    // on<ProfileEvent>((event, emit) async {
    //   if (event is ProfileLoadUser) {
    //     await _onProfileLoadUser(event, emit);
    //   }
    // });

    on<ProfileLoadUser>(_onProfileLoadUser);
  }

  final UserRepo _userRepo;
  final AuthBloc _authBloc;

  Future<void> _onProfileLoadUser(
    ProfileLoadUser event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(status: ProfileStatus.loading));
    try {
      final user = await _userRepo.getUserWithId(userId: event.userId);
      if (user != null) {
        final isCurrentUser = user.id.isEqualTo(_authBloc.state.user?.uid);
        emit(
          state.copyWith(
            user: user,
            isCurrentUser: isCurrentUser,
            status: ProfileStatus.loaded,
          ),
        );
      }
    } catch (err) {
      emit(
        state.copyWith(
          status: ProfileStatus.error,
          failure: Failure(code: '', message: err.toString()),
        ),
      );
    }
  }
}
