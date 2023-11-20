import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:instagram/data/data_sources/image_upload.dart';
import 'package:strings/strings.dart';
import 'package:uuid/uuid.dart';

class ImageUploadFirebase extends ImageUpload {
  ImageUploadFirebase({
    FirebaseStorage? firebaseStorage,
  }) : _firebaseStorage = firebaseStorage ?? FirebaseStorage.instance;

  final FirebaseStorage _firebaseStorage;

  @override
  Future<String> uploadPostImage(File image) async {
    final imageId = const Uuid().v4();
    return _uploadImage(image: image, ref: 'images/posts/post_$imageId.jpg');
  }

  @override
  Future<String> uploadProfileImage(File image, {String? url}) async {
    var imageId = const Uuid().v4();
    if (Strings.isNotBlank(url)) {
      final regExp = RegExp('user_profile_(.*).jpg');
      imageId = regExp.firstMatch(url!)?[1] ?? imageId;
    }
    return _uploadImage(image: image, ref: 'images/users/user_profile_$imageId.jpg');
  }

  Future<String> _uploadImage({required File image, required String ref}) async => await _firebaseStorage
      .ref(ref)
      .putFile(
        image,
        SettableMetadata(contentType: 'image/jpg'),
      )
      .then((taskSnapshot) => taskSnapshot.ref.getDownloadURL());
}
