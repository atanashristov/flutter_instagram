import 'package:either_dart/either.dart';
import 'package:instagram/domain/entities/user.dart';
import 'package:instagram/domain/failures/failures.dart';
import 'package:instagram/domain/repositories/user_repository.dart';
import 'package:instagram/domain/use_cases/update_user/update_user_params.dart';
import 'package:instagram/domain/use_cases/use_case_base.dart';

class UpdateUser implements UseCaseBase<User, UpdateUserParams> {
  UpdateUser({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  final UserRepository _userRepository;

  @override
  Future<Either<Failure, User>> call(UpdateUserParams params) async {
    if (params.user == User.empty) {
      return Left(GeneralFailure());
    }
    try {
      return await _userRepository.updateUser(
        entity: params.user,
      );
    } on Exception catch (e) {
      return Left(ServerFailure(stackTrace: e.toString()));
    }
  }
}
