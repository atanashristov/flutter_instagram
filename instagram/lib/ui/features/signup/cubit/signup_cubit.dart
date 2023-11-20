import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:instagram/domain/failures/failures.dart';
import 'package:instagram/domain/use_cases/signup_with_email_and_password/signup_with_email_and_password.dart';
import 'package:instagram/domain/use_cases/signup_with_email_and_password/signup_with_email_and_password_params.dart';

part 'signup_state.dart';
part 'signup_cubit.freezed.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({required SignUpWithEmailAndPassword signUpWithCredentials})
      : _signUpWithCredentials = signUpWithCredentials,
        super(const SignupState());

  final SignUpWithEmailAndPassword _signUpWithCredentials;

  void usernameChanged(String value) {
    emit(state.copyWith(username: value, status: SignupStatus.initial));
  }

  void emailChanged(String value) {
    emit(state.copyWith(email: value, status: SignupStatus.initial));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, status: SignupStatus.initial));
  }

  Future<void> signUpWithCredentials() async {
    if (!state.isFormValid || state.status.isSubmitting) return;
    emit(state.copyWith(status: SignupStatus.submitting));
    final signUpResult = await _signUpWithCredentials.call(
      SignUpWithEmailAndPasswordParams(
        username: state.username,
        email: state.email,
        password: state.password,
      ),
    );
    if (signUpResult.isLeft) {
      emit(state.copyWith(failure: signUpResult.left, status: SignupStatus.error));
    }
    emit(state.copyWith(status: SignupStatus.success));
  }
}
