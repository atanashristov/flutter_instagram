part of 'signup_cubit.dart';

enum SignupStatus {
  initial,
  submitting,
  success,
  error,
  ;

  bool get isInitial => this == SignupStatus.initial;
  bool get isSubmitting => this == SignupStatus.submitting;
  bool get isSuccess => this == SignupStatus.success;
  bool get isError => this == SignupStatus.error;
}

@freezed
class SignupState with _$SignupState {
  const factory SignupState({
    @Default('') String username,
    @Default('') String email,
    @Default('') String password,
    @Default(SignupStatus.initial) SignupStatus status,
    @Default(null) Failure? failure,
  }) = _SignupState;
  const SignupState._();
  // factory SignupState.initial() => const SignupState._();
  // const factory SignupState.initial() = _Initial;

  bool get isFormValid => username.isNotEmpty && email.isNotEmpty && password.isNotEmpty;
}
