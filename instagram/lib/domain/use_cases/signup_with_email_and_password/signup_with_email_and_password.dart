import 'package:either_dart/either.dart';
import 'package:instagram/domain/failures/failures.dart';
import 'package:instagram/domain/repositories/auth_repository.dart';
import 'package:instagram/domain/repositories/user_repository.dart';
import 'package:instagram/domain/use_cases/signup_with_email_and_password/signup_with_email_and_password_params.dart';
import 'package:instagram/domain/use_cases/use_case_base.dart';
import 'package:strings/strings.dart';

class SignUpWithEmailAndPassword implements UseCaseBase<bool, SignUpWithEmailAndPasswordParams> {
  SignUpWithEmailAndPassword({
    required AuthRepository authRepository,
    required UserRepository userRepository,
  })  : _authRepository = authRepository,
        _userRepository = userRepository;

  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  @override
  Future<Either<Failure, bool>> call(SignUpWithEmailAndPasswordParams params) async {
    if (Strings.isBlank(params.username) || Strings.isBlank(params.email) || Strings.isBlank(params.password)) {
      return Left(GeneralFailure());
    }

    final signUpResult = await _authRepository.signUpWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
    if (signUpResult.isLeft) {
      return Left(signUpResult.left);
    }

    final uid = signUpResult.right ?? '';
    if (Strings.isBlank(uid)) {
      return Left(GeneralFailure());
    }

    final createUserResult = await _userRepository.createUserWithEmail(
      id: uid,
      username: params.username,
      email: params.email,
    );
    if (createUserResult.isLeft) {
      return Left(createUserResult.left);
    } else {
      return const Right(true);
    }
  }
}
