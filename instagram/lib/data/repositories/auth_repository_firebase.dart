import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/services.dart';
import 'package:instagram/domain/failures/failures.dart';
import 'package:instagram/domain/repositories/auth_repository.dart';

class AuthRepositoryFirebase extends AuthRepository {
  AuthRepositoryFirebase({
    auth.FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? auth.FirebaseAuth.instance;

  final auth.FirebaseAuth _firebaseAuth;

  @override
  Stream<auth.User?> get user => _firebaseAuth.userChanges();

  @override
  Future<Either<Failure, bool>> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credentials = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credentials.user != null) {
        return const Right(true);
      } else {
        return Left(GeneralFailure());
      }
    } on auth.FirebaseAuthException catch (err) {
      return Left(ServerFailure(stackTrace: err.toString()));
    } on PlatformException catch (err) {
      return Left(GeneralFailure(stackTrace: err.toString()));
    } on Exception catch (e) {
      return Future.value(Left(GeneralFailure(stackTrace: e.toString())));
    }
  }

  @override
  Future<Either<Failure, String?>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credentials = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = credentials.user;
      return Right(user?.uid);
    } on auth.FirebaseAuthException catch (err) {
      return Left(ServerFailure(stackTrace: err.toString()));
    } on PlatformException catch (err) {
      return Left(GeneralFailure(stackTrace: err.toString()));
    } on Exception catch (e) {
      return Future.value(Left(GeneralFailure(stackTrace: e.toString())));
    }
  }

  @override
  Future<Either<Failure, bool>> logOut() async {
    try {
      await _firebaseAuth.signOut();
      return const Right(true);
    } on auth.FirebaseAuthException catch (err) {
      return Left(ServerFailure(stackTrace: err.toString()));
    } on PlatformException catch (err) {
      return Left(GeneralFailure(stackTrace: err.toString()));
    } on Exception catch (e) {
      return Future.value(Left(GeneralFailure(stackTrace: e.toString())));
    }
  }
}
