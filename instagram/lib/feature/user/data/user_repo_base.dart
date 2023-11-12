import 'package:instagram/feature/user/models/user_model.dart';

abstract class UserRepoBase {
  Future<UserModel?> getUserWithId({required String userId});
  Future<void> updateUser({required UserModel user});
}
