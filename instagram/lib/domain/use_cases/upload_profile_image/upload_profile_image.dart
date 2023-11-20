import 'package:either_dart/either.dart';
import 'package:instagram/data/data_sources/image_upload.dart';
import 'package:instagram/data/data_sources/image_upload_firebase.dart';
import 'package:instagram/domain/failures/failures.dart';
import 'package:instagram/domain/use_cases/upload_profile_image/upload_profile_image_params.dart';
import 'package:instagram/domain/use_cases/use_case_base.dart';

class UploadProfileImage implements UseCaseBase<String, UploadProfileImageParams> {
  UploadProfileImage({
    ImageUpload? imageUpload,
  }) : _imageUpload = imageUpload ?? ImageUploadFirebase();

  final ImageUpload _imageUpload;

  @override
  Future<Either<Failure, String>> call(UploadProfileImageParams params) async {
    try {
      final profileImageUrl = await _imageUpload.uploadProfileImage(
        params.profileImage,
        url: params.profileImageUrl,
      );
      return Right(profileImageUrl);
    } on Exception catch (e) {
      return Left(ServerFailure(stackTrace: e.toString()));
    }
  }
}
