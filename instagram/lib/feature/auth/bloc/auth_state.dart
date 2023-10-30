part of 'auth_bloc.dart';

enum AuthStatus {
  unknown,
  authenticated,
  unauthenticated,
}

class AuthState extends Equatable {
  const AuthState._({
    this.user,
    this.status = AuthStatus.unknown,
  });
  factory AuthState.unknown() => const AuthState._();
  factory AuthState.authenticated({required auth.User user}) => AuthState._(
        user: user,
        status: AuthStatus.authenticated,
      );
  factory AuthState.unauthenticated() => const AuthState._(
        status: AuthStatus.unauthenticated,
      );

  final auth.User? user;
  final AuthStatus status;

  @override
  List<Object?> get props => [user, status];
}


// sealed class AuthState extends Equatable {
//   const AuthState();
//
//   @override
//   List<Object> get props => [];
// }

// final class AuthInitial extends AuthState {}
