part of 'login_cubit.dart';

enum LoginStatus {
  initial,
  submitting,
  success,
  error,
  ;

  bool get isInitial => this == LoginStatus.initial;
  bool get isSubmitting => this == LoginStatus.submitting;
  bool get isSuccess => this == LoginStatus.success;
  bool get isError => this == LoginStatus.error;
}

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default('') String email,
    @Default('') String password,
    @Default(LoginStatus.initial) LoginStatus status,
    @Default(null) Failure? failure,
  }) = _LoginState;
  const LoginState._();
  // factory LoginState.initial() => const LoginState._();

  bool get isFormValid => email.isNotEmpty && password.isNotEmpty;
}
