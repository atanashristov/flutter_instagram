import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:instagram/domain/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required AuthRepository authRepo,
  })  : _authRepo = authRepo,
        super(AuthState.unknown()) {
    _userSubscription = _authRepo.user.listen(
      (user) {
        add(AuthUserChanged(user: user));
      },
    );
    on<AuthEvent>((event, emit) async {
      if (event is AuthUserChanged) {
        if (event.user != null) {
          emit(AuthState.authenticated(user: event.user!));
        } else {
          emit(AuthState.unauthenticated());
        }
      } else if (event is AuthLogoutRequested) {
        await _authRepo.logOut();
      }
    });
  }

  final AuthRepository _authRepo;
  late StreamSubscription<auth.User?> _userSubscription;

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
