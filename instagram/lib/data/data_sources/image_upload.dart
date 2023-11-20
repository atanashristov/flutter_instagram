import 'dart:io';

abstract class ImageUpload {
  Future<String> uploadPostImage(File image);
  Future<String> uploadProfileImage(File image, {String? url});
}
