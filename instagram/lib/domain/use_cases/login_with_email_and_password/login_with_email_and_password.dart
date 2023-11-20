import 'package:either_dart/either.dart';
import 'package:instagram/domain/failures/failures.dart';
import 'package:instagram/domain/repositories/auth_repository.dart';
import 'package:instagram/domain/use_cases/login_with_email_and_password/login_with_email_and_password_params.dart';
import 'package:instagram/domain/use_cases/use_case_base.dart';
import 'package:strings/strings.dart';

class LogInWithEmailAndPassword implements UseCaseBase<bool, LogInWithEmailAndPasswordParams> {
  LogInWithEmailAndPassword({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  final AuthRepository _authRepository;

  @override
  Future<Either<Failure, bool>> call(LogInWithEmailAndPasswordParams params) async {
    if (Strings.isBlank(params.email) || Strings.isBlank(params.password)) {
      return Left(GeneralFailure());
    }

    final logInResult = await _authRepository.logInWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
    if (logInResult.isLeft) {
      return Left(logInResult.left);
    } else {
      return const Right(true);
    }
  }
}
