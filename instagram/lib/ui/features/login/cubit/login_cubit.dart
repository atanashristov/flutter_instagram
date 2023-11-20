import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:instagram/domain/failures/failures.dart';
import 'package:instagram/domain/use_cases/login_with_email_and_password/login_with_email_and_password.dart';
import 'package:instagram/domain/use_cases/login_with_email_and_password/login_with_email_and_password_params.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';
// part 'login_cubit.g.dart'; // only needed is serializable.

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required LogInWithEmailAndPassword logInWithEmailAndPassword})
      : _logInWithEmailAndPassword = logInWithEmailAndPassword,
        super(const LoginState());

  final LogInWithEmailAndPassword _logInWithEmailAndPassword;

  void emailChanged(String value) {
    emit(state.copyWith(email: value, status: LoginStatus.initial));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, status: LoginStatus.initial));
  }

  Future<void> logInWithCredentials() async {
    if (!state.isFormValid || state.status.isSubmitting) return;
    emit(state.copyWith(status: LoginStatus.submitting));
    try {
      final loginResult = await _logInWithEmailAndPassword.call(
        LogInWithEmailAndPasswordParams(
          email: state.email,
          password: state.password,
        ),
      );
      if (loginResult.isLeft) {
        emit(state.copyWith(failure: loginResult.left, status: LoginStatus.error));
      } else {
        emit(state.copyWith(status: LoginStatus.success));
      }
    } on Failure catch (err) {
      emit(state.copyWith(failure: err, status: LoginStatus.error));
    }
  }
}
