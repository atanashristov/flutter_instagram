import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram/app/config/paths.dart';
import 'package:instagram/feature/user/data/user_repo.dart';
import 'package:instagram/feature/user/models/user_model.dart';

class UserRepoImpl extends UserRepo {
  UserRepoImpl({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance {
    _collection = _firebaseFirestore.collection(Paths.users).withConverter(
          fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!..addAll({'id': snapshot.id})),
          toFirestore: (user, _) => user.toJson(),
        );
  }

  final FirebaseFirestore _firebaseFirestore;
  late CollectionReference<UserModel> _collection;

  @override
  Future<UserModel?> getUserWithId({required String userId}) async => (await _collection.doc(userId).get()).data();

  @override
  Future<void> updateUser({required UserModel user}) async => _collection.doc(user.id).set(user);
}
