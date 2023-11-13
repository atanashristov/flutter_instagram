import 'dart:io';

abstract class ProfileRepo {
  Future<String> uploadProfileImage(File image, {String? url});
  Future<String> uploadPostImage({required File image});
}
