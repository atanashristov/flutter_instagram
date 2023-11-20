import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:instagram/domain/failures/failures.dart';

abstract class AuthRepository {
  Stream<auth.User?> get user;
  Future<Either<Failure, String?>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<Either<Failure, bool?>> logInWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<Either<Failure, bool>> logOut();
}
