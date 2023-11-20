import 'package:either_dart/either.dart';
import 'package:instagram/domain/entities/user.dart';
import 'package:instagram/domain/failures/failures.dart';
import 'package:instagram/domain/repositories/user_repository.dart';
import 'package:instagram/domain/use_cases/get_user/get_user_params.dart';
import 'package:instagram/domain/use_cases/use_case_base.dart';
import 'package:strings/strings.dart';

class GetUser implements UseCaseBase<User, GetUserParams> {
  GetUser({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  final UserRepository _userRepository;

  @override
  Future<Either<Failure, User>> call(GetUserParams params) async {
    if (Strings.isBlank(params.userId)) {
      return Left(GeneralFailure());
    }
    try {
      return await _userRepository.getUser(
        id: params.userId,
      );
    } on Exception catch (e) {
      return Left(ServerFailure(stackTrace: e.toString()));
    }
  }
}
