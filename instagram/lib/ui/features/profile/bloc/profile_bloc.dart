import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:instagram/domain/entities/user.dart';
import 'package:instagram/domain/failures/failures.dart';
import 'package:instagram/domain/use_cases/get_user/get_user.dart';
import 'package:instagram/domain/use_cases/get_user/get_user_params.dart';
import 'package:instagram/shared/extensions/extensions.dart';
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
  }

  final GetUser _getUser;
  final AuthBloc _authBloc;

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
}
