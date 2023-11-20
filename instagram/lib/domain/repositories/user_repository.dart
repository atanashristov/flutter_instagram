import 'package:either_dart/either.dart';
import 'package:instagram/domain/entities/user.dart';
import 'package:instagram/domain/failures/failures.dart';

abstract class UserRepository {
  Future<Either<Failure, bool>> createUserWithEmail({
    required String id,
    required String username,
    required String email,
  });
  Future<Either<Failure, User>> getUser({required String id});
  Future<Either<Failure, User>> updateUser({required User entity});
}
