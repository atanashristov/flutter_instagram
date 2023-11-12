import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:instagram/feature/auth/data/auth_repo_base.dart';
import 'package:instagram/shared/model/model.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';
// part 'login_cubit.g.dart'; // only needed is serializable.

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required AuthRepoBase authRepo})
      : _authRepo = authRepo,
        super(const LoginState());

  final AuthRepoBase _authRepo;

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
      await _authRepo.logInWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );
      emit(state.copyWith(status: LoginStatus.success));
    } on Failure catch (err) {
      emit(state.copyWith(failure: err, status: LoginStatus.error));
    }
  }
}
