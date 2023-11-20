import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:instagram/data/configs/firebase_paths.dart';
import 'package:instagram/data/mapper/mapper.dart';
import 'package:instagram/data/models/user_model.dart';
import 'package:instagram/domain/entities/user.dart';
import 'package:instagram/domain/failures/failures.dart';
import 'package:instagram/domain/repositories/user_repository.dart';

class UserRepositoryFirebase extends UserRepository {
  UserRepositoryFirebase({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance {
    _collection = _firebaseFirestore.collection(FirebasePaths.users).withConverter(
          fromFirestore: _fromFirestore,
          toFirestore: (user, _) => _toFirestore(user),
        );
  }

  static UserModel _fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? _,
  ) {
    return UserModel.fromJson(snapshot.data()!..addAll({'id': snapshot.id}));
  }

  static Map<String, Object?> _toFirestore(UserModel user) {
    return Map.fromEntries(user.toJson().entries.where((e) => e.key != 'id'));
  }

  final FirebaseFirestore _firebaseFirestore;
  late CollectionReference<UserModel> _collection;

  @override
  Future<Either<Failure, User>> getUser({required String id}) async {
    try {
      final userDto = (await _collection.doc(id).get()).data();
      final result = Mappr().convert<UserModel, User>(userDto);
      return Right(result);
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }

  @override
  Future<Either<Failure, User>> updateUser({required User entity}) async {
    try {
      final userDto = Mappr().convert<User, UserModel>(entity);
      await _collection.doc(userDto.id).set(userDto);
      return getUser(id: userDto.id);
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }

  @override
  Future<Either<Failure, bool>> createUserWithEmail({
    required String id,
    required String username,
    required String email,
  }) async {
    try {
      await _firebaseFirestore.collection(FirebasePaths.users).doc(id).set({
        'username': username,
        'email': email,
      });
      return const Right(true);
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }
}
